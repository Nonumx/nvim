return {
  -- 图标库
  {
    "nvim-mini/mini.icons",
    priority = 1000,
    lazy = false,
    opts = {
      lsp = {
        error = { glyph = "" },
        warn = { glyph = "" },
        info = { glyph = "" },
        hint = { glyph = "" },
      },
    },
    config = function(_, opts)
      require("mini.icons").setup(opts)
      MiniIcons.mock_nvim_web_devicons()
    end,
  },

  -- zpack 插件面板
  {
    "sairyy/zshow.nvim",
    keys = {
      { "<leader>z", "<cmd>ZShow<cr>", desc = "View installed plugins" },
    },
    cmd = "ZShow",
  },
}
