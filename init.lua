-- 插件列表
vim.pack.add({
  "https://github.com/nvim-mini/mini.basics",
  -- colorscheme
  "https://github.com/navarasu/onedark.nvim",
  -- ui
  "https://github.com/nvim-mini/mini.icons",
  "https://github.com/nvim-mini/mini.notify",
  "https://github.com/nvim-mini/mini.statusline",
  -- editor
  "https://github.com/folke/which-key.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/j-hui/fidget.nvim",
  {
    src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = vim.version.range("3"),
  },
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/saghen/blink.indent",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/stevearc/overseer.nvim",
  "https://github.com/okuuva/auto-save.nvim",
  "https://github.com/nvim-mini/mini.cursorword",
  "https://github.com/karb94/neoscroll.nvim",
  -- lspconfig
  "https://github.com/mason-org/mason.nvim",
  -- formatting
  "https://github.com/stevearc/conform.nvim",
  -- coding
  "https://github.com/nvim-mini/mini.pairs",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1"),
  },
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/nmac427/guess-indent.nvim",
  "https://github.com/rachartier/tiny-code-action.nvim",
  -- neotest
  "https://github.com/nvim-neotest/neotest",
  "https://github.com/nvim-neotest/nvim-nio",
  -- python
  "https://github.com/linux-cultist/venv-selector.nvim",
})

require("config")
require("plugins.colorscheme")
require("plugins.ui")
require("plugins.editor")
require("plugins.lspconfig")
require("plugins.formatting")
require("plugins.coding")
require("plugins.neotest")
