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
    version = "~2.12.2",
    opts = {},
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "lua",
          "query",
          "markdown", 
          "markdown_inline",
          "cpp",
          "python",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
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
}
