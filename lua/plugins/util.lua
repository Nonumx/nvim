return {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "MunifTanjim/nui.nvim", lazy = true },
  -- 括号匹配
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
  -- 注释
  { "numToStr/Comment.nvim", opts = {}, lazy = false },
  -- 通知窗口
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.40)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.40)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
  }
}
