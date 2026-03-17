local M = {}

M.config = {
  mason = {
    lsp = { "lua-language-server" },
    dap = {},
    linter = {},
    formatter = { "stylua" },
  },
  lspconfig = {},
  conform = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
}

M.config_initialized = false

function M:get_config()
  if M.config_initialized then
    return M.config
  end

  -- 加载并合并各语言配置
  local langs = { "cpp", "python" }
  for _, lang in ipairs(langs) do
    local ok, cfg = pcall(require, "plugins.lang." .. lang)
    if ok and type(cfg) == "table" then
      -- 合并 mason 配置
      for tool_type, tools in pairs(cfg.mason or {}) do
        if self.config.mason[tool_type] then
          vim.list_extend(self.config.mason[tool_type], tools)
        end
      end
      -- 合并 conform 配置
      if cfg.conform and cfg.conform.formatters_by_ft then
        self.config.conform.formatters_by_ft =
          vim.tbl_extend("force", self.config.conform.formatters_by_ft, cfg.conform.formatters_by_ft)
      end
      -- 合并 lspconfig
      if cfg.lspconfig then
        self.config.lspconfig = vim.tbl_extend("force", self.config.lspconfig, cfg.lspconfig)
      end
    end
  end

  M.config_initialized = true
  return M.config
end

return M
