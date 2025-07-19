local add = MiniDeps.add

-- [[ LSP管理器 ]]
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

-- 默认激活 <配置目录>/lsp/ 下的所有已配置的 LSP
local lsp_dir = vim.fn.stdpath("config") .. "/lsp/"
local lsp_configs = vim.fn.globpath(lsp_dir, "*.lua", false, true)
for _, lsp_config in ipairs(lsp_configs) do
  local lsp_name = vim.fn.fnamemodify(lsp_config, ":t:r")
  vim.lsp.enable(lsp_name)
end
