return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        eslint_d = {},
        prettierd = {},
        volar = {
          init_options = {
            vue = {
              hybridMode = true,
            },
          },
        },
        vtsls = {},
      },
      handlers = {
        vtsls = function()
          vim.print("Hello")
          local vv = require("lspconfig").vtsls
          local file = io.open("vtsls.txt", "w")
          if file then
            file:write(vim.inspect(vv))
          end
          vv.setup()
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "eslint_d" },
      },
    },
  },
}
