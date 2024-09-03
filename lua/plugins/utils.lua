return {
  -- 会话管理
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "恢复会话" },
      { "<leader>qS", function() require("persistence").select() end, desc = "选择会话" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "恢复上一次会话" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "不保存这一次会话" },
    },
  },
  -- 图标包
  "nvim-tree/nvim-web-devicons",
  -- 通用库
  "nvim-lua/plenary.nvim",
}
