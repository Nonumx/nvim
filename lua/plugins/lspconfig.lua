-- LSP配置
return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", opts = {} },
    },
    opts = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("gr", vim.lsp.buf.references, "Show references")

          map("<leader>D", vim.lsp.buf.type_definition, "Go to type definition")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "v" })

          map("<F2>", vim.lsp.buf.rename, "Rename")
        end,
      })

      return {}
    end,
    config = function(_, opts)
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
      },
    },
    cmd = "MasonToolsInstall",
  },
}
