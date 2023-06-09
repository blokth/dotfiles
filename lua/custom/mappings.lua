local M = {}

M.general = {
	n = {
		["<leader>w"] = { "<cmd>write<cr>", "Save file" },
		["x"] = { "_x", "x" },
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<cr>", "Move to the left pane in tmux" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<cr>", "Move to the bottom pane in tmux" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<cr>", "Move to the top pane in tmux" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<cr>", "Move to the right pane in tmux" },
	},
	x = {
		["x"] = { "_x", "x" },
	},
}

M.nvimtree = {
	plugin = true,
	n = {
		["<S-l>"] = {
			function()
				require("nvim-tree.api").node.open.edit()
			end,
			"Open file",
		},
	},
}

return M
