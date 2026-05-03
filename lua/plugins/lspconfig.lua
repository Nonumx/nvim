---@class lspconfig.opts
---@field ensure_installed string[]
---@field servers table<string, vim.lsp.Config>

return {
  -- LSP 管理器
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "mason-org/mason.nvim",
    },
    ---@type lspconfig.opts
    opts = {
      ensure_installed = {},
      servers = {},
    },
    config = function(_, opts)
      require("mason").setup({
        ui = {
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
          },
        },
      })

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = MiniIcons.get("lsp", "error"),
            [vim.diagnostic.severity.WARN] = MiniIcons.get("lsp", "warn"),
            [vim.diagnostic.severity.INFO] = MiniIcons.get("lsp", "info"),
            [vim.diagnostic.severity.HINT] = MiniIcons.get("lsp", "hint"),
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspKeymaps", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          if client.server_capabilities.definitionProvider then
            vim.keymap.set("n", "gd", function()
              Snacks.picker.lsp_definitions()
            end, { buffer = bufnr, desc = "Goto Definition", silent = true })
          end

          if client.server_capabilities.referencesProvider then
            vim.keymap.set("n", "gr", function()
              Snacks.picker.lsp_references()
            end, { buffer = bufnr, desc = "Goto References", silent = true, nowait = true })
          end

          if client.server_capabilities.implementationProvider then
            vim.keymap.set("n", "gi", function()
              Snacks.picker.lsp_implementations()
            end, { buffer = bufnr, desc = "Goto Implementations", silent = true, nowait = true })
          end

          if client.server_capabilities.documentSymbolProvider then
            vim.keymap.set("n", "<leader>ss", function()
              Snacks.picker.lsp_symbols()
            end, { buffer = bufnr, desc = "LSP Symbols", silent = true })
          end
        end,
      })

      local registry = require("mason-registry")

      for _, pkg_name in ipairs(opts.ensure_installed) do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok then
          if not pkg:is_installed() then
            vim.notify("[mason] Installing " .. pkg_name)
            pkg:install()
          end
        end
      end

      for name, config in pairs(opts.servers) do
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end
    end,
  },
}
