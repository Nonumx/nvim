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
