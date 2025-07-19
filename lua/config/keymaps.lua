local map = vim.keymap.set

-- 普通模式下通过 <esc> 关闭搜索高亮
map("n", "<esc>", "<cmd>noh<cr>")

-- 鼠标选中后 <Ctrl-c> 复制到系统剪贴板
map("v", "<C-c>", '"+y')
-- 普通模式或选中时，<Ctrl-v> 粘贴系统剪贴板
map({ "n", "v" }, "<C-v>", '"+p')
map("i", "<C-v>", '<esc>"+p')

-- 使用 <Ctrl-[hjkl]> 移动光标到窗口
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- 使用分号代替冒号（少按一个 <Shift> 键）
map("n", ";", ":", { desc = "CMD enter command mode" })

-- 保存文件
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- LSP快捷键
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
