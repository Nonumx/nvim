return {
  -- [[ 快捷键 ]]
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  -- [[ 资源管理器 ]]
  {
    "nvim-tree/nvim-tree.lua",
    opts = {},
    keys = {
      {
        "<leader>e",
        "<cmd>NvimTreeFocus<cr>",
        desc = "Open File Explorer",
      },
    },
  },
}

