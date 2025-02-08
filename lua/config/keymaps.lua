-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- w键坏了，用 ctrl+s 代替保存功能
vim.keymap.set({ "n", "i" }, "<C-s>", "<cmd>:w<CR>")

-- 启用 ctrl+c 和 ctrl+v 进行复制粘贴
vim.keymap.set("v", "<C-c>", '"+y')
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", '<esc>"+pi')

-- 免去按 <Shift> 的问题（我这键盘 <Shift> 也不灵敏）
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
