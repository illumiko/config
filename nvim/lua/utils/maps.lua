local M = {}

M.map = vim.keymap.set

M.nmap = function(lhs, rhs, opts)
	return M.map("n", lhs, rhs, opts)
end

M.imap = function(lhs, rhs, opts)
	return M.map("i", lhs, rhs, opts)
end

M.cmap = function(lhs, rhs, opts)
	return M.map("c", lhs, rhs, opts)
end

M.vmap = function(lhs, rhs, opts)
	return M.map("v", lhs, rhs, opts)
end

M.opts = function(meta)
	return { noremap = true, silent = true, desc = meta }
end

return M

