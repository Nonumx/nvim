local add = MiniDeps.add

add({ source = "stevearc/conform.nvim" })

require("conform").setup({
  notify_on_error = false,
  format_on_save = {
    timeout_ms = 500,
  },
  formatters_by_ft = {
    lua = { "stylua" },
    cpp = { "clang-format" },
    python = { "ruff" },
  },
})
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })
