local M = {}
M.get_dir = function(path)
	local t = {}
	local index = 1
	while true do
		index = string.find(path, "/", index + 1)
		if index == nil then
			break
		end
		table.insert(t, index)
	end
	local location = string.sub(path, 1, t[#t])
    print(location)
    return location
end
return M

