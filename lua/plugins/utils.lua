return {
	-- 图标包
	"nvim-tree/nvim-web-devicons",
	-- 通用库
	"nvim-lua/plenary.nvim",
	-- 会话管理
	{
		"olimorris/persisted.nvim",
		opts = function()
			vim.keymap.set("n", "<leader>ss", "<cmd>SessionSelect<cr>", { desc = "会话 - 选择" })
			vim.keymap.set("n", "<leader>sl", "<cmd>SessionLoadLast<cr>", { desc = "会话 - 加载上一次" })
			return {}
		end,
	},
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
		opts = function()
			vim.diagnostic.config({
				signs = false,
			})
			return {
				ensure_installed = {
					"lua_ls",
					"clangd",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({})
					end,
					["clangd"] = function()
						vim.keymap.set(
							"n",
							"<A-o>",
							"<cmd>ClangdSwitchSourceHeader<cr>",
							{ desc = "切换头/源文件 (C/C++)" }
						)
						require("lspconfig").clangd.setup({
							cmd = {
								"clangd",
								"--background-index",
								"--clang-tidy",
								"--header-insertion=never",
								"--completion-style=detailed",
								"--function-arg-placeholders",
								"--fallback-style=llvm",
							},
						})
					end,
				},
			}
		end,
	},
}
