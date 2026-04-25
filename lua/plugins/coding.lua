return {
  -- 自动配对
  {
    "nvim-mini/mini.pairs",
    event = "InsertEnter",
    opts = {},
  },

  -- 补全引擎
  {
    "saghen/blink.cmp",
    version = "v1.10.2",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      keymap = {
        preset = "super-tab",
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

  -- 根据文本判断 tab 缩进
  {
    "nmac427/guess-indent.nvim",
    event = "BufReadPre",
    opts = {},
  },

  -- Code Action
  {
    "rachartier/tiny-code-action.nvim",
    opts = {
      backend = "delta",
    },
    keys = {
      { "<leader>ca", desc = "Code Action", mode = { "n", "x" } },
    },
  },

  -- Rust LSP 支持（打开 Rust 文件时触发）
  -- 替代默认的 rust-analyzer lspconfig 启动
  {
    "mrcjkb/rustaceanvim",
    version = "v9.0.2",
    ft = "rust",
  },
}
