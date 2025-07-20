-- [[ 插件管理器 ]]
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.deps"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.deps`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.deps",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.deps | helptags ALL")
  vim.cmd('echo "Installed `mini.deps`" | redraw')
end
-- 配置 mini.deps
require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- [[ 基本配置 ]]
now(function()
  require("config.options")
  require("config.keymaps")
  require("config.autocmds")
end)

-- [[ 颜色主题 ]]
now(function()
  add({ source = "rebelot/kanagawa.nvim" })
  require("kanagawa")
  vim.cmd("colorscheme kanagawa")
end)

-- [[ UI ]]
now(function()
  require("plugins.ui")
end)

-- [[ 通用库 ]]
later(function()
  add({ source = "nvim-lua/plenary.nvim" })
end)

-- [[ Editor ]]
later(function()
  require("plugins.editor")
end)

-- [[ Coding ]]
later(function()
  require("plugins.coding")
end)

-- [[ LSP配置 ]]
later(function()
  require("plugins.lspconfig")
end)

-- [[ 代码格式化 ]]
later(function()
  add({ source = "stevearc/conform.nvim" })
  require("conform").setup({
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      cpp = { "clang-format" },
      python = { "ruff" },
    },
  })
  vim.keymap.set("n", "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, { desc = "Format buffer" })
end)

-- [[ Treesitter配置 ]]
later(function()
  add({
    source = "nvim-treesitter/nvim-treesitter",
    -- Use 'master' while monitoring updates in 'main'
    checkout = "master",
    monitor = "main",
    -- Perform action after every checkout
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })
  ---@diagnostic disable-next-line: missing-fields
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "json",
      "jsonc",
      "toml",
      "yaml",
      "cpp",
      "python",
      "cmake",
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end)

-- [[ Markdown 渲染 ]]
later(function()
  add({ source = "OXY2DEV/markview.nvim" })
  require("markview").setup({
    preview = {
      icon_provider = "mini",
      filetypes = { "markdown", "codecompanion" },
      ignore_buftypes = {},
    },
  })
end)

-- [[ AI Coding ]]
later(function()
  add({ source = "olimorris/codecompanion.nvim" })
  local spinner = require("plugins.codecompanion.spinner")
  spinner:init()
  require("codecompanion").setup({
    adapters = {
      deepseek = function()
        return require("codecompanion.adapters").extend("deepseek", {
          schema = {
            model = {
              default = "deepseek-chat",
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "deepseek",
      },
      inline = {
        adapter = "deepseek",
      },
    },
    display = {
      chat = {
        window = {
          position = "right",
          width = 0.3,
        },
      },
    },
    send = {
      callback = function(chat)
        vim.cmd("stopinsert")
        chat:submit()
        chat:add_buf_message({ role = "llm", content = "" })
      end,
      index = 1,
      description = "Send",
    },
  })
end)
