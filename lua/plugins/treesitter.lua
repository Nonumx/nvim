-- Treesitter配置
return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs", -- Sets main module to use for opts
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "query",
      "vim",
      "vimdoc",
      "python",
      "cpp",
      "yaml",
      "toml",
    },
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
