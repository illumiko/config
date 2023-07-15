local M = {}
local config = function()
	local util = require("formatter.util")
	require("formatter").setup({
		filetype = {
			lua = {
				require("plugin.format.filetype_conf.lua").stylua,
			},
			javascript = {
				require("plugin.format.filetype_conf.javascript").prettiereslint,
				function()
					return {
						exe = "prettier-eslint",
						args = {
							"--tabWidth 2",
							"--stdin",
							"--stdin-filepath",
							util.escape_path(util.get_current_buffer_file_path()),
						},
						stdin = true,
						try_node_modules = true,
					}
				end,
			},
			json = {
				require("plugin.format.filetype_conf.json"),
			},
			typescript = {
				require("plugin.format.filetype_conf.typescript").prettiereslint,
			},
			go = {
				require("plugin.format.filetype_conf.go").goimports,
			},
			-- vimwiki = {
			-- 	require("plugin.format.filetype_conf.markdown").markdownlint,
			-- },
		},
	})
	vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd FileType go autocmd InsertLeave * Format
augroup END
]])
end
M.lazy = {
	"mhartington/formatter.nvim",
	config = config,
}

return M.lazy
