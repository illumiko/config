local M = {}
M.get_hl = function(hl, fbg)
	local color = vim.api.nvim_get_hl_by_name(hl, true)
	local get = "#" .. string.format("%x", color[fbg])
	return get
end
return M
