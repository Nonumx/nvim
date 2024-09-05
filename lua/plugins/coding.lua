return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      handlers = {
        function (server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
      },
    },
  },
  -- LSP Utils
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {},
  },
  -- 格式化文本
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        cpp = { "clang-format" },
      },
    },
  },
  -- 自动补全
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
      local cmp = require("cmp")
      local strings = require("plenary.strings")

      return {
        mapping = {
          ["<C-n>"] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
              else
                fallback()
              end
            end
          ),
          ["<C-p>"] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
              else
                fallback()
              end
            end
          ),
          ["<tab>"] = cmp.mapping(
            function(fallback)
              -- 如果没选中，则选第一个，否则选择选中的那个
              if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
                cmp.confirm()
              else
                fallback()
              end
            end,
            {"i","c","s"}
          ),
          ["<cr>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          }),
          ["<esc>"] = cmp.mapping.abort(),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }),
        completion = { completeopt = 'menu,menuone,noinsert' },
        formatting = {
          format = function(entry, vim_item)
            vim_item.abbr = strings.truncate(vim_item.abbr, 40)
            return vim_item
          end
        },
        performance = {
          max_view_entries = 10,
        },
      }
    end,
  },
}
