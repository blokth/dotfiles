return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		require("nvim-tree").setup({
			sort_by = "case_sensitive",
			actions = {
				open_file = { quit_on_open = true },
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			filters = {
				custom = { "^.git$", "^node_modules$" },
			},
			git = {
				enable = false,
			},
			log = {
				enable = true,
				types = {
					diagnostics = true,
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				debounce_delay = 50,
				icons = {
					hint = "h",
					info = "i",
					warning = "w",
					error = "e",
				},
			},
			on_attach = function(bufnr)
				local bufmap = function(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs,
						{
							buffer = bufnr,
							desc = desc,
							noremap = true,
							silent = true,
							nowait = true
						})
				end

				local api = require("nvim-tree.api")

				api.config.mappings.default_on_attach(bufnr)

				bufmap("L", api.node.open.edit, "Expand folder or go to file")
			end,
		})

		vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
	end
}
