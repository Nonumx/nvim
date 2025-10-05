local add = MiniDeps.add

-- 只读仓库：mason-lspconfig会用这里面的默认配置
add({ source = "neovim/nvim-lspconfig" })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[LSP] Goto Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "[LSP] Goto Declaration" })

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

-- LSP自动配置
add({ source = "mason-org/mason-lspconfig.nvim" })
require("mason-lspconfig").setup({})

local ensured_installed_pkg = {
  "lua-language-server",
  "stylua",
  "basedpyright",
  "ruff",
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
