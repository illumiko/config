local output_bufnr, command = 13, { "go", "run", "main.go" }
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("playground", { clear = true }),
	pattern = "main.go",
	callback = function()
		local append_data = function(_, data)
			if data then
				vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
			end
		end

		vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "main.go:" })
		vim.fn.jobstart(command, {
			stdout_buffered = true,
			on_stdout = append_data,
			on_stderr = append_data,
		})
	end,
})
