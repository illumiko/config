local M = {}
local config = {
	provider_selector = function(bufnr, filetype, buftype)
		return { "treesitter", "indent" }
	end,
	-- open_fold_hl_timeout = 150,
	close_fold_kinds = { "imports", "comment" },
	preview = {
		win_config = {
			border = { "", "─", "", "", "", "─", "", "" },
			winhighlight = "Normal:Folded",
			winblend = 0,
		},
		mappings = {
			scrollU = "<C-u>",
			scrollD = "<C-d>",
		},
	},
}
M.lazy = {
	-- "kevinhwang91/nvim-ufo",
	-- dependencies = "kevinhwang91/promise-async",
	--    config = config
}
return M.lazy
