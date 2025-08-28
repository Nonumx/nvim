local add = MiniDeps.add

-- [[ 快捷键提示 ]]
add({ source = "folke/which-key.nvim" })
-- [[ Git状态 ]]
add({ source = "lewis6991/gitsigns.nvim" })
-- [[ 自动保存 ]]
add({ source = "okuuva/auto-save.nvim" })
-- [[ 文件管理器 ]]
add({ source = "nvim-tree/nvim-tree.lua" })

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
