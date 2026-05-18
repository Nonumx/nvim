return {
  -- 自动配对
  {
    "nvim-mini/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },

  -- 括号回绕
  {
    "nvim-mini/mini.surround",
    event = "InsertEnter",
    opts = {},
  },

  -- 补全引擎
  {
    "saghen/blink.cmp",
    sem_version = "^1",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = {
        preset = "super-tab",
        ["<CR>"] = { "accept", "fallback" },
      },
      appearance = {
        nerd_font_variant = "normal",
      },
      signature = { enabled = true },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
        },
        menu = {
          draw = {
            columns = {
              { "kind_icon", "label" },
              { "kind" },
            },
          },
        },
      },
    },
  },

  -- neovim 开发
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "mini.icons", words = { "MiniIcons" } },
      },
    },
  },
}
