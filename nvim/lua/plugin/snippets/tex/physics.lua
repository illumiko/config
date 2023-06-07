local get_visual = function(args, parent)
	if #parent.snippet.env.SELECT_RAW > 0 then
		return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
	else
		return sn(nil, i(1, ""))
	end
end

-- Math context detection
local tex = {}
tex.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
	return not tex.in_mathzone()
end

tex.in_circuitikz_zone = function()
	local get = vim.fn["vimtex#env#is_inside"]("circuitikz")
	if get[0] ~= 0 and get[1] ~= 0 then
		return true
	else
		return false
	end
end

return {
	s(
		{ trig = "pb", wordTrig = true, regTrig = false, snippetType = "autosnippet" },
		fmta(
			[=[
        \draw (0,0)
        to[battery1, -*, v_=$<>v$] ++(4,0) node (b){};
        \draw <>
        ]=],
			{ i(1, "voltage"), i(0) }
		),
		{ condition = tex.in_circuitikz_zone }
	),

	s(
		{ trig = "tr", wordTrig = true, regTrig = false, snippetType = "autosnippet" },
		fmta(
			[=[
        to[R, -*, R=$R_<>{=<> \Omega}$] ++(<>,<>) node(r<>){};
        ]=],
			{ i(1, "R name"),i(2,"ohm"), i(3, "x-coordinate"), i(4, "y-coordinate"), rep(1) }
		),
		{ condition = tex.in_circuitikz_zone }
	),

	s(
		{ trig = "tsh", wordTrig = true, regTrig = false, snippetType = "autosnippet" },
		fmta(
			[=[
        to[short, -*] ++(<>,<>)
        ]=],
			{ i(1, "x-coordinate"), i(2, "y-coordinate") }
		),
		{ condition = tex.in_circuitikz_zone }
	),
}
