local opt = vim.opt

-- Indenting
opt.expandtab = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Mouse
opt.mouse = "a"

-- Search
opt.ignorecase = true
opt.smartcase = true

-- True color
opt.termguicolors = true

-- Line number
opt.number = true

-- Leader key
vim.g.mapleader = " "

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({ "r", "o" })
    end,
    desc = "Disable new line comment"
})

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local tokyonight = {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
}

local neo_tree = {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
    }
}

local LuaSnip = {
    "L3MON4D3/LuaSnip",
    version = "1.2.1",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}

local cmp = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        LuaSnip,
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            mapping = {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" })
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
            }),
        })
    end
}

local mason = {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "",
                    package_pending = "➜",
                    package_uninstalled = "󰅚"
                }
            }
        })
    end
}

local mason_lspconfig = {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup()
    end
}

local nvim_lspconfig = {
    "neovim/nvim-lspconfig",
    config = function()
        require("lspconfig").clangd.setup({})
    end
}

local plenary = {
    "nvim-lua/plenary.nvim",
    lazy = true,
}

local nvim_web_devicons = {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
}

local indent_blankline = {
    "lukas-reineke/indent-blankline.nvim",
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = true,
    show_current_context_start = true,
}

local plugins = {
    tokyonight,
    neo_tree,
    mason,
    mason_lspconfig,
    nvim_lspconfig,
    cmp,
    plenary, 
    nvim_web_devicons,
    indent_blankline,
}

require("lazy").setup(plugins)

