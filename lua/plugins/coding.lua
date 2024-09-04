return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      handlers = {
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
      },
    },
  },
  -- LSP Utils
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {},
  },
  -- 格式化文本
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cpp = { "clang-format" },
      },
    },
  },
}
