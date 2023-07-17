local M = {}
local config = {}
config.leap = function ()
    require('leap').add_default_mappings()
end


M.lazy = {
    -- "ggandor/leap.nvim",
    -- config = config.leap
}

return M.lazy
