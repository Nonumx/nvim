-- <leader> 键位设置
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- rtp 优化
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_rrhelper = 1
-- vim.g.loaded_netrwPlugin = 1

-- options
local o = vim.opt

-- 缩进
o.tabstop = 2
o.shiftwidth = 0 -- 复用 tabstop
o.expandtab = true

-- 状态栏
o.laststatus = 3 -- 全局状态栏
o.showmode = false -- 不进行状态模式回显
o.showcmd = false -- 不进行快捷键回显

-- keymaps
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })

map("n", "<esc>", "<cmd>noh<cr>", { desc = "Clear Search Highlight" })
