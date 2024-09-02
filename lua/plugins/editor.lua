return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {

    },
  },
  -- 资源管理器
  {
    "stevearc/oil.nvim",
    lazy = false,
    version = "~2.12.1",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {

    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "打开Oil" },
    }
  },
  -- 模糊搜索
  {
    "nvim-telescope/telescope.nvim",
    version = "~0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "文件搜索" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "文本搜索" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "缓冲区搜索" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "tags搜索" },
    },
  },
  -- 编辑区高亮,
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {

    },
  },
}
