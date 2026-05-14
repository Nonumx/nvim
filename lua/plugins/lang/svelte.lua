if true then
  return {}
end

local svelte_plugin = vim.fn.stdpath("data")
  .. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin"

return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts lspconfig.opts
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "svelte-language-server" })
      return vim.tbl_deep_extend("force", opts, {
        servers = {
          vtsls = {
            settings = {
              vtsls = {
                tsserver = {
                  globalPlugins = {
                    {
                      name = "typescript-svelte-plugin",
                      location = svelte_plugin,
                      enableForWorkspaceTypeScriptVersions = true,
                    },
                  },
                },
              },
            },
          },
          svelte = {},
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { svelte = { "biome" } },
    },
  },
}
