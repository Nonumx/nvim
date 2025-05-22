return {
  -- LLM工具
  {
    "olimorris/codecompanion.nvim",
    init = function()
      require("plugins.codecompanion.fidget-spinner"):init()
    end,
    opts = {
      adapters = {
        siliconflow = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              api_key = "SILICONFLOW_API_KEY",
              url = "https://api.siliconflow.cn",
            },
            name = "silicon_flow",
            formatted_name = "Silicon Flow",
            schema = {
              model = {
                ---@type string|fun(): string
                default = "Qwen/Qwen3-8B",
                choices = {
                  ["Qwen/Qwen3-8B"] = { opts = { can_reason = true } },
                },
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "siliconflow",
        },
        inline = {
          adapter = "siliconflow",
        },
      },
    },
  },
  -- Markdown渲染
  {
    "OXY2DEV/markview.nvim",
    opts = {
      preview = {
        icon_provider = "mini",
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },
}
