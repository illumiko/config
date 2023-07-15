local imap = require("utils.maps").imap
local cmap = require("utils.maps").cmap

local opts  = function (meta)
    return { noremap = true, silent = true, desc = ""}
end

local ls = require("luasnip")
vim.g.mapleader = " "

local Binds = {map_type = "",  maps = {} }

function Binds:new(map_type, maps)
	setmetatable({}, Binds)

	self.maps = maps
	self.map_type = map_type

	return self
end

function Binds:bind()
	for _, value in ipairs(self.maps) do
		vim.keymap.set(self.map_type, value[1], value[2], value[3])
	end
end

local visual_keybinds = Binds:new("v", {
	--better copy
	{ "Y", '"+y$', opts("") },
	{ "y", '"+y', opts("") },
	{ "yi]", '"+yi]', opts("") },
	{ [[yi']], [["+yi']], opts("") },
	{ [[yi}]], [["+yi}]], opts("")},
	{ [[yi"]], [["+yi"]], opts("")},
	{ [[yi)]], [["+yi)]], opts("")},

	--indent
	{"<", "<gv", opts("")},
	{">", ">gv", opts("")},
})
visual_keybinds:bind()

local normal_keybinds = Binds:new("n", {
	{ "<Space>", "<NOP>", opts("") },

	--center after c-d/u
	{ "<c-d>", "<c-d>zz", opts("")},
	{ "<c-u>", "<c-u>zz", opts("") },

	--better copy
	{ "Y", '"+y$', opts("") },
	{ "y", '"+y', opts("") },
	{ "yi]", '"+yi]', opts("") },
	{ [[yi']], [["+yi']], opts("")},
	{ [[yi}]], [["+yi}]], opts("")},
	{ [[yi"]], [["+yi"]], opts("")},
	{ [[yi)]], [["+yi)]], opts("")},

	--Norg
	{ "<M-1>", ":e ~/Documents/norg/main/index.norg<CR>", opts("") },

	--Format
	{ "<leader>F", ":FormatWrite<CR>", opts("Format") },

	--Clear hlsearch
	{ "<Leader>H", ":set hlsearch!<CR>", opts("clear hls") },

	--Swap window
	{ "<C-x>", "<C-w>x", opts("") },

	--Tab next/previous
	{ "<leader>tp", ":tabprevious<CR>", opts("") },
	{ "<leader>tn", ":tabnext<CR>", opts("") },

	--Buffer next/previous
	{ "<S-l>", ":bnext<CR>", opts("") },
	{ "<S-h>", ":bprevious<CR>", opts("") },

	--Switch to original buffer from a jump
	{ "<bs>", ":edit #<cr>", opts("") },

	--I forgot
	{ "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } },
	{ "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } },
})
normal_keybinds:bind()




--TogTerm toggle
vim.cmd([[ "sets the close key for toggle term
" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-\> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]])

--Luasnip stuff
vim.cmd([[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<cmd>lua require("luasnip").jump(1)<cr>' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>
]])

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

------------------
-- better ESC
------------------
imap("jk", "<ESC><cmd>LuaSnipUnlinkCurrent<CR>", opts)
cmap("jk", "<ESC>", opts)
