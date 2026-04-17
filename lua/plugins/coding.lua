local add, later = MiniDeps.add, MiniDeps.later

-- 自动配对
later(function()
  add({ source = "nvim-mini/mini.pairs" })
  require("mini.pairs").setup({})
end)

-- 补全引擎
later(function()
  add({
    source = "saghen/blink.cmp",
    checkout = "v1.10.2",
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
end)

-- 根据文本判断 tab 缩进
later(function()
  add({ source = "nmac427/guess-indent.nvim" })
  require("guess-indent").setup({})
end)

-- Code Action
later(function()
  add({
    source = "rachartier/tiny-code-action.nvim",
  })

  local plugin = require("tiny-code-action")
  plugin.setup({
    backend = "delta",
  })

  vim.keymap.set(
    { "n", "x" },
    "<leader>ca",
    plugin.code_action,
    { noremap = true, silent = true, desc = "Code Action" }
  )
end)
