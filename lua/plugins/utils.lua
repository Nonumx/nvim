return {
	-- 图标包
	"nvim-tree/nvim-web-devicons",
	-- 通用库
	"nvim-lua/plenary.nvim",
	-- 会话管理
	{ "olimorris/persisted.nvim", opts = {} },
	-- LSP
	"neovim/nvim-lspconfig",
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
			ensure_installed = {
				"lua_ls",
				"clangd",
				"pyright",
				"cmake",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({})
				end,
				["clangd"] = function()
					require("lspconfig").clangd.setup({
						cmd = {
							"clangd",
							"--background-index",
							"--clang-tidy",
							"--header-insertion=iwyu",
							"--completion-style=detailed",
							"--function-arg-placeholders",
							"--fallback-style=llvm",
						},
					})
				end,
			},
		},
		config = function(_, opts)
			vim.diagnostic.config({
				signs = false,
			})
			require("mason-lspconfig").setup(opts)
		end,
	},
}
