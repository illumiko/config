-- to disable rich presence for norg files
--[[ local function disable()
    local norg = require("neorg")
    if norg.is_loaded() == true then 
        print(norg.is_loaded)
        package.loaded.presence:cancel()
    end
end ]]
-- disable()
