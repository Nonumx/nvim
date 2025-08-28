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

-- [[ 基本配置 ]]
now(function()
  require("config.options")
  require("config.keymaps")
  require("config.autocmds")
end)

-- [[ 颜色主题 ]]
now(function()
  require("plugins.colorschema")
end)

-- [[ Utils ]]
now(function()
  require("plugins.utils")
end)

-- [[ UI ]]
now(function()
  require("plugins.ui")
end)

-- [[ Editor ]]
later(function()
  require("plugins.editor")
end)

-- [[ Telescope ]]
later(function ()
  require("plugins.telescope")
end)

-- [[ Coding ]]
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
