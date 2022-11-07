local map = vim.keymap.set
local ls = require("luasnip")
local opts = { noremap = true, silent = true }
map("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "

-- vim.cmd([[inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]])
--[===[normal mode]===]
--[[toggle term]]
--opens toggle term in a the dir of the working buffer
vim.keymap.set("n", "<C-\\>", function ()
    local path = vim.fn.expand('%:p:h')
    return vim.cmd('ToggleTerm dir=' .. path)
end, opts)
--[[highlight Str]]
map("v", "<F3>", ":<cmd>HSHighlight" .. 1 .."<CR><esc>", opts)
map("v", "<F4>", "<cmd>HSRmHighlight<CR><esc>", opts)
--[[Source config]]
map("n", "<leader>R", ":source %<cr>", opts)
--[[specs effect on search movement]]
map("n", "n", 'n:lua require("specs").show_specs()<CR>', opts)
map("n", "N", 'N:lua require("specs").show_specs()<CR>', opts)
--[[focus Management]]
map("n", "<C-f>", ":FocusMaximise <CR>", opts)
--[[hjkl movement in colemak]]
map("n", "<C-h>", "h", opts) --{{{
map("n", "<C-n>", "j", opts)
map("n", "<C-e>", "k", opts)
map("n", "<C-i>", "l", opts) --}}}
-- [[better window movemnt]]
map("n", "<leader>w", ":lua require('nvim-window').pick()<CR>", opts)
-- [[Norg]]
map("n", "<leader>oNs", ":NeorgStart<CR>", opts)
map("n", "<leader>oNjtd", ":Neorg journal today<CR>", opts)
map("n", "<leader>oNjty", ":Neorg journal yesterday<CR>", opts)
--[[Format]]
map("n", "<leader>F", ":FormatWrite<CR>", opts)
--[[verticle movement in wrapped lines]]
--[[ map("n", "j", "gj", opts)
        map("n", "k", "gk", opts) ]]
-- [[telescope]]
-- map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
map("n", "<leader>ffp", "<cmd>lua require('telescope.builtin').find_files({cwd='~/Documents/Projects/'})<CR>", opts) -- opening telescope in Projects dir
map("n", "<leader>ffc", "<cmd>lua require('telescope.builtin').find_files({cwd='~/.config/'})<CR>", opts) --  opening telescope in config folder
map("n", "<leader>fff", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts) --  opening telescope in config folder
map("n", "<leader>ffo", ":Telescope oldfiles<CR>", opts) --  opening telescope in config folder
map("n", "<leader>ffg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts) --  opening telescope in config folder
map("n", "<leader><Tab>", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts) --  opening telescope in config folder
-- map("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
-- [[lsp]]
map("n", "gdD", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--[[ map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts) ]]
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
--[[goto def float]]
map("n", "gdd", ":lua require('goto-preview').goto_preview_definition()<cr>", opts)
map("n", "gdi", ":lua require('goto-preview').goto_preview_implementation()<cr>", opts)
map("n", "gdc", ":lua require('goto-preview').close_all_win()<cr>", opts)
map("n", "gdr", ":lua require('goto-preview').goto_preview_references()<cr>", opts)

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
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--[[tabline]]
map("n", "<A-h>", ":tabprevious<CR>", opts)
map("n", "<A-l>", ":tabnext<CR>", opts)

-- [[bufferline]]
map("n", "<S-h>", ":BufferPrevious<CR>", opts)
map("n", "<S-l>", ":BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", " :BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)
-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)
map("n", "<S-Tab>", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts) --bufferPicker

--vertical split
map("n", "<Leader>v", ":vsp<CR>", opts)

--split
map("n", "<Leader>v", ":sp<CR>", opts)

--[===[insert mode]===]
--[[
        map('i', '<A-Up>', '<C-\\><C-N><C-w>k', {noremap = true, silent = true})
        map('i', '<A-Down>', '<C-\\><C-N><C-w>j', {noremap = true, silent = true})
        map('i', '<A-Left>', '<C-\\><C-N><C-w>h', {noremap = true, silent = true})
        map('i', '<A-Right>', '<C-\\><C-N><C-w>l', {noremap = true, silent = true})
        ]]

--[[luasnip]]
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
--better ESC
map("i", "jj", "<cmd>LuaSnipUnlinkCurrent<CR><ESC>", opts)
map("i", "jk", "<cmd>LuaSnipUnlinkCurrent<CR><ESC>", opts)
map("i", "kj", "<cmd>LuaSnipUnlinkCurrent<CR><ESC>", opts)
map("i", "<C-ne>", "<ESC>", opts)
map("i", "<", "<", opts)
--[===[visiual mode]===]
--better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "<leader>c", ":Commentary<CR>", opts)

--[===[visual block]===]
-- map('x', '<leader>c',':Commentary<CR>', opts)

--moving blocks of code
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)
