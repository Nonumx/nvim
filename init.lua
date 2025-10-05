-- [[ 插件管理器 ]]
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.deps"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.deps`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.deps",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.deps | helptags ALL")
  vim.cmd('echo "Installed `mini.deps`" | redraw')
end
-- 配置 mini.deps
require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- 安装通知插件
-- 先安装这个，后面安装插件就有回显
add({ source = "nvim-mini/mini.notify" })
require("mini.notify").setup({})
vim.notify = require("mini.notify").make_notify()

-- 图标库
add({ source = "nvim-mini/mini.icons" })
require("mini.icons").setup({})
require("mini.icons").mock_nvim_web_devicons()

-- 通用库
add({ source = "nvim-lua/plenary.nvim" })

-- [[ 基本配置 ]]
now(function()
  require("config.options")
  require("config.keymaps")
end)

-- [[ 颜色主题 ]]
now(function()
  require("plugins.colorschema")
end)

-- [[ 界面 ]]
now(function()
  require("plugins.ui")
end)

-- [[ 编辑器 ]]
later(function()
  require("plugins.editor")
end)

-- [[ Telescope ]]
later(function()
  require("plugins.telescope")
end)

-- [[ 编码 ]]
later(function()
  require("plugins.coding")
end)

-- [[ LSP配置 ]]
later(function()
  require("plugins.lspconfig")
end)

-- [[ 代码格式化 ]]
later(function()
  require("plugins.formatting")
end)

-- [[ Treesitter配置 ]]
later(function()
  require("plugins.treesitter")
end)
