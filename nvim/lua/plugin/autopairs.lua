local M = {}
local config = function ()
    require("mini.pairs").setup()
end
M.lazy = {
	"echasnovski/mini.pairs",
	version = false,
    config = config,
}
return M.lazy
