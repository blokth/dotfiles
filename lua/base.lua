local opt = vim.opt

opt.mouse = "a"

opt.number = true
opt.relativenumber = true

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = true
opt.incsearch = true

opt.wrap = true
opt.breakindent = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = "yes"
opt.list = true

opt.guifont = "Fira Code:h16"

opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.completeopt = { "menu", "menuone", "noselect" }
opt.colorcolumn = "80"

local augroup = vim.api.nvim_create_augroup("base_autocmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight on yank",
  callback = function(_)
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "man", "help" },
  desc = 'Quit with "q" in man, help buffers',
  group = augroup,
  command = "nnoremap <buffer> q <cmd>quit<cr>",
})
