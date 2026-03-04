local add, later = MiniDeps.add, MiniDeps.later

-- 快捷键提示
later(function()
  add({ source = "folke/which-key.nvim" })
  require("which-key").setup({ preset = "helix" })
  vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
  end, { desc = "Buffer Local Keymaps (which-key)" })
end)

-- Git状态
later(function()
  add({ source = "lewis6991/gitsigns.nvim" })
  require("gitsigns").setup({ trouble = true })
end)

-- 进度条显示
later(function()
  add({ source = "j-hui/fidget.nvim" })
  require("fidget").setup({})
end)
