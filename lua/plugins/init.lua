return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000, -- load before other plugins
    config = function()
      require('onedark').load()
    end
  }
}
