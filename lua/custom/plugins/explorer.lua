-- 文件资源管理器
return {
  {
    "stevearc/oil.nvim",
    opts = function()
      vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open File Explorer" })
      return {}
    end,
  },
}
