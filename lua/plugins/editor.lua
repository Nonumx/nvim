return {
  -- Git 状态
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = function()
      return {
        on_attach = function(buffer)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
          end

          -- stylua: ignore start
          map("n", "]h", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gs.nav_hunk("next")
            end
          end, "Next Hunk")
          map("n", "[h", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gs.nav_hunk("prev")
            end
          end, "Prev Hunk")
          map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
          map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
          map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
          map("n", "<leader>gB", function() gs.blame() end, "Blame Buffer")
          map("n", "<leader>gd", gs.diffthis, "Diff This")
        end,
      }
    end,
  },

  -- 进度条显示
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {},
  },

  -- 自动保存
  {
    "okuuva/auto-save.nvim",
    event = "VeryLazy",
    opts = {
      trigger_events = {
        immediate_save = { "BufLeave", "FocusLost" },
        defer_save = {},
        cancel_deferred_save = {},
      },
    },
  },

  -- 搜索/替换
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = { "GrugFar", "GrugFarWithin" },
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.open({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "x" },
        desc = "Search and Replace",
      },
    },
  },

  -- 文件管理器
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    lazy = false,
    keys = {
      { "-", "<cmd>Oil<cr>", { desc = "Open parent directory" } },
      { "<leader>e", "<cmd>Oil<cr>", { desc = "Open Explorer" } },
    },
  },

  -- fzf-lua
  {
    "ibhagwan/fzf-lua",
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields
    opts = {},
    keys = {
      { "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files" },
      { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
      { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
      {
        "<leader>fc",
        function()
          require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
      },
      { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
      { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Goto Symbol" },
    },
  },

  -- 终端管理
  {
    "akinsho/toggleterm.nvim",
    sem_version = "^2",
    cmd = { "ToggleTerm" },
    keys = {
      { "<leader>t", "<Cmd>ToggleTerm size=12 direction=horizontal<CR>", desc = "Terminal (Bottom)" },
      {
        "<leader>gg",
        function()
          if vim.fn.executable("lazygit") ~= 1 then
            vim.notify("lazygit is not installed", vim.log.levels.WARN)
            return
          end
          local git_root = vim.fs.root(0, ".git")
          if not git_root then
            vim.notify("Not in a git repository", vim.log.levels.WARN)
            return
          end
          local Term = require("toggleterm.terminal").Terminal
          local lazygit_term = Term:new({
            cmd = "lazygit",
            dir = git_root,
            direction = "float",
            hidden = true,
          })
          lazygit_term:toggle()
        end,
        desc = "Lazygit",
      },
    },
    opts = {
      size = 12,
      direction = "horizontal",
      shading_factor = 2,
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },
      on_create = function()
        vim.opt_local.foldcolumn = "0"
        vim.opt_local.signcolumn = "no"
      end,
    },
  },

  -- 快捷键提示
  {
    "nvim-mini/mini.clue",
    event = "VeryLazy",
    config = function()
      local miniclue = require("mini.clue")
      miniclue.setup({
        triggers = {
          -- Leader triggers
          { mode = { "n", "x" }, keys = "<Leader>" },

          -- `[` and `]` keys
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = { "n", "x" }, keys = "g" },

          -- Marks
          { mode = { "n", "x" }, keys = "'" },
          { mode = { "n", "x" }, keys = "`" },

          -- Registers
          { mode = { "n", "x" }, keys = '"' },
          { mode = { "i", "c" }, keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = { "n", "x" }, keys = "z" },
        },
        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.square_brackets(),
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
        delay = 300,
      })
    end,
  },
}
