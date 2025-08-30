require("mini.icons").setup()
require("nvim-web-devicons").setup()

require("notify").setup({
  render = "wrapped-default",
  stages = "fade",
  merge_duplicates = true,
  minimum_width = 20,
  max_width = 50,
})
vim.notify = require("notify")
