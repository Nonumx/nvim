local svelte_plugin = vim.fn.stdpath("data")
  .. "/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin"

---@type vim.lsp.Config
return {
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
}
