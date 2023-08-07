local M = {}

config = function()
    require('wlsample.evil_line')
end

M.lazy = {
	"windwp/windline.nvim",
	config = config,
}
return {}
