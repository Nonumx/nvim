local add = MiniDeps.add

-- [[ 自动配对 ]]
add({ source = "echasnovski/mini.pairs" })
require("mini.pairs").setup()

-- [[ 快速环绕 ]]
add({ source = "echasnovski/mini.surround" })
require("mini.surround").setup()

-- [[ 补全引擎 ]]
add({
  source = "saghen/blink.cmp",
  checkout = "v1.6.0",
  depends = { "rafamadriz/friendly-snippets" },
})
require("blink.cmp").setup({
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
})
