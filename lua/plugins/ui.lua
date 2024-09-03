return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  -- 标签栏
  {
    "akinsho/bufferline.nvim",
    version = "~4.7.0",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    keys = {
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "标记缓冲区" },
      { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "关闭未标记缓冲区" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "关闭其他缓冲区" },
      { "<ltrueeader>br", "<cmd>BufferLineCloseRight<cr>", desc = "关闭右侧缓冲区" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "关闭左侧缓冲区" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个缓冲区" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "下一个缓冲区" },
    },
  },
  -- 状态栏
  {
    "nvim-lualine/lualine.nvim",
    opts = {},
  },
  -- UI控件
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
}
