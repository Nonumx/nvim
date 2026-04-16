-- 自动配对
require("mini.pairs").setup()

-- 补全引擎
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

-- 根据文本判断 tab 缩进
require("guess-indent").setup({})

-- Code Action
local tiny_ca = require("tiny-code-action")
tiny_ca.setup({
  backend = "delta",
})

vim.keymap.set({ "n", "x" }, "<leader>ca", tiny_ca.code_action, { noremap = true, silent = true, desc = "Code Action" })
