return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts lspconfig.opts
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "gopls" })
      return vim.tbl_deep_extend("force", opts, {
        servers = {
          gopls = {},
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "gopls" },
      },
    },
  },
}
