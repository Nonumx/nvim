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

  -- noice.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end
      require("noice").setup(opts)
    end,
  },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },
}
