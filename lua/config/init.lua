require('mini.basics').setup({
  mappings = {
    windows = true,
  },
  silent = true,
})

-- options
-- <leader> 键位设置
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt

-- 缩进
o.tabstop = 2
o.shiftwidth = 0
o.expandtab = true

-- keymaps
-- vim.keymap.set 缩写
local map = vim.keymap.set

-- 使用分号代替冒号（少按一个 <Shift> 键）
map("n", ";", ":", { desc = "CMD enter command mode" })

-- quit
map({ "n" }, "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })
