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
    opts = {
      ensure_installed = {
        "rust-analyzer",
      },
      -- lspconfig 由 rustaceanvim 控制
    },
  },
}
