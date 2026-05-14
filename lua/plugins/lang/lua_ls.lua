return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts lspconfig.opts
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "lua-language-server", "stylua" })
      return vim.tbl_deep_extend("force", opts, {
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                  path = {
                    "lua/?.lua",
                    "lua/?/init.lua",
                  },
                },
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                  },
                },
              },
            },
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
      },
    },
  },
}
