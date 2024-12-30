return {
  "navarasu/onedark.nvim",
  lazy = false, -- 在启动时就加载这个插件
  priority = 1000, -- 在加载其他插件前加载主题
  config = function()
    require("onedark").load()
  end
}
