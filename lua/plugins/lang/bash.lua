if true then
  return {}
end

return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts lspconfig.opts
    opts = function(_, opts)
      opts.ensure_installed =
        vim.list_extend(opts.ensure_installed or {}, { "bash-language-server", "shfmt", "shellcheck" })
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        bash = { "shfmt" },
      },
    },
  },
}
