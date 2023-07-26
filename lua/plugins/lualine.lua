require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = "",
    section_separators = "",
    disabled_filetypes = {
      statusline = { "NvimTree" },
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'filename', path = 3 } },
    lualine_c = { 'diagnostics' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'filetype' }
  },
}
