local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- 图标库
now(function()
  add({ source = "nvim-mini/mini.icons" })
  require("mini.icons").setup({
    lsp = {
      error = { glyph = "󰅚" },
      warn = { glyph = "󰀪" },
      info = { glyph = "󰋽" },
      hint = { glyph = "󰌶" },
    },
    filetype = {
      code = { glyph = "󰗀", hl = "MiniIconsOrange" },
    },
  })
  MiniIcons.mock_nvim_web_devicons()
end)

-- 通知
now(function()
  add({ source = "nvim-mini/mini.notify" })
  require("mini.notify").setup({
    lsp_progress = {
      enable = false,
    },
  })
end)

-- 状态栏
later(function()
  add({ source = "nvim-mini/mini.statusline" })
  require("mini.statusline").setup({})
end)
