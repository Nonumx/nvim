require("which-key").setup({ preset = "helix" })
vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

require("gitsigns").setup({ trouble = true })

require("auto-save").setup({
  trigger_events = {
    defer_save = {},
    cancel_deferred_save = {},
  }, -- 禁用延迟保存的功能
})

require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "nvim-tree: toggle" })
