return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "clangd",
        "clang-format",
      })
      return opts
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cpp = "clang-format",
      },
    },
  },
}
