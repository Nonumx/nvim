return {
  mason = {
    lsp = { "clangd" },
    dap = { "codelldb" },
    linter = {},
    formatter = { "clang-format" },
  },

  conform = {
    formatters_by_ft = {
      cpp = { "clang-format" },
    },
  },

  lspconfig = {
    clangd = {
      cmd = {
        "clangd",
        "--background-index",
        "--header-insertion=never",
        "--clang-tidy",
        "--log=error",
      },
    },
  },
}
