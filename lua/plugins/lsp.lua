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
    },
    config = function(_, opts)
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = has_cmp and cmp_nvim_lsp.default_capabilities() or {}
      local has_mlsp, mlsp = pcall(require, "mason-lspconfig")
      if has_mlsp then
        -- 通过 mason-lspconfig 自动加载 lsp 并将使用 nvim-cmp
        -- 作为 lsp 代码提示的引擎
        mlsp.setup_handlers({
          function(server_name)
            require("lspconfig")[server_name].setup({ capabilities = capabilities })
          end
        })
      end
    end
  }
}
