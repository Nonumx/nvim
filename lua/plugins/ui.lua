local add = MiniDeps.add

-- 状态栏
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
  extensions = { "nvim-tree", "mason" },
})
