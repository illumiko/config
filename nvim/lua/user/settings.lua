vim.opt.backup = false -- creates a backup file
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
-- vim.opt.colorcolumn = "100" -- fixes indentline for now
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 2 -- always show tabs
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 1 spaces for a tab
vim.opt.smarttab = true
vim.opt.cursorline = true -- highlight the current line
vim.opt.numberwidth = 2 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.spell = false
vim.opt.spelllang = "en"
vim.opt.scrolloff = 4 -- use this with zz(centers view)
vim.opt.sidescrolloff = 0
vim.opt.softtabstop = 4
vim.opt.laststatus = 3
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.breakindent = true
vim.opt.wh = 25
vim.opt.wiw = 120
vim.opt.showbreak = string.rep(" ", 3) 
-- Make it so that long lines wrap smartly
vim.opt.linebreak = true
vim.opt.fillchars:append({
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})
vim.cmd([[
command Journal source ~/Documents/norg/sessions/vp.vim
set noshowcmd noruler
"set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
]])
--local add_cmd = vim.api.nvim_create_autocmd("NeorgToMd", function()
----    -- File name without extension .
--    vim.cmd("Neorg export to-file " .. fn.expand("%:t:r") .. ".md")
--end, { force = true })
-- vim.textwidth = 120--{{{
-- vim.opt.relativenumber = true
vim.opt.foldmethod = "marker" --}}}
