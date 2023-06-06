local augroup = vim.api.nvim_create_augroup('user_cmds', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'man', 'help' },
	desc = 'Quit with "q" in man, help buffers',
	group = augroup,
	command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

vim.api.nvim_create_autocmd('TextYankPost', {
	group = augroup,
	desc = 'Highlight on yank',
	callback = function(event)
		vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
	end
})

vim.api.nvim_create_autocmd('BufWritePre', {
	desc = 'Format on save',
	callback = function(event)
		vim.lsp.buf.format()
	end
})
