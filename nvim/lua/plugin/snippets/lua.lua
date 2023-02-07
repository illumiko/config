return {
	s(
		{ trig = "newsnip", wordTrig = true, regTrig = false },
		fmta(
			[[
                s(
                    { trig = "<>", wordTrig = <>, regTrig = <>, snippetType = "<>" },
                    fmta([=[

                    <>

                    ]=], {<>}),
                    {<>}
                ),
        ]],
            {
                i(1, "trigger"),
                i(2, "true"),
                i(3, "false"),
                i(4, "snippets|autosnippets"),
                i(5,"the snippet"),
                i(6,"snippetnodes"),
                i(7,"editional options")
            }

		)
	),
}
