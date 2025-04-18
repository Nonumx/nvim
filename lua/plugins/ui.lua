return {
  -- 图标库
  {
    "echasnovski/mini.icons",
    opts = {},
  },
  -- UI组件库
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      terminal = { enabled = true },
    },
    keys = {
      {
        "<leader>tt",
        function()
          Snacks.terminal("pwsh.exe")
        end,
        desc = "Toggle Terminal",
      },
    },
  },
  -- 状态栏
  {
    "echasnovski/mini.statusline",
    event = "UiEnter",
    opts = {},
  },
}
