return {
  -- 快捷键提示
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
      spec = {
        mode = { "n", "x" },
        { "<leader>c", group = "code", icon = { icon = "", hl = "MiniIconsOrange" } },
        { "<leader>g", group = "git" },
        { "<leader>s", group = "search", icon = { icon = "", hl = "MiniIconsOrange" } },
        { "<leader><space>", icon = { icon = "", hl = "MiniIconsGreen" } },
        { "<leader>/", icon = { icon = "", hl = "MiniIconsGreen" } },
        { "<leader>e", icon = { icon = "󰙅", hl = "MiniIconsYellow" } },
        { "<leader>z", icon = { icon = "", hl = "MiniIconsPurple" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "z", group = "fold" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Keymaps (which-key)",
      },
    },
  },

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

  -- 任务运行
  {
    "stevearc/overseer.nvim",
    opts = {},
    cmd = "OverseerRun",
    keys = {
      { "<F5>", "<cmd>OverseerRun<cr>", desc = "Run Task" },
    },
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
}
