local path, date = "~/Documents/norg/journal/", os.date("%Y-%m-%d")
local prefix, suffix = ":e ", "<CR>"
local file = path .. date .. ".norg"
local full_cmd = prefix .. file .. suffix
print(full_cmd)
