local add = MiniDeps.add

-- [[ LSP管理器 ]]
add({ source = "mason-org/mason.nvim" })
add({ source = "mason-org/mason-lspconfig.nvim"})
add({ source = "neovim/nvim-lspconfig" })

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
