local add, now = MiniDeps.add, MiniDeps.now

now(function()
  add({ source = "navarasu/onedark.nvim" })
  require("onedark").setup({ style = "dark" })
  require("onedark").load()
end)
