local add = MiniDeps.add

-- [[ Markdown 渲染 ]]
add({ source = "OXY2DEV/markview.nvim" })
-- [[ AI Coding ]]
add({ source = "olimorris/codecompanion.nvim" })

require("markview").setup({
  preview = {
    icon_provider = "mini",
    filetypes = { "markdown", "codecompanion" },
    ignore_buftypes = {},
  },
})

local spinner = require("plugins.codecompanion.spinner")
spinner:init()
require("codecompanion").setup({
  adapters = {
    deepseek = function()
      return require("codecompanion.adapters").extend("deepseek", {
        schema = {
          model = {
            default = "deepseek-chat",
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "deepseek",
    },
    inline = {
      adapter = "deepseek",
    },
  },
  display = {
    chat = {
      window = {
        position = "right",
        width = 0.3,
      },
    },
  },
  send = {
    callback = function(chat)
      vim.cmd("stopinsert")
      chat:submit()
      chat:add_buf_message({ role = "llm", content = "" })
    end,
    index = 1,
    description = "Send",
  },
})

local map = vim.keymap.set

map("n", "<leader>cc", function()
  vim.cmd("CodeCompanionChat")
end, { desc = "CodeCompanion Chat" })
