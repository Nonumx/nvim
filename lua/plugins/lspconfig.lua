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

local ensured_installed_pkg = {
  "lua-language-server",
  "stylua",
}

local registry = require("mason-registry")

for _, pkg_name in ipairs(ensured_installed_pkg) do
  local ok, pkg = pcall(registry.get_package, pkg_name)
  if ok then
    if not pkg:is_installed() then
      pkg:install()
    end
  end
end
