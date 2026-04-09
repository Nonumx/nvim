return {
  mason = {
    lsp = { "basedpyright", "ruff" },
    dap = { "debugpy" },
    linter = {},
    formatter = {},
  },

  conform = {
    formatters_by_ft = {
      python = { "ruff" },
    },
  },

  lspconfig = {},

  setup = function()
    local add, later = MiniDeps.add, MiniDeps.later

    later(function()
      add({ source = "linux-cultist/venv-selector.nvim" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        once = true,
        callback = function()
          require("venv-selector").setup({ notify_user_on_venv_activation = true, override_notify = false })
          vim.keymap.set("n", ",v", "<cmd>VenvSelect<cr>", { buffer = true })
        end,
      })
    end)
  end,
}
