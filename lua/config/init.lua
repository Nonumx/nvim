local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add({ source = "nvim-mini/mini.basics" })
  require("mini.basics").setup({
    mappings = {
      windows = true,
    },
    silent = true,
  })

  -- options
  local o = vim.opt

  -- 缩进
  o.tabstop = 2
  o.shiftwidth = 0 -- 复用 tabstop
  o.expandtab = true

  -- 状态栏
  o.laststatus = 3 -- 全局状态栏
  o.showcmd = false -- 不进行快捷键回显

  o.timeoutlen = 300

  -- keymaps
  local map = vim.keymap.set

  map("n", ";", ":", { desc = "CMD enter command mode" })

  map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })

  map("n", "<esc>", "<cmd>noh<cr>")
end)
