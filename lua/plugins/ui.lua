local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- 图标库
now(function()
  add({ source = "nvim-mini/mini.icons" })
  require("mini.icons").setup({})
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
  })
  vim.cmd("colorscheme evergarden")
end)

-- snacks.nvim
now(function()
  local map = vim.keymap.set

  add({ source = "folke/snacks.nvim" })
  require("snacks").setup({
    bigfile = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
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

