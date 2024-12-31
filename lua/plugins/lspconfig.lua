return {
  -- LSP配置
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      -- LSP安装器
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- 使用blink.cmp作为补全插件
      "saghen/blink.cmp",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          -- 整合 capabilities
          local capabilities = require("blink.cmp").get_lsp_capabilities()
          require("lspconfig")[server_name].setup({ capabilities = capabilities })
        end,
      })
    end,
  },

  -- Mason配置
  {
    "williamboman/mason.nvim",
    -- 直接加载插件，方便在主界面的时候安装lsp等操作
    opts = {},
  },
}
