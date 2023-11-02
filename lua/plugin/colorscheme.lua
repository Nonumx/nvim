return {
    { 
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- 加载主题
            vim.cmd[[colorscheme catppuccin-latte]]
        end
    }
}
