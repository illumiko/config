local nmap = require("utils.maps").nmap
local opts = {buffer=0,noremap = true, silent = true }
-- {{{ Settings
vim.opt.foldlevel = 0
vim.opt.spell = true
-- }}}
-- {{{ keybinds

-- only adds M-1... keybinds to norg ft
vim.api.nvim_create_autocmd({ "BufEnter" }, { -- {{{
	pattern = { "*.norg" },
	group = vim.api.nvim_create_augroup("ng", { clear = true }),
	callback = function()
		nmap("<M-2>", ":e ~/Documents/norg/main/inbox.norg<CR>", opts)
		nmap("<M-3>", function()
			local path, date = "~/Documents/norg/journal/", os.date("%Y-%m-%d")
			local prefix, suffix = ":e ", "<CR>"
			local file = path .. date .. ".norg"
			local full_cmd = prefix .. file .. suffix
			return full_cmd
		end, {buffer=0, expr = true, noremap=true,silent=true })
	end,
}) -- }}}

-- }}}
