-- 图标库
require("mini.icons").setup({
  lsp = {
    error = { glyph = "󰅚" },
    warn = { glyph = "󰀪" },
    info = { glyph = "󰋽" },
    hint = { glyph = "󰌶" },
  },
  filetype = {
    code = { glyph = "󰗀", hl = "MiniIconsAzure" },
  },
})
MiniIcons.mock_nvim_web_devicons()

-- 通知
require("mini.notify").setup({
  lsp_progress = {
    enable = false,
  },
})

-- 状态栏
require("mini.statusline").setup({})
