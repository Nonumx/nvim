return {
  -- [[ Treesitter 提供语法高亮，跳转等功能 ]]
  {
    "nvim-treesitter/nvim-treesitter",
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
      },
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    },
  },
}
