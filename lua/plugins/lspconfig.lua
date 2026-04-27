return {
  -- LSP 管理器
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "mason-org/mason.nvim",
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_pending = " ",
            package_installed = " ",
            package_uninstalled = " ",
          },
        },
      })

      local registry = require("mason-registry")

      local ensured_installed_pkg = {
        "lua-language-server",
        "stylua",
        -- python
        "basedpyright",
        "ruff",
        -- rust
        "rust-analyzer",
        -- typescript/javascript/svelte
        "vtsls",
        "svelte-language-server",
        "biome",
      }

      for _, pkg_name in ipairs(ensured_installed_pkg) do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok then
          if not pkg:is_installed() then
            vim.notify("[mason] Installing " .. pkg_name)
            pkg:install()
          end
        end
      end

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

      local enabled_lsp = {
        lua_ls = require("plugins.lang.lua_ls"),
        basedpyright = {},
        ruff = {},
        vtsls = require("plugins.lang.vtsls"),
        svelte = {},
      }

      for name, config in pairs(enabled_lsp) do
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end

      -- Snacks picker LSP keymaps
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
            end, { buffer = bufnr, desc = "References", silent = true, nowait = true })
          end

          if client.server_capabilities.documentSymbolProvider then
            vim.keymap.set("n", "<leader>s", function()
              Snacks.picker.lsp_symbols()
            end, { buffer = bufnr, desc = "LSP Symbols", silent = true })
          end
        end,
      })
    end,
  },
}
