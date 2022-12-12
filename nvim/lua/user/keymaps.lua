local map = vim.keymap.set
local ls = require("luasnip")
local opts = { noremap = true, silent = true }
map("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "

-- vim.cmd([[inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]])
--Normal Mode
--opens toggle term in a the dir of the working buffer
map("n", "<C-\\>", function()
	local path = vim.fn.expand("%:p:h")
	return vim.cmd(vim.v.count .. " ToggleTerm dir=" .. path)
end, opts)
vim.cmd([[
" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]])

--[[highlight Str]]
map("v", "<F3>", "HSHighlight " .. vim.v.count .. "<CR>", opts)
map("v", "<F4>", "<cmd>HSRmHighlight<CR><esc>", opts)

--[[Source config]]
map("n", "<leader>R", ":source %<cr>", opts)

--[[F/f with hopcurrentline]]
map("n", "f", ":HopWordCurrentLine<CR>")
map("n", "F", ":HopChar1CurrentLine<CR>")

--[[Quit]]
map("n", "<leader>Q", ":wqa<CR>", opts)

--[[focus Management]]
map("n", "<C-f>", "FocusMaximise <CR>", opts)

--[[hjkl movement in colemak]]
--[[ map("n", "<C-h>", "h", opts) --{{{
map("n", "<C-n>", "j", opts)
map("n", "<C-e>", "k", opts)
map("n", "<C-i>", "l", opts) --}}} ]]

-- [[better window movemnt]]
map("n", "<leader>w", ":lua require('nvim-window').pick()<CR>", opts)

--[[Buff deleto]]

map(
	"n",
	"<leader>bdh",
	[[<CMD>lua require('close_buffers').delete({type = 'hidden'})<CR>]],
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>bdn",
	[[<CMD>lua require('close_buffers').delete({type = 'nameless'})<CR>]],
	{ noremap = true, silent = true }
)
map(
	"n",
	"<leader>bdd",
	[[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]],
	{ noremap = true, silent = true }
)

-- [[Norg]]
map("n", "<leader>oNs", ":NeorgStart<CR>", opts)
map("n", "<leader>oNjtd", ":Neorg journal today<CR>", opts)
map("n", "<leader>oNjty", ":Neorg journal yesterday<CR>", opts)

--[[Format]]
map("n", "<leader>F", ":FormatWrite<CR>", opts)

-- [[telescope]]
-- map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
map("n", "<leader>fp", "<cmd>lua require('telescope.builtin').find_files({cwd='~/Documents/Projects/'})<CR>", opts) -- opening telescope in Projects dir
map("n", "<leader>fc", "<cmd>lua require('telescope.builtin').find_files({cwd='~/.config/'})<CR>", opts) --  opening telescope in config folder
map("n", "<leader>ff", ":Telescope find_files theme=ivy<CR>", opts) --  opening telescope in config folder
map("n", "<leader>fb", ":Telescope file_browser<CR>", opts) --  opening telescope in config folder
map("n", "<leader>fo", ":Telescope oldfiles<CR>jk", opts) --  opening telescope in config folder
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts) --  opening telescope in config folder
map("n", "<leader><Tab>", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts) --  opening telescope in config folder
-- map("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- [[lsp]]

--[[ map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) ]]

---[[goto def float]]
map("n", "<space>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<space>lpd", ":lua require('goto-preview').goto_preview_definition()<cr>", opts)
map("n", "<space>lpi", ":lua require('goto-preview').goto_preview_implementation()<cr>", opts)
map("n", "<space>lpc", ":lua require('goto-preview').close_all_win()<cr>", opts)
map("n", "<space>lpr", ":lua require('goto-preview').goto_preview_references()<cr>", opts)
-- map("n", "<Space>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "K", function()
	vim.lsp.buf.hover()
end, opts)

-- [[packer stuff]]
map("n", "<leader>Pi", ":PackerInstall<CR>", opts)
map("n", "<leader>Pc", ":PackerCompile<CR>", opts)
map("n", "<leader>PC", ":PackerClean<CR>", opts)
map("n", "<leader>Ps", ":PackerStatus<CR>", opts)
map("n", "<leader>PS", ":PackerSync<CR>", opts)

-- [[hop]]
map("n", "<leader>hl", ":HopLine<CR>", opts)
map("n", "<leader>hc", ":HopChar1<CR>", opts)
map("n", "<leader>hw", ":HopWord<CR>", opts)

-- [[file browser]]
-- map('n', '<Leader>e',':NvimTreeToggle<CR>', opts)
map("n", "<Leader>e", ":NeoTreeFocusToggle<CR>", opts)

-- [[no hl]]
map("n", "<Leader>H", ":set hlsearch!<CR>", opts)

-- [[better split management]]
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

--  [[Resizeing Splits with arrow]]
-- map("n", "<C-Up>", ":resize -2<CR>", opts)
-- map("n", "<C-Down>", ":resize +2<CR>", opts)
-- map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--[[tabline]]
map("n", "<leadert>tp", "<cmd>tabprevious<CR>", opts)
map("n", "<leader>tn", ":tabnext<CR>", opts)

-- [[Cybu buffer switch]]
map("n", "<S-l>", "<Plug>(CybuNext)", opts)
map("n", "<S-h>", "<Plug>(CybuPrev)", opts)

-- Close buffer
-- map("n", "<C-c>", ":BufferClose<CR>", opts)

-- Sort automatically by...
map("n", "<S-Tab>", ":lua require('telescope.builtin').buffers()<CR>jk jj", opts) --bufferPicker
--[===[insert mode]===]

vim.keymap.set("i", "<c-s>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)
vim.keymap.set("i", "<c-e>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)

--better ESC
map("i", "jk", "<cmd>LuaSnipUnlinkCurrent<CR><ESC>", opts)

map("i", "<", "<", opts)
--[===[visiual mode]===]
--better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

--[===[visual block]===]
-- map('x', '<leader>c',':Commentary<CR>', opts)
--moving blocks of code
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)
