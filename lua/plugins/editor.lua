local add, later = MiniDeps.add, MiniDeps.later

-- 快捷键提示
later(function()
  add({ source = "folke/which-key.nvim" })
  require("which-key").setup({ preset = "helix" })

  local wk = require("which-key")
  wk.add({
    { "<leader>c", group = "code" },
    { "<leader>f", group = "find" },
    { "<leader>s", group = "search" },
    { "<leader><space>", icon = MiniIcons.get("filetype", "TelescopePrompt") },
    { "<leader>/", icon = MiniIcons.get("filetype", "TelescopePrompt") },
  })

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

  local function nvim_tree_on_attach(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    api.map.on_attach.default(bufnr)

    local function edit_or_open()
      local node = api.tree.get_node_under_cursor()
      if node.type == "directory" then
        -- 目录：展开/收起
        api.node.open.edit()
      else
        -- 文件：打开，并把焦点交给文件窗口
        api.node.open.edit()
      end
    end

    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "l", edit_or_open, opts("Open Or Expand"))
  end

  require("nvim-tree").setup({
    filters = {
      dotfiles = false,
      git_ignored = false,
      custom = { "^.git$" },
    },
    on_attach = nvim_tree_on_attach,
  })

  vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<cr>", { desc = "File Explorer" })
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
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags", silent = true })

  vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "LSP: Goto Definitions" })
end)

-- 任务运行
later(function()
  add({ source = "stevearc/overseer.nvim" })
  require("overseer").setup()
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

-- Lazygit集成
later(function()
  add({ source = "kdheepak/lazygit.nvim", depends = {
    "nvim-lua/plenary.nvim",
  } })
  vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Toggle Lazygit", silent = true })
end)

-- 单词高亮
later(function()
  add({ source = "nvim-mini/mini.cursorword" })
  require("mini.cursorword").setup()
end)

-- 丝滑滚动
later(function()
  add({ source = "karb94/neoscroll.nvim" })
  require("neoscroll").setup({})
end)
