local M = {}

M.general = {
	n = {
		["<leader>w"] = { "<cmd>write<cr>", "Save file" },
		["x"] = { '"_x', "x" },
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<cr>", "Move to the left pane in tmux" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<cr>", "Move to the bottom pane in tmux" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<cr>", "Move to the top pane in tmux" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<cr>", "Move to the right pane in tmux" },
		["cp"] = { '"+y', "Copy to clipboard" },
		["cv"] = { '"+p', "Paste from clipboard" },
		["<leader><leader>"] = { "<C-^>", "Swap between the closest files" },
		["<leader>rr"] = { "<cmd>LspRestart<CR>", "Restart lsp" },
		["<leader>bn"] = { ":bn<CR>", "Next buffer" },
		["<leader>bp"] = { ":bp<CR>", "Previous buffer" },
		["<leader>bd"] = { ":bp | bd #<CR>", "Delete current buffer" },
	},
	x = {
		["x"] = { '"_x', "x" },
		["cp"] = { '"+y', "Copy to clipboard" },
		["cv"] = { '"+p', "Paste from clipboard" },
	},
}

return M
