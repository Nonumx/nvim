local add = MiniDeps.add
local map = vim.keymap.set

add({ source = "folke/snacks.nvim" })
require("snacks").setup({
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  picker = { enabled = true },
  scope = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
})

-- 使用 picker 搜索
map("n", "<leader><space>", function()
  Snacks.picker.smart()
end, { desc = "Find Files" })
map("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep Files" })
map("n", "<leader>:", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })
map("n", "<leader>n", function()
  Snacks.picker.notifications()
end, { desc = "Notification History" })

-- 文件管理器
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "File Explorer" })

-- LSP
map("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "[LSP] Goto Definition" })
map("n", "gD", function()
  Snacks.picker.lsp_declarations()
end, { desc = "[LSP] Goto Declaration" })

-- Git
map("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })
