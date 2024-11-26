return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
        neocmake = {},
        ["clang-format"] = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cpp = { "clang-format" },
      },
    },
  },
}
