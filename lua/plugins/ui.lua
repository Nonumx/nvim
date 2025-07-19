local add = MiniDeps.add

-- [[ 图标库 ]]
add({ source = "echasnovski/mini.icons" })
-- [[ 状态栏 ]]
add({ source = "echasnovski/mini.statusline" })
-- [[ snacks.nvim ]]
add({ source = "folke/snacks.nvim" })

require("mini.icons").setup()

require("mini.statusline").setup()

require("snacks").setup({
  explorer = { replace_netrw = true },
  input = { enabled = true },
  notifier = { enabled = true },
  picker = { enabled = true },
  indent = { enabled = true },
  scope = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
})
local map = vim.keymap.set

map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "File Explorer" })

map("n", "<leader>n", function()
  Snacks.picker.notifications()
end, { desc = "Picker: Notification History" })

map("n", "<leader><space>", function()
  Snacks.picker.smart()
end, { desc = "Picker: Smart Find Files" })

map("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Picker: Grep Workspace" })
