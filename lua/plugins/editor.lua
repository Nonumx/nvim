-- 快捷键提示
require("which-key").setup({ preset = "helix" })

local wk = require("which-key")
wk.add({
  { "<leader>c", group = "code", icon = MiniIcons.get("filetype", "code") },
  { "<leader>e", icon = MiniIcons.get("filetype", "neo-tree") },
  { "<leader><space>", icon = MiniIcons.get("filetype", "TelescopePrompt") },
  { "<leader>/", icon = MiniIcons.get("filetype", "TelescopePrompt") },
})

vim.keymap.set("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })

-- Git状态
require("gitsigns").setup({})

-- 进度条显示
require("fidget").setup({})

-- 文件资源管理器
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

-- 缩进作用域高亮
require("blink.indent").setup({})

-- Telescope
require("telescope").setup({
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})
require("telescope").load_extension("ui-select")

local telescope = require("telescope.builtin")

vim.keymap.set("n", "<leader><space>", telescope.find_files, { desc = "Find Files", silent = true })
vim.keymap.set("n", "<leader>/", telescope.live_grep, { desc = "Live Grep", silent = true })

vim.keymap.set("n", "gd", telescope.lsp_definitions, { desc = "LSP: Goto Definitions" })

-- 任务运行
require("overseer").setup({})

-- 自动保存
require("auto-save").setup({
  -- 离开 buffer 或失去焦点时保存
  trigger_events = {
    immediate_save = { "BufLeave", "FocusLost" },
    defer_save = {},
    cancel_deferred_save = {},
  },
})

-- 单词高亮
require("mini.cursorword").setup({})

-- 丝滑滚动
require("neoscroll").setup({})
