-- 自动保存当前缓冲区内容：
-- 1. 当焦点离开 Neovim 窗口（FocusLost）
-- 2. 当切换到其他缓冲区（BufLeave）
-- 3. 当切换窗口（WinLeave）
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave", "WinLeave" }, {
  pattern = "*",
  callback = function()
    -- 如果缓冲区是可写的，且被修改过，则保存
    if vim.bo.modified then
      vim.cmd("silent! write")
    end
  end,
})
