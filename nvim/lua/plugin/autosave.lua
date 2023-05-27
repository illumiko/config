local M = {}
local config = {
	enabled = false,
	execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
	events = { "InsertLeave" },
	conditions = {
		exists = true,
		filename_is_not = { "test" },
		filetype_is_not = {},
		modifiable = true,
	},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 135,
}

M.lazy = {
	-- "Pocco81/AutoSave.nvim",
	-- config = config,
}

return M.lazy
