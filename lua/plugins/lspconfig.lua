-- LSP配置
return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
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

    return {
      servers = {
        lua_ls = {},
        basedpyright = {},
      },
    }
  end,
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      lspconfig[server].setup(config)
    end
  end,
}
