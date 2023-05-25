local M = {}
-- M.config = {
-- 	colored_indent_levels = true,
-- 	show_first_indent_level = true,
-- 	use_treesitter = true,
-- 	max_indent_increase = 1,
-- 	show_trailing_blankline_indent = false,
-- 	show_current_context = true,
-- }
--
-- M.lazy = {
-- 	"lukas-reineke/indent-blankline.nvim",
-- 	config = function()
-- 		vim.opt.list = true
-- 		-- vim.opt.listchars:append("eol:↴")
-- 		vim.opt.listchars:append("space:⋅")
-- 		require("indent_blankline").setup(M.config)
-- 	end,
-- }

M.config = function()
	vim.opt.list = true
	-- vim.opt.listchars:append("eol:↴")
	vim.opt.listchars:append("space:⋅")
	return {
		colored_indent_levels = true,
		show_first_indent_level = true,
		use_treesitter = true,
		max_indent_increase = 1,
		show_trailing_blankline_indent = false,
		show_current_context = true,
	}
end

M.lazy = {
	"lukas-reineke/indent-blankline.nvim",
	config = M.config
}

return M
