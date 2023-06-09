local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim'
	vim.fn.system({ 'git', 'clone', '--depth', '1', packer_url, install_path })
	print('Done.')

	vim.cmd.packadd('packer.nvim')
	install_plugins = true
end

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use { "catppuccin/nvim", as = "catppuccin" }
	use 'nvim-lualine/lualine.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'wellle/targets.vim'
	use 'numToStr/Comment.nvim'
	use 'tpope/vim-surround'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use 'christoomey/vim-tmux-navigator'
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'
	use { 'nvim-telescope/telescope-fzf-native.nvim', run =
	'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use 'akinsho/toggleterm.nvim'
	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-repeat'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'folke/which-key.nvim'

	if install_plugins then
		require('packer').sync()
	end
end)

if install_plugins then
	return
end

-- require('kanagawa').load('dragon')
require("catppuccin").setup({
	flavour = "mocha"
})

vim.cmd.colorscheme("catppuccin")


require('lualine').setup({
	options = {
		icons_enabled = false,
		section_separators = '',
		component_separators = '',
		theme = 'catppuccin',
		disabled_filetypes = {
			statusline = { 'NvimTree' }
		},
	}
})

require('indent_blankline').setup({
	char = '|',
	show_trailing_blankline_indent = false,
	show_first_indent_level = false,
	use_treesitter = true,
	show_current_context = false
})

require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner'
			}
		},
	},
	ensure_installed = {
		'javascript',
		'typescript',
		'tsx',
		'css',
		'json',
		'lua',
	},
})

require('Comment').setup({})
require('nvim-tree').setup({
	hijack_cursor = false,
	hijack_netrw = true,
	disable_netrw = true,
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	on_attach = function(bufnr)
		local bufmap = function(lhs, rhs, desc)
			vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
		end

		-- See :help nvim-tree.api
		local api = require('nvim-tree.api')

		bufmap('L', api.node.open.edit, 'Expand folder or go to file')
		bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
		bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
		bufmap('<C-]>', api.tree.change_root_to_node, 'cd into folder')
		bufmap('?', api.tree.toggle_help, 'Open help')
	end
})


require('telescope').load_extension('fzf')

require('toggleterm').setup({
	open_mapping = '<C-g>',
	direction = 'horizontal',
	shade_terminals = true,
})

require('gitsigns').setup({
	signs = {
		add = { text = '▎' },
		change = { text = '▎' },
		delete = { text = '➤' },
		topdelete = { text = '➤' },
		changedelete = { text = '▎' },
	}
})

require('mason').setup()
require('mason-lspconfig').setup()

require('which-key').setup()
