require("config.options")
require("config.keymaps")
require("config.autocmds")

if vim.g.neovide then
  require("config.neovide")
end
