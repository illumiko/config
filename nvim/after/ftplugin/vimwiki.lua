vim.o.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.o.tabstop = 2 -- insert 1 spaces for a tab
vim.o.smarttab = true
vim.o.autoindent = true

vim.cmd([[
set conceallevel=2
syn match IndentWS '\v^( {4}|\t)+\S@=' contains=IndentEndWS,IndentStartWS
syn match IndentStartWS '\v( {4}|\t)' conceal cchar== 
syn match IndentEndWS '\v( {4}|\t)\S@=' conceal cchar=▶

syn region markdownH1 matchgroup=markdownH1Delimiter start=" \{,3}#\s"      end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH2 matchgroup=markdownH2Delimiter start=" \{,3}##\s"     end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH3 matchgroup=markdownH3Delimiter start=" \{,3}###\s"    end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH4 matchgroup=markdownH4Delimiter start=" \{,3}####\s"   end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH5 matchgroup=markdownH5Delimiter start=" \{,3}#####\s"  end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
syn region markdownH6 matchgroup=markdownH6Delimiter start=" \{,3}######\s" end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
]])

print("Hello world")
