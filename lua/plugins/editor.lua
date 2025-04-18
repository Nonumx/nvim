return {
  -- 快捷键
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- 文件资源管理器
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = function()
      vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

      return {}
    end,
    lazy = false,
  },
  -- Git状态
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = {},
  },
  -- 动效缩进
  {
    "echasnovski/mini.indentscope",
    event = "LazyFile",
    opts = {},
  },
}
