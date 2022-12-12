-- Set barbar's options
require'bufferline'.setup {
  -- Enable/disable close button
  closable = false,
  -- Enables / disables diagnostic symbols
  diagnostics = {
    -- you can use a list
    {enabled = true, icon = 'ﬀ'}, -- ERROR
    {enabled = false}, -- WARN
    {enabled = false}, -- INFO
    {enabled = false},  -- HINT

    -- OR `vim.diagnostic.severity`
    [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
    [vim.diagnostic.severity.WARN] = {enabled = false},
    [vim.diagnostic.severity.INFO] = {enabled = false},
    [vim.diagnostic.severity.HINT] = {enabled = false},
  },
  icons = true,
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = true,
  insert_at_start = false,
  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,
  -- Sets the minimum padding width with which to surround each tab
  minimum_padding = 1,
  -- Sets the maximum buffer name length.
  maximum_length = 20,
}
