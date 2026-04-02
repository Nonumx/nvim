local add, later = MiniDeps.add, MiniDeps.later

later(function()
  -- 只读仓库：mason-lspconfig会用这里面的默认配置
  add({ source = "neovim/nvim-lspconfig" })
  -- LSP管理器
  add({ source = "mason-org/mason.nvim" })
  -- LSP自动配置
  add({ source = "mason-org/mason-lspconfig.nvim" })

  require("mason").setup({
    ui = {
      icons = {
        package_pending = " ",
        package_installed = " ",
        package_uninstalled = " ",
      },
    },
  })

  require("mason-lspconfig").setup({})

  local config = require("plugins.lang"):get_config()

  local registry = require("mason-registry")

  local ensured_installed_pkg = {}

  -- 将所有的工具列表合并到 ensured_installed_pkg 中
  for _, tools in pairs(config.mason) do
    vim.list_extend(ensured_installed_pkg, tools)
  end

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
        [vim.diagnostic.severity.WARN]  = MiniIcons.get("lsp", "warn"),
        [vim.diagnostic.severity.INFO]  = MiniIcons.get("lsp", "info"),
        [vim.diagnostic.severity.HINT]  = MiniIcons.get("lsp", "hint"),
      },
    },
  })

  for name, cfg in pairs(config.lspconfig) do
    vim.lsp.config(name, cfg)
  end
end)
