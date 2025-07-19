local add = MiniDeps.add

-- [[ 快捷键提示 ]]
add({ source = "folke/which-key.nvim" })
-- [[ 进度条 ]]
add({ source = "j-hui/fidget.nvim" })
-- [[ Git状态 ]]
add({ source = "lewis6991/gitsigns.nvim" })
-- [[ 顶部导航栏 ]]
add({ source = "Bekaboo/dropbar.nvim" })

require("which-key").setup({
  preset = "helix",
})

vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

require("fidget").setup()

require("gitsigns").setup({ trouble = true })

local dropbar_api = require("dropbar.api")
vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })

