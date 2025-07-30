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
    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
    "json",
    "jsonc",
    "toml",
    "yaml",
    "cpp",
    "python",
    "cmake",
  },
  highlight = { enable = true },
  indent = { enable = true },
})
