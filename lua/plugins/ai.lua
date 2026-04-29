return {
  "carlos-algms/agentic.nvim",
  dependencies = {
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "md", "AgenticChat" },
      },
    },
  },
  opts = {
    provider = "opencode-acp",
  },
  keys = {
    {
      "<leader>at",
      function()
        require("agentic").toggle()
      end,
      mode = { "n", "v" },
      desc = "Toggle Agentic Chat",
    },
    {
      "<leader>aa",
      function()
        require("agentic").add_selection_or_file_to_context()
      end,
      mode = { "n", "v" },
      desc = "Add file or selection to Agentic to Context",
    },
    {
      "<leader>an",
      function()
        require("agentic").new_session()
      end,
      mode = { "n", "v" },
      desc = "New Agentic Session",
    },
    {
      "<leader>ar",
      function()
        require("agentic").restore_session()
      end,
      desc = "Agentic Restore session",
      silent = true,
      mode = { "n", "v" },
    },
    {
      "<leader>ad",
      function()
        require("agentic").add_current_line_diagnostics()
      end,
      desc = "Add current line diagnostic to Agentic",
      mode = { "n" },
    },
    {
      "<leader>aD",
      function()
        require("agentic").add_buffer_diagnostics()
      end,
      desc = "Add all buffer diagnostics to Agentic",
      mode = { "n" },
    },
  },
}
