return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            {
              "<M-o>",
              "<cmd>ClangdSwitchSourceHeader<cr>",
              desc = "Switch Source/Header (C/C++)",
            },
          },
          init_options = {
            clangdFileStatus = true,
          },
        },
        ["cmake-language-server"] = {},
        ["clang-format"] = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cpp = { "clang-format" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = {
      servers = {
        "codelldb",
      },
    },
  },
}
