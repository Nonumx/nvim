local add, later = MiniDeps.add, MiniDeps.later

-- 自动配对
later(function()
  add({ source = "echasnovski/mini.pairs" })
  require("mini.pairs").setup()
end)

-- 词组括号
later(function()
  add({ source = "echasnovski/mini.surround" })
  require("mini.surround").setup()
end)

-- 补全引擎
later(function()
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
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
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
end)

-- Neovim配置开发
later(function()
  add({ source = "folke/lazydev.nvim" })
  require("lazydev").setup({
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "mini.deps", words = { "MiniDeps" } },
      },
    },
  })
end)

-- 根据文本判断 tab 缩进
later(function()
  add({ source = "nmac427/guess-indent.nvim" })
  require("guess-indent").setup({})
end)
