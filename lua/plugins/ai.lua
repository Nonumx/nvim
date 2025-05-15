return {
  -- AI自动补全
  {
    "milanglacier/minuet-ai.nvim",
    event = "VeryLazy",
    opts = {
      provider = "openai_fim_compatible",
      n_completions = 1,
      context_window = 512,
      provider_options = {
        openai_fim_compatible = {
          name = "SiliconFlow",
          api_key = "SILICONFLOW_API_KEY",
          end_point = "https://api.siliconflow.cn/v1/completions",
          model = "Qwen/Qwen2.5-Coder-7B-Instruct",
          optional = {
            max_tokens = 56,
            top_p = 0.9,
          },
        },
      },
    },
  },
}
