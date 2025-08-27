local add = MiniDeps.add

add({
  source = "nvim-treesitter/nvim-treesitter",
  -- Use 'master' while monitoring updates in 'main'
  checkout = "master",
  monitor = "main",
  -- Perform action after every checkout
  hooks = {
    post_checkout = function()
      vim.cmd("TSUpdate")
    end,
  },
})

---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "diff",
    "html",
    "lua",
    "luadoc",
    "luap",
    "markdown",
    "markdown_inline",
    "query",
    "regex",
    "printf",
    "vim",
    "vimdoc",
    "json",
    "jsonc",
    "jsdoc",
    "toml",
    "yaml",
    "xml",
    "cpp",
    "python",
    "cmake",
    "javascript",
    "typescript",
    "tsx",
    "vue"
  },
  highlight = { enable = true },
  indent = { enable = true },
})
