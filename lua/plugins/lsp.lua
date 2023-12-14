return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
  },
  { "williamboman/mason-lspconfig.nvim", opts = {} },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      },
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      }
    },
    config = function(_, opts)
    end
  }
}
