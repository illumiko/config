return {
	s(
		{ trig = "([^%w])ce", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta(
			[=[
\begin{center}
    \vspace{10pt}
    \ce{<>}
    \vspace{10pt}
\end{center}
            ]=],
			{ i(1) }
		),
		{ condition = line_begin }
	),
}
