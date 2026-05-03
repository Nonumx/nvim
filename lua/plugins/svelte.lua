local svelte_plugin = vim.fn.stdpath("data")
  .. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin"

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      ensure_installed = { "svelte-language-server" },
      servers = {
        vtsls = {
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  name = "typescript-svelte-plugin",
                  location = svelte_plugin,
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
        },
        svelte = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { svelte = { "biome" } },
    },
  },
}
