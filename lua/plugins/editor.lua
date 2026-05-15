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
      "-",
      "<cmd>Oil<cr>",
      { desc = "Open parent directory" },
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
      { "<leader><space>", "<cmd>FzfLua files", desc = "Find Files" },
      { "<leader>/", "<cmd>FzfLua live_grep", desc = "Grep" },
      { "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
      {
        "<leader>fc",
        function()
          require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
        end,
        desc = "Find Config File",
      },
      { "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
      { "<leader>ss", "<cmd>FzfLua lsp_document_symbols", desc = "Goto Symbol" },
    },
  },
}
