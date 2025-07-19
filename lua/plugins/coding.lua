local add = MiniDeps.add

-- [[ 自动配对 ]]
add({ source = "echasnovski/mini.pairs" })
-- [[ 快速环绕 ]]
add({ source = "echasnovski/mini.surround" })
-- [[ 补全引擎 ]]
add({
  source = "saghen/blink.cmp",
  checkout = "v1.5.1",
  depends = { "rafamadriz/friendly-snippets" },
})

require("mini.pairs").setup()
require("mini.surround").setup()

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
    per_filetype = {
      codecompanion = { "codecompanion" },
    },
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
