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

        local ts = require("nvim-treesitter")
        local langs = ts.get_available()

        if not vim.tbl_contains(langs, ft) then
          return
        end

        local installed = ts.get_installed("parsers")
        if not vim.tbl_contains(installed, ft) then
          ts.install({ ft })
        end

        vim.treesitter.start(args.buf)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
