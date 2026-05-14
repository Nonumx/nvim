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

  -- 恢复编辑会话
  {
    "olimorris/persisted.nvim",
    event = "BufReadPre",
    opts = {},
  },
}
