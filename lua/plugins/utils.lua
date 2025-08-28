local add = MiniDeps.add

-- [[ 图标库 ]]
add({ source = "echasnovski/mini.icons" })
add({ source = "nvim-tree/nvim-web-devicons" })

-- [[ 通用库 ]]
add({ source = "nvim-lua/plenary.nvim" })

require("mini.icons").setup()
require("nvim-web-devicons").setup()
