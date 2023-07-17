vim.o.backup = false -- creates a backup file
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.o.cmdheight = 0 -- more space in the neovim command line for displaying messages
-- vim.opt.colorcolumn = "100" -- fixes indentline for now
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.o.ignorecase = true -- ignore case in search patterns
vim.o.pumheight = 15 -- pop up menu height
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- vim.o.showtabline = 2 -- always show tabs
vim.o.smartcase = true -- smart case
vim.o.smartindent = true -- make indenting smarter again
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.swapfile = false -- creates a swapfile
vim.o.termguicolors = true -- set term gui colors (most terminals support this)
vim.o.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.title = true -- set the title of window to the value of the titlestring
vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.o.undofile = true -- enable persistent undo
vim.o.updatetime = 300 -- faster completion
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.o.tabstop = 4 -- insert 1 spaces for a tab
vim.o.smarttab = true
vim.o.cursorline = true -- highlight the current line
vim.o.numberwidth = 4 -- set number column width to 2 {default 4}
vim.o.wrap = false -- display lines as one long line
vim.o.spell = false
vim.o.spelllang = "en"
vim.o.scrolloff = 4 -- use this with zz(centers view)
vim.o.sidescrolloff = 0
vim.o.softtabstop = 4
vim.o.laststatus = 3
vim.o.number = true
vim.o.relativenumber = true
vim.o.breakindent = true
vim.cmd("set shortmess+=cCFAI")
-- vim.o.wh = 20
-- vim.o.wiw = 100
-- vim.o.showbreak = string.rep(" ", 3)
-- Make it so that long lines wrap smartly

vim.o.linebreak = true
vim.opt.fillchars:append({
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
})
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.cmd([[
command Journal source ~/Documents/norg/sessions/vp.vim
]])
-- vim.opt.foldcolumn = "1"
vim.cmd([[
set noshowcmd noruler
]])
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- vim.o.foldmethod = "marker"
