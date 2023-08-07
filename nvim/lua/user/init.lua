require("user.keymaps")
require("user.settings")
require("user.autocmds")

vim.cmd("colorscheme gruvbox")
require("user.highlights")
vim.o.statusline = vim.o.tabline
vim.o.showtabline = 0
vim.o.laststatus = 3
