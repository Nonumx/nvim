local add, later = MiniDeps.add, MiniDeps.later

later(function()
  -- 只读仓库：各种 lsp 配置
  add({ source = "neovim/nvim-lspconfig" })
  -- LSP管理器
  add({ source = "mason-org/mason.nvim" })

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
    -- python,
    "basedpyright",
    "ruff",
    -- rust,
    "rust-analyzer",
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
    basedpyright = require("plugins.lang.basedpyright"),
    ruff = require("plugins.lang.ruff"),
    rust_analyzer = require("plugins.lang.rust_analyzer"),
  }

  for name, config in pairs(enabled_lsp) do
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
  end
end)
