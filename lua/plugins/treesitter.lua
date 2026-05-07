return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({})

    local augroup = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

    -- 根据文件类型自动安装 treesitter 解析器并启用功能
    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      pattern = "*",
      callback = function(args)
        local ft = args.match
        if ft == "" then
          return
        end

        -- 获取所有可用的 treesitter 语言
        local ts = require("nvim-treesitter")
        local langs = ts.get_available()

        -- 查找与当前文件类型匹配的解析器名称
        local target_lang = nil
        for _, lang in ipairs(langs) do
          -- 先尝试直接匹配（大多数文件类型名 = 解析器名）
          if lang == ft then
            target_lang = lang
            break
          end
          -- 再通过 Neovim 内置的 treesitter 语言注册表查找
          local fts_ok, fts = pcall(vim.treesitter.language.get_filetypes, lang)
          if fts_ok and fts and vim.tbl_contains(fts, ft) then
            target_lang = lang
            break
          end
        end

        if target_lang then
          -- 检查是否已安装
          local installed = ts.get_installed("parsers")
          if not vim.tbl_contains(installed, target_lang) then
            -- 异步安装（不阻塞编辑体验）
            ts.install({ target_lang })
          end
        end

        -- 为当前 buffer 启用 treesitter 语法高亮（Neovim 内置 API）
        pcall(vim.treesitter.start, args.buf)

        -- 启用 treesitter 缩进（由 nvim-treesitter 提供）
        pcall(function()
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end)
      end,
    })
  end,
}
