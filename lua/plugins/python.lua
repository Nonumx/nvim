return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ensure_installed = {
        "basedpyright",
        "ruff",
      },
      servers = {
        basedpyright = {},
        ruff = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff" },
      },
    },
  },
}
