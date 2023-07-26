require("catppuccin").setup({
  integrations = {
    indent_blankline = {
      enabled = true,
    },
    mason = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
})

vim.cmd.colorscheme("catppuccin")

require("indent_blankline").setup({
  char = "|",
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = false,
})
