local add, later = MiniDeps.add, MiniDeps.later

later(function()
  add({ source = "mrcjkb/rustaceanvim", checkout = "v9.0.2" })
end)

---@type vim.lsp.Config
return {}
