return {
  -- 图标库
  {
    "echasnovski/mini.icons",
    event = "VeryLazy",
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
      explorer = { replace_netrw = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      terminal = { terminal = "pwsh.exe" },
    },
    keys = {
      -- Top Pickers & Explorer
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Picker: Smart Find Files",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep()
        end,
        desc = "Picker: Grep Workspace",
      },
      {
        "<leader>:",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Picker: Command History",
      },
      {
        "<leader>n",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Picker: Notification History",
      },
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
      {
        "<leader>tt",
        function()
          Snacks.terminal()
        end,
        desc = "Toggle Terminal",
      },
    },
  },
  -- 状态栏
  {
    "echasnovski/mini.statusline",
    event = "VeryLazy",
    opts = {},
  },
}
