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

-- [[ 安装插件 ]]
now(function()
  -- [[ 图标库 ]]
  add({ source = "echasnovski/mini.icons" })
  add({ source = "nvim-tree/nvim-web-devicons" })

  -- [[ 通用库 ]]
  add({ source = "nvim-lua/plenary.nvim" })

  -- [[ 组件库 ]]
  add({ source = "MunifTanjim/nui.nvim" })

  -- [[ 通知组件 ]]
  add({ source = "rcarriga/nvim-notify" })

  -- [[ 颜色主题 ]]
  add({ source = "everviolet/nvim", name = "evergarden" })

  -- [[ 状态栏、标签栏 ]]
  add({ source = "rebelot/heirline.nvim" })

  -- [[ LSP管理器 ]]
  add({ source = "mason-org/mason.nvim" })
  add({ source = "mason-org/mason-lspconfig.nvim" })
  add({ source = "neovim/nvim-lspconfig" })

  -- [[ treesitter ]]
  add({
    source = "nvim-treesitter/nvim-treesitter",
    -- Use 'master' while monitoring updates in 'main'
    checkout = "master",
    monitor = "main",
    -- Perform action after every checkout
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })

  -- [[ telescope ]]
  add({
    source = "nvim-telescope/telescope.nvim",
    checkout = "0.1.8",
    depends = { "nvim-telescope/telescope-fzf-native.nvim" },
  })

  -- [[ 格式化插件 ]]
  add({ source = "stevearc/conform.nvim" })

  -- [[ 快捷键提示 ]]
  add({ source = "folke/which-key.nvim" })

  -- [[ Git状态 ]]
  add({ source = "lewis6991/gitsigns.nvim" })
  -- [[ 自动保存 ]]
  add({ source = "okuuva/auto-save.nvim" })
  -- [[ 文件管理器 ]]
  add({ source = "nvim-tree/nvim-tree.lua" })

  -- [[ 自动配对 ]]
  add({ source = "echasnovski/mini.pairs" })
  -- [[ 快速环绕 ]]
  add({ source = "echasnovski/mini.surround" })
  -- [[ 补全引擎 ]]
  add({
    source = "saghen/blink.cmp",
    checkout = "v1.6.0",
    depends = { "rafamadriz/friendly-snippets" },
  })
end)

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
later(function()
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
