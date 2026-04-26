return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    notify_on_error = false,
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff" },
      rust = { "rust-analyzer" },
      javascript = { "biome" },
      typescript = { "biome" },
      svelte = { "biome" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "Format buffer",
      mode = "n",
    },
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "Format selection",
      mode = "v",
    },
  },
}
