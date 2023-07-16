local plugins = {
	{
		"nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function(_)
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"clangd",
				"shellcheck",
				"black",
				"pyright",
				"rust-analyzer",
				"rustfmt",
			},
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"NvChad/nvterm",
		enabled = false,
	},
}

return plugins
