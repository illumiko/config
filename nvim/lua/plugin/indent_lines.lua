local M = {}
M.config = function()
	vim.opt.list = true
	vim.opt.listchars:append("eol:↴")
	-- vim.opt.listchars:append("space:⋅")
    vim.cmd("let g:indent_blankline_filetype_exclude = ['dashboard','help','neo-tree','lazy','mason',]")
	return {
		colored_indent_levels = true,
		show_first_indent_level = true,
		use_treesitter = true,
		max_indent_increase = 1,
		show_trailing_blankline_indent = false,
		show_current_context = true,
        filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
	}
end

M.lazy = {
	"lukas-reineke/indent-blankline.nvim",
	config = M.config
}

return M.lazy
