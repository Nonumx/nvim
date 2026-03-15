local add, later = MiniDeps.add, MiniDeps.later

-- 快捷键提示
later(function()
  add({ source = "folke/which-key.nvim" })
  require("which-key").setup({ preset = "helix" })
  vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
  end, { desc = "Buffer Local Keymaps (which-key)" })
end)

-- Git状态
later(function()
  add({ source = "lewis6991/gitsigns.nvim" })
  require("gitsigns").setup({ trouble = true })
end)

-- 进度条显示
later(function()
  add({ source = "j-hui/fidget.nvim" })
  require("fidget").setup({})
end)

-- 文件资源管理器
later(function()
  add({ source = "nvim-tree/nvim-tree.lua" })

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require("nvim-tree").setup({
    filters = {
      dotfiles = false,
    },
  })

  vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File Explorer" })
end)

-- 代码缩进
later(function()
  add({ source = "saghen/blink.indent" })
  require("blink.indent").setup({})
end)

-- Telescope
later(function()
  add({
    source = "nvim-telescope/telescope.nvim",
    depends = {
      "nvim-lua/plenary.nvim",
      {
        source = "nvim-telescope/telescope-fzf-native.nvim",
        hooks = {
          post_checkout = function()
            vim.cmd("make")
          end,
        },
      },
    },
  })
  require("telescope").setup({})
end)
