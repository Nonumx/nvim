return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000, -- load before other plugins
    config = function()
      require('onedark').load()
    end
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependcies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    }
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ui = {
          icons = {
            -- The list icon to use for installed packages.
            package_installed = "󰄬", -- nf-md-check
            -- The list icon to use for packages that are installing, or queued for installation.
            package_pending = "󱦟", -- nf-md-timer_sand_complete
            -- The list icon to use for packages that are not installed.
            package_uninstalled = "󰅖", -- nf-md-close
        },
      }
    },
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({})
    end
  }
}
