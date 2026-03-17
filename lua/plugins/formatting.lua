local add, later = MiniDeps.add, MiniDeps.later

later(function()
  add({ source = "stevearc/conform.nvim" })

  local config = require("plugins.lang"):get_config()

  require("conform").setup({
    notify_on_error = false,
    formatters_by_ft = config.conform.formatters_by_ft,
  })

  vim.keymap.set("n", "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, { desc = "Format buffer" })

  vim.keymap.set("v", "<leader>cf", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, { desc = "Format selection" })
end)
