-- [[ 颜色主题 ]]
return {
  "Mofiqul/dracula.nvim",
  lazy = false, -- 在启动时就加载这个插件
  priority = 1000, -- 在加载其他插件前加载主题
  config = function()
    vim.cmd([[colorscheme dracula]])
  end,
}

