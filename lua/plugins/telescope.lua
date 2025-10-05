local add = MiniDeps.add

add({
  source = "nvim-telescope/telescope.nvim",
  checkout = "0.1.8",
  depends = { "nvim-telescope/telescope-fzf-native.nvim" },
})
require("telescope").setup({})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Find Files" })
