if true then
  return {}
end

return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts lspconfig.opts
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "vtsls", "biome" })
      return vim.tbl_deep_extend("force", opts, {
        servers = {
          vtsls = {},
        },
      })
    end,
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
