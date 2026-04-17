local add, later = MiniDeps.add, MiniDeps.later

later(function()
  add({
    source = "nvim-neotest/neotest",
    depends = {
      "nvim-neotest/nvim-nio",
    },
  })

  require("neotest").setup({
    adapters = {},
    status = { virtual_text = true },
    output = { open_on_run = true },
  })
end)
