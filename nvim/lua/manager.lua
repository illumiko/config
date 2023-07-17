----------------------------------------------
--
--[[#PLUGINS]]
----------------------------------------------
local fn = vim.fn
-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)
vim.g.mapleader = " "
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)

-- Autocommand that reloads neovim whenever you save the plugins.lua file

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Have packer use a popup window
lazy.setup("plugin", {
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = false, -- get a notification when changes are found
	},
})
