local add, later = MiniDeps.add, MiniDeps.later

-- 快捷键提示
later(function()
  add({ source = "folke/which-key.nvim" })

  local wk = require("which-key")
  wk.setup({ preset = "helix" })

  wk.add({
    { "<leader>c", group = "code", icon = MiniIcons.get("filetype", "code") },
    { "<leader>ca", icon = MiniIcons.get("filetype", "code") },
    { "<leader>e", icon = MiniIcons.get("filetype", "neo-tree") },
    { "<leader><space>", icon = MiniIcons.get("filetype", "TelescopePrompt") },
    { "<leader>/", icon = MiniIcons.get("filetype", "TelescopePrompt") },
    { "<leader>/", icon = MiniIcons.get("filetype", "TelescopePrompt") },
  })

  vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
  end, { desc = "Buffer Local Keymaps (which-key)" })
end)

-- Git状态
later(function()
  add({ source = "lewis6991/gitsigns.nvim" })
  require("gitsigns").setup({})
end)

-- 进度条显示
later(function()
  add({ source = "j-hui/fidget.nvim" })
  require("fidget").setup({})
end)

-- 文件资源管理器
later(function()
  add({
    source = "nvim-neo-tree/neo-tree.nvim",
    checkout = "3.40.0",
    depends = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  })

  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  require("neo-tree").setup({
    source_selector = {
      winbar = true,
    },
    window = {
      mappings = {
        ["h"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        ["l"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" then
            if not node:is_expanded() then
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            elseif node:has_children() then
              require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
            end
          end
        end,
      },
    },
  })

  vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "File Explorer", silent = true })
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
      "nvim-telescope/telescope-ui-select.nvim",
    },
  })

  require("telescope").setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  })
  require("telescope").load_extension("ui-select")

  local builtin = require("telescope.builtin")

  vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Find Files", silent = true })
  vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Live Grep", silent = true })

  vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "LSP: Goto Definitions" })
end)

-- 任务运行
later(function()
  add({ source = "stevearc/overseer.nvim" })
  require("overseer").setup({})
end)

-- 自动保存
later(function()
  add({ source = "okuuva/auto-save.nvim" })
  require("auto-save").setup({
    -- 离开 buffer 或失去焦点时保存
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost" },
      defer_save = {},
      cancel_deferred_save = {},
    },
  })
end)

-- 单词高亮
later(function()
  add({ source = "nvim-mini/mini.cursorword" })
  require("mini.cursorword").setup({})
end)

-- 丝滑滚动
later(function()
  add({ source = "karb94/neoscroll.nvim" })
  require("neoscroll").setup({})
end)
