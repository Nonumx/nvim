require("conform").setup({
  notify_on_error = false,
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff" },
    rust = { "rust-analyzer" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
})

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })

vim.keymap.set("v", "<leader>cf", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format selection" })
