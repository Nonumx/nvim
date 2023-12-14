return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  -- 括号匹配
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  -- 注释
  { "numToStr/Comment.nvim", opts = { }, lazy = false }
}
