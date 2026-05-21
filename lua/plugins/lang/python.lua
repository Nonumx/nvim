if true then
  return {}
end

return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts lspconfig.opts
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "basedpyright", "ruff" })
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff" },
      },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    ft = "python",
    keys = { { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Venv" } },
    opts = {
      options = {}, -- plugin-side options
      search = {}, -- custom search definitions
    },
  },
}
