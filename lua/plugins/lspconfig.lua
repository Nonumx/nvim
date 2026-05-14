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
