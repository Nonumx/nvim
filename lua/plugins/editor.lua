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
