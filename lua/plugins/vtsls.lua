return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ensure_installed = { "vtsls", "biome" },
      servers = {
        vtsls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
      },
    },
  },
}

