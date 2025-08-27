local add = MiniDeps.add

-- [[ 图标库 ]]
add({ source = "echasnovski/mini.icons" })
-- [[ 状态栏、标签栏 ]]
add({ source = "rebelot/heirline.nvim" })
-- [[ 自定义UI ]]
add({ source = "folke/noice.nvim", depends = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })

require("mini.icons").setup()
require("heirline").setup({})
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
