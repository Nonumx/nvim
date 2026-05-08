return {
  -- Rust LSP 支持（打开 Rust 文件时触发）
  -- 替代默认的 rust-analyzer lspconfig 启动
  -- NOTE: 需要通过 rustup 安装 rust-analyzer，不通过 Mason
  {
    "mrcjkb/rustaceanvim",
    sem_version = "^9",
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
}
