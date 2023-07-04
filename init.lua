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
vim.g.mapleader = ","

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

local nvim_autopairs = {
    "windwp/nvim-autopairs",
    config = function()
        require("nvim-autopairs").setup()

        -- Setup autopairs for cmp
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        require("cmp").event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done()
        )
    end
}

local cmp = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        LuaSnip,
        nvim_autopairs,
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
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
                { name = "path" },
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

local Comment = {
    "numToStr/Comment.nvim",
    keys = {
        { 
            "<leader>/",
            function()
                require("Comment.api").toggle.linewise.current()
            end,
            mode = { "i", "n" },
            desc = "Toggle comment for current line"
        },
        {
            "<leader>/",
            "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
            mode = "v",
            desc = "Toogle comment on visual mode"
        }
    },
    config = function()
        require("Comment").setup({
            -- Disable default keybindings
            mappings = {
                basic = false,
                extra = false,
            }
        })
    end
}

local nvim_treesitter = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true
            }
        })
    end
}

local nvim_notify = {
    "rcarriga/nvim-notify",
    config = function()
        vim.notify = require("notify")
    end
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
    Comment,
    nvim_treesitter,
    nvim_notify
}

require("lazy").setup(plugins)

local M = {}

-- Reload CMake cache
M.reload_cmake = function()
    vim.g.cmake_reload = false
    vim.notify("Configuring project...", "info", {
        title = "CMake: Configure"
    })
    local Job = require("plenary.job")
    Job:new({
        command = "cmake",
        args = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON", "-Bbuild" },
        on_exit = function(j, return_val)
            if return_val ~= 0 then
                vim.notify(j:stderr_result(), "error", {
                    title = "CMake: Error"
                })
            else
                vim.notify(j:result(), "info", {
                    title = "CMake: Generating done"
                })
            end
        end,
    }):start()
end

-- Editor will configure CMake project when first open a 
-- *.h file or *.cpp file.
-- TODO: Editor will also reload CMake cache when CMakeLists.txt is modified.
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.h", "*.cpp" },
    callback = function()
        if not vim.loop.fs_stat("CMakeLists.txt") then
            return
        end
        if vim.g.cmake_reload == nil or vim.g.cmake_reload == true then
            M.reload_cmake()
        end
    end
})
