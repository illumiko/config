local M = {}
local config = function()
	local status_ok, toggleterm = pcall(require, "toggleterm")
	if not status_ok then
		return
	end

	toggleterm.setup({
		size = 8,
		hide_numbers = true,
		-- shade_filetypes = { "toggleterm" },
		shade_terminals = true,
		shading_factor = 5,
		start_in_insert = false,
		insert_mappings = true,
		persist_size = true,
		direction = "horizontal",
		close_on_exit = true,
		shell = "bash",
		float_opts = {
			border = "single",
			winblend = 0,
		},
		highlights = {
			Normal = {
				-- guibg = "#282828",
			},
		},
	})

	function _G.set_terminal_keymaps()
		local opts = { noremap = true }
		vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
	end
	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end
M.lazy = {
	{
		"akinsho/toggleterm.nvim",
		events = "BufNew",
		config = config,
		keys = {
			{
				"<C-\\>",
				function()
					local path = vim.fn.expand("%:p:h")
					return vim.cmd(vim.v.count .. " ToggleTerm dir=" .. path)
				end,
				silent = true,
				noremap = true,
				desc = "",
			},
		},
	},

	-- Opens files in from nvim t-buffer to nvim buffer
	{
		"willothy/flatten.nvim",
		config = {
            window = {
                open = "alternate"
            }
        },
		-- or pass configuration with
		-- opts = {  }
		-- Ensure that it runs first to minimize delay when opening file from terminal
		lazy = false,
		priority = 1001,
	},
}

return M.lazy
