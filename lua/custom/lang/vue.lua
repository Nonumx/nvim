return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["eslint-lsp"] = {},
        prettierd = {},
        volar = {},
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath("data")
                  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
                configNamespace = "typescript",
                enableForWorkspaceTypeScriptVersions = true,
              },
            },
          },
          filetypes = {
            "javascript",
            "typescript",
            "vue",
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "eslint-lsp", "prettierd" },
        typescript = { "eslint-lsp", "prettierd" },
        vue = { "eslint-lsp", "prettierd" },
      },
    },
  },
}
