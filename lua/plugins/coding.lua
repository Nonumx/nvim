return {
  -- 自动括号配对
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "string" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = true,
      -- better deal with markdown code blocks
      markdown = true,
    },
  },

  -- 原生注释功能增强
  {
    "folke/ts-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- LSP功能
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      lightbulb = {
        enable = false,
      },
    },
    keys = function()
      vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", { desc = "[LSP] Code Action" })
      vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", { desc = "[LSP] Goto Definition" })
      vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga hover_doc<cr>", { desc = "[LSP] Hover Doc" })
      vim.keymap.set("n", "<F2>", "<cmd>Lspsaga rename<cr>", { desc = "[LSP] Rename" })

      return {
        {
          "<leader>t",
          "<cmd>Lspsaga term_toggle pwsh.exe<cr>",
          desc = "Open Float Terminal",
        },
      }
    end,
  },

  -- HTML标签自动回括
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  }
}
