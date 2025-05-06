-- 颜色主题
return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000,
  lazy = false,
  opts = function()
    vim.cmd("colorscheme rose-pine")
  end,
}
