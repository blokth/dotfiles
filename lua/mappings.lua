vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })
vim.keymap.set({ "n", "x" }, "cp", '"+y')
vim.keymap.set({ "n", "x" }, "cv", '"+p')
vim.keymap.set({ "n", "x" }, "x", '"_x')
vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>")
vim.keymap.set("n", "<leader><leader>", "<C-^>")
vim.keymap.set("n", "<leader>bn", ":bn<cr>")
vim.keymap.set("n", "<leader>bp", ":bp<cr>")
vim.keymap.set("n", "<leader>bd", ":bp | bd #<cr>")

-- Tmux Navigate
vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<cr>")
