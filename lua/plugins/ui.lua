local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- 通知
now(function()
  add({ source = "nvim-mini/mini.notify" })
  require("mini.notify").setup({
    lsp_progress = {
      enable = false,
    },
  })
end)

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
  })
  require("mini.icons").mock_nvim_web_devicons()
end)

-- 颜色主题
now(function()
  add({ source = "everviolet/nvim", name = "evergarden" })
  require("evergarden").setup({
    theme = {
      variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
      accent = "green",
    },
    editor = {
      transparent_background = false,
      sign = { color = "none" },
      float = {
        color = "mantle",
        solid_border = false,
      },
      completion = {
        color = "surface0",
      },
    },
    overrides = function(colors)
      return {
        MiniCursorword = {
          bg = colors.surface1, -- 比 surface0 更明显的背景
        },
        MiniCursorwordCurrent = {
          bg = colors.surface2, -- 当前单词用更亮的背景
        },
      }
    end,
  })
  vim.cmd("colorscheme evergarden")
end)

-- 状态栏
later(function()
  add({ source = "nvim-lualine/lualine.nvim" })
  require("lualine").setup({
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_b = { "branch", { "filename", path = 1, symbols = { modified = "*", readonly = "" } } },
      lualine_c = {
        "%=", --[[ add your center components here in place of this comment ]]
      },
      lualine_x = {},
      lualine_y = { "filetype", "progress" },
      lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    extensions = { "mason" },
  })
end)
