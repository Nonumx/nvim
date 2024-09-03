return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {},
  },
  -- 资源管理器
  {
    "stevearc/oil.nvim",
    version = "~2.12.1",
    opts = {},
  },
  -- 模糊搜索
  {
    "nvim-telescope/telescope.nvim",
    version = "~0.1.8",
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "文件搜索" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "文本搜索" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "缓冲区搜索" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "tags搜索" },
    },
  },
  -- 缩进高亮,
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
      },
    },
  },
  -- 语法高亮
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "c",
          "cpp",
          "lua",
          "luadoc",
          "luap",
        },
      })
    end,
  },
}
