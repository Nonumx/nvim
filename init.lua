local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath, })
end
vim.opt.rtp:prepend(lazypath)

-- 在 lazy 初始化前设置 leader 键
vim.g.mapleader = " "

require("lazy").setup({
  spec = {
    { import = "plugin" },
  },
  checker = { enabled = true }, -- 自动检测插件更新
  performance = {
    rtp = {
      -- 禁止 vim 内置插件
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("config")
