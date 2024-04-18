return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mlc = require("mason-lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            mlc.setup()
            mlc.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities
                    })
                end
            })
        end
    }
}