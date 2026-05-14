local lspconfig = {
  on_init = function(client)
    local is_nvim_config = false
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path == vim.fn.stdpath("config") then
        is_nvim_config = true
      elseif vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
        -- 项目有自己的 .luarc 配置，尊重它
        return
      end
    end

    -- 构建 workspace library
    local library = { vim.env.VIMRUNTIME }

    if is_nvim_config then
      -- 在编辑 nvim 配置时，加载所有已安装插件的 lua 目录到 workspace library
      -- 这样 lua_ls 能识别 require("xxx") 的返回值类型，提供完整补全
      local pack_dirs = vim.fn.glob(vim.fn.stdpath("data") .. "/site/pack/core/{opt,start}/*", false, true)
      for _, dir in ipairs(pack_dirs) do
        table.insert(library, dir)
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = library,
      },
    })
  end,
}

return {
  {
    "neovim/nvim-lspconfig",
    ---@param opts lspconfig.opts
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "lua-language-server", "stylua" })
      return vim.tbl_deep_extend("force", opts, {
        servers = {
          lua_ls = {},
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
