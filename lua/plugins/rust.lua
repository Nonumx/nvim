return {
  -- Rust LSP 支持（打开 Rust 文件时触发）
  -- 替代默认的 rust-analyzer lspconfig 启动
  {
    "mrcjkb/rustaceanvim",
    version = "v9.0.2",
    ft = "rust",
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        rust = { "rust-analyzer" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ---@param opts lspconfig.opts
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "rust-analyzer" })
      return opts
    end,
  },
}
