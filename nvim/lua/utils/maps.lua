local M = {}

M.map = vim.keymap.set

M.nmap = function(lhs, rhs, opts)
	return M.map("n", lhs, rhs, opts)
end

M.imap = function(lhs, rhs, opts)
	return M.map("i", lhs, rhs, opts)
end

M.opts = function(meta)
	return { noremap = true, silent = true, desc = meta }
end
return M
