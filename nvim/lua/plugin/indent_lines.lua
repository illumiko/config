vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")
vim.opt.listchars:append "space:⋅"
require("indent_blankline").setup({
    colored_indent_levels = true,
    show_first_indent_level = true,
    use_treesitter = true,
    max_indent_increase = 1,
    show_trailing_blankline_indent = false,
    show_current_context = true,
})
