vim.opt.guifont = { "JetBrainsMono Nerd Font", ":h18" }

vim.g.neovide_transparency = 0.95
vim.g.neovide_scale_factor = 1
vim.g.neovide_floating_blur_amount_x = 20.0
vim.g.neovide_floating_blur_amount_y = 0.0
vim.g.neovide_input_use_logo = true -- true on macOS

vim.opt.laststatus = 3
vim.opt.fillchars:append({
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
})

-- tokyonight -- {{{

require("tokyonight").setup({
	style = "night",
	transparent = false,
	terminal_colors = true,
	styles = {
		types = { italic = true, bold = true },
		keywords = { italic = true },
		functions = { bold = true },
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	sidebaers = { "qf", "help" },
	dim_inactive = true,
	-- day_brightness = 0.3
	--boarderless telescope
	on_highlights = function(hl, c)
		local prompt = "#2d3149"
		hl.TelescopeNormal = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopePromptNormal = {
			bg = prompt,
		}
		hl.TelescopePromptBorder = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePromptTitle = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePreviewTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
	end,
})
vim.cmd("colorscheme tokyonight")
-- }}}
