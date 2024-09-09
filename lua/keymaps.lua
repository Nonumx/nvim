vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "打开资源管理器" })

vim.keymap.set("n", "<leader>bf", function() require("conform").format() end, { desc = "格式化缓冲区" })

-- Lspsaga 快捷键
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { desc = "Lspsaga - 转到定义" })
vim.keymap.set("n", "tt", "<cmd>Lspsaga term_toggle pwsh.exe<cr>", { desc = "Lspsaga - 打开终端" })

-- Clangd 快捷键
vim.keymap.set("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Clangd - 切换源码/头文件" })
