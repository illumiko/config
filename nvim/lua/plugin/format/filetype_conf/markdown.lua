local util = require("formatter.util")
local M = {}

M.markdownlint = function()
	return {
		exe = "markdownlint",
		args = {
			"-f",
			"-q",
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = false,
		-- no_append = true,
	}
end

return M
