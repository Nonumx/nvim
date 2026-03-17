return {
  mason = {
    lsp = { "basedpyright", "ruff" },
    dap = { "debugpy" },
    linter = {},
    formatter = {},
  },

  conform = {
    formatters_by_ft = {
      python = { "ruff" },
    },
  },

  lspconfig = {},
}
