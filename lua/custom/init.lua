vim.opt.colorcolumn = "80"
vim.opt.clipboard = ""

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "man", "help" },
	desc = 'Quit with "q" in man, help buffers',
	command = "nnoremap <buffer> q <cmd>quit<cr>",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format on save",
	callback = function(_)
		vim.lsp.buf.format({ async = true })
	end,
})
