local M = {}
M.get_hl = function(hl, fbg) -- fbg = 'foreground' || 'background'
	local color = vim.api.nvim_get_hl_by_name(hl, true)
	local get = "#" .. string.format("%x", color[fbg])
	return get
end

M.set_hl_fg = function(change_hl, hl)
	local get_hl = M.get_hl(hl, "foreground")
	vim.api.nvim_set_hl(0, change_hl, { fg = get_hl })
end

M.set_hl_bg = function(change_hl, hl)
	local get_hl = M.get_hl(hl, "background")
	vim.api.nvim_set_hl(0, change_hl, { fg = get_hl })
end

return M
