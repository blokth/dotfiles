local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Installing packer...")
	local packer_url = "https://github.com/wbthomason/packer.nvim"
	vim.fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
	print("Done.")

	vim.cmd.packadd("packer.nvim")
	install_plugins = true
end

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use({ "catppuccin/nvim", as = "catppuccin" })
	use("nvim-lualine/lualine.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("wellle/targets.vim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("christoomey/vim-tmux-navigator")
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run =
		"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("nvim-lua/plenary.nvim")
	use("tpope/vim-repeat")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	if install_plugins then
		require("packer").sync()
	end
end)

if install_plugins then
	return
end

require("catppuccin").setup({
	flavour = "mocha",
})

vim.cmd.colorscheme("catppuccin")

require("lualine").setup({
	options = {
		icons_enabled = false,
		section_separators = "",
		component_separators = "",
		theme = "catppuccin",
		disabled_filetypes = {
			statusline = { "NvimTree" },
		},
	},
})

require("indent_blankline").setup({
	char = "|",
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
	use_treesitter = true,
	show_current_context = false,
})

require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"css",
		"json",
		"lua",
	},
})

require("nvim-tree").setup({
	on_attach = function(bufnr)
		local bufmap = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc, noremap = true, silent = true, nowait = true })
		end

		-- See :help nvim-tree.api
		local api = require("nvim-tree.api")

		api.config.mappings.default_on_attach(bufnr)

		bufmap("L", api.node.open.edit, "Expand folder or go to file")
	end,
})

require("telescope").load_extension("fzf")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"rust_analyzer",
		"lua_ls",
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})
