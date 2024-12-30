return {
  -- 自动检测 tabstop 和 shiftwidth 设置
  "tpope/vim-sleuth",

  -- 注释高亮插件
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- 普通行号与相对行号切换
  "sitiom/nvim-numbertoggle",

  -- 快捷键提示
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
    },
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
}
