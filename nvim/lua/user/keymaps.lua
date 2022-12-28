local map = vim.keymap.set
local ls = require("luasnip")

local opts = function(meta)
	return { noremap = true, silent = true, desc = meta }
end

map("n", "<Space>", "<NOP>", opts("wk"))
vim.g.mapleader = " "
-- vim.cmd([[inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]])
--Normal Mode
--opens toggle term in a the dir of the working buffer
vim.cmd([[
" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]])

--[[highlight Str]]
map("v", "<F3>", "HSHighlight " .. vim.v.count .. "<CR>", opts(""))
map("v", "<F4>", "<cmd>HSRmHighlight<CR><esc>", opts(""))
--[[proper copy]]
map("v", "Y", '"+y', opts(""))
map("x", "y", '"+y', opts(""))

--[[Source config]]
map("n", "<leader>R", ":source %<cr>", opts("Reload current file"))

--[[F/f with hopcurrentline]]

--[[Quit]]
map("n", "<leader>Q", ":wqa<CR>", opts("Quit"))

--[[focus Management]]
map("n", "<C-f>", "FocusMaximise <CR>", opts("Max width"))

--[[hjkl movement in colemak]]
--[[ map("n", "<C-h>", "h", opts("")) --{{{
map("n", "<C-n>", "j", opts(""))
map("n", "<C-e>", "k", opts(""))
map("n", "<C-i>", "l", opts("")) --}}} ]]

-- [[better window movemnt]]
map("n", "<leader>w", ":lua require('nvim-window').pick()<CR>", opts("Window jump"))

--[[Buff deleto]]


-- [[Norg]]
map("n", "<leader>oNjtd", ":Neorg journal today<CR>", opts("Journal today"))
map("n", "<leader>oNjty", ":Neorg journal yesterday<CR>", opts("Journal yesterday"))
map("n", "<leader>oNjtt", ":Neorg journal tomorrow<CR>", opts("Journal tomorrow"))
--[[Format]]
map("n", "<leader>F", ":FormatWrite<CR>", opts("Format"))

-- [[telescope]]
-- map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts(""))
-- map("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts(""))

-- [[lsp]]

--[[ map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts(""))
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts(""))
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts("")) ]]

---[[goto def float]]
-- map("n", "<Space>lr", "<cmd>lua vim.lsp.buf.references()<CR>", opts(""))
map("n", "K", function()
	return vim.cmd("Lspsaga hover_doc")
end, opts("Hover"))

-- [[hop]]

-- [[file browser]]
-- map('n', '<Leader>e',':NvimTreeToggle<CR>', opts(""))

-- [[no hl]]
map("n", "<Leader>H", ":set hlsearch!<CR>", opts("Clear hls"))

-- [[better split management]]
map("n", "<C-h>", ":NaviagotorLeft<CR>", opts("Window Left"))
map("n", "<C-j>", ":NaviagotorDown<CR>", opts("Window Down"))
map("n", "<C-k>", ":NavigatorUp<CR>", opts("Window Up"))
map("n", "<C-l>", ":NavigatorRight<CR>", opts("Window Right"))

--  [[Resizeing Splits with arrow]]
-- map("n", "<C-Up>", ":resize -2<CR>", opts(""))
-- map("n", "<C-Down>", ":resize +2<CR>", opts(""))
-- map("n", "<C-Left>", ":vertical resize -2<CR>", opts(""))
-- map("n", "<C-Right>", ":vertical resize +2<CR>", opts(""))

--[[tabline]]
map("n", "<leadert>tp", "<cmd>tabprevious<CR>", opts("Tab Next"))
map("n", "<leader>tn", ":tabnext<CR>", opts("Tab Prev"))

-- [[Cybu buffer switch]]
map("n", "<S-l>", ":BufferNext<CR>", opts(""))
map("n", "<S-h>", ":BufferPrevious<CR>", opts(""))

-- Close buffer
-- map("n", "<C-c>", ":BufferClose<CR>", opts(""))

-- Sort automatically by...
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
map("i", "jk", "<cmd>LuaSnipUnlinkCurrent<CR><ESC>", opts(""))

map("i", "<", "<", opts(""))
--[===[visiual mode]===]
--better indenting
map("v", "<", "<gv", opts(""))
map("v", ">", ">gv", opts(""))

--[===[visual block]===]
-- map('x', '<leader>c',':Commentary<CR>', opts(""))
--moving blocks of code
map("x", "K", ":move '<-2<CR>gv-gv", opts(""))
map("x", "J", ":move '>+1<CR>gv-gv", opts(""))
