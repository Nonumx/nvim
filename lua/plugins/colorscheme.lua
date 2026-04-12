local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Evergarden for Neovim
-- now(function()
--   add({ source = "everviolet/nvim", name = "evergarden" })
--   require("evergarden").setup({
--     theme = {
--       variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
--       accent = "green",
--     },
--     editor = {
--       transparent_background = false,
--       sign = { color = "none" },
--       float = {
--         color = "mantle",
--         solid_border = false,
--       },
--       completion = {
--         color = "surface0",
--       },
--     },
--     overrides = function(colors)
--       return {
--         MiniCursorword = {
--           bg = colors.surface1, -- 比 surface0 更明显的背景
--         },
--         MiniCursorwordCurrent = {
--           bg = colors.surface2, -- 当前单词用更亮的背景
--         },
--       }
--     end,
--   })
--   vim.cmd("colorscheme evergarden")
-- end)

-- OneDark
now(function()
  add({ source = "navarasu/onedark.nvim" })
  require("onedark").setup({ style = "dark" })
  require("onedark").load()
end)
