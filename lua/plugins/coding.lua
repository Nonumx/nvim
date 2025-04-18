return {
  -- 自动检测缓冲区缩进
  {
    "NMAC427/guess-indent.nvim",
    event = "LazyFile",
    opts = {},
  },
  -- 括号匹配
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    version = "*",
    opts = {},
  },
  -- 注释插件
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- HTML标签回括
  {
    "windwp/nvim-ts-autotag",
    ft = { "vue" },
    opts = {},
  },
  -- neovim配置编写
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  -- 代码补全
  {
    "echasnovski/mini.completion",
    event = "InsertEnter",
    dependencies = {
      "echasnovski/mini.snippets",
    },
    opts = {},
  },
}
