return {
	s(
		"rfunc",
		fmta(
			[=[
        <1> err := <2>
        if err != nil {
            <3>
        }
      ]=],
			{
				c(1, { fmta("<>", { i(1) }), fmta("<>,", i(1, "Respond")) }),
				i(2),
				c(3, { fmta("log.Fatal(<>)", { i(1, "err") }), fmta("<>", i(1, "Handle")) }),
			}
		)
	),
	s(
		"tfunc",
		fmta(
			[=[
                func <1>(t *testing.T) {
                <2>
                }
      ]=],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		"lisn",
		fmta(
			[=[
        http.HandleFunc("/", handleIndex)
        http.Handle("/favicon.ico", http.NotFoundHandler())
        http.ListenAndServe(":8080", nil)
      ]=],
			{} --<--required
		)
	),
	s(
		{ trig = "flog", snippetType = "autosnippet" },
		fmta(
			[=[
          log.Fatal(<>)
      ]=],
			{ i(1, "text") }
		)
	),
	s(
		{ trig = "prin", snippetType = "autosnippet" },
		fmta(
			[=[
          fmt.Println(<>)
      ]=],
			{ i(1, "text") }
		)
	), --}}}
	s(
		{ trig = "fprin ", snippetType = "autosnippet" },
		fmta(
			[=[
          fmt.Printf(<>)
      ]=],
			{ i(1, " ") }
		)
	), --}}}
	s(
		"tferr", --{{{
		fmta(
			[=[
          t.Errorf(<>)
      ]=],
			{ c(1, { fmta("<>", { i(1) }), fmta("<>", i(1, "'got: %v \\n wanted: %v \\n'")) }) }
		)
	),
}
