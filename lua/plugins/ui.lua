return {
  -- 图标库
  {
    "nvim-mini/mini.icons",
    priority = 1000,
    lazy = false,
    opts = {
      lsp = {
        error = { glyph = "" },
        warn = { glyph = "" },
        info = { glyph = "" },
        hint = { glyph = "" },
      },
      filetype = {
        code = { glyph = "", hl = "MiniIconsOrange" },
      },
    },
    config = function(_, opts)
      require("mini.icons").setup(opts)
      MiniIcons.mock_nvim_web_devicons()
    end,
  },

  -- QoL plugins for Neovim
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
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
    },
    keys = {
      {
        "<leader><space>",
        function()
          Snacks.picker.smart()
        end,
        desc = "Find Files",
      },
      {
        "<leader>/",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep Files",
      },
      {
        "<leader>n",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Notification History",
      },
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit",
      },
    },
  },

  -- 状态栏
  {
    "nvim-mini/mini.statusline",
    opts = {},
  },

  -- zpack 插件面板
  {
    "sairyy/zshow.nvim",
    keys = {
      { "<leader>z", "<cmd>ZShow<cr>", desc = "View installed plugins" },
    },
    cmd = "ZShow",
  },
}
