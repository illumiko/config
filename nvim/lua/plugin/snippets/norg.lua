return {
	s({ trig = "([^%w])h1", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[* {}]], i(0))),
	s({ trig = "([^%w])h2", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[** {}]], i(0))),
	s({ trig = "([^%w])h3", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[*** {}]], i(0))),
	s({ trig = "([^%w])h4", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[**** {}]], i(0))),
	s({ trig = "([^%w])h5", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[***** {}]], i(0))),
    s({trig="tK ",regTrig=true,wordTrig=false ,snippetType="autosnippet"}, fmt([[( ) {}]],i(0))),
	s(
		{ trig = "sc ", wordTrig = true, dscr = "boiler plate for schedule timers", snippetType = autosnippet },
		fmt([[- {1}: {2}      *<{3}-{4}-{5} {6}>*]], {
			i(1, "school|udvash"),
			i(2, "Subject"),
			i(3, "year"),
			i(4, "month"),
			i(5, "day"),
			i(6, "time(4:00 pm)"),
		})
	),
	s({
		trig = "haj ",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "boiler plate for journal",
		docstring = "hajime",
	}, {
		f(function()
			local routine = {}
			routine.current_day = os.date("%A")
			routine.main = function()
				local template_last_part = {
					[1] = "*TO BE AT A PLACE NO ONE ELSE IS; YOU HAVE DO THINGS NO ONE ELSE WANTS*",
					[2] = "* Agenda",
					[3] = "* Pomodoro",
				}
				local template_first_part = {
					[1] = "@document.meta",
					[2] = "created: " .. os.date("%Y-%m-%d") .. "",
					[3] = "@end",
				}
				-- Union of the two table to create the template
				local len = #template_first_part -- get the the last index of the table to add to
				for e, v in ipairs(template_last_part) do
					template_first_part[len + e] = v
				end
				return template_first_part
			end
			return routine.main()
		end),
	}),
	s({ trig = "routine ", dscr = "routine_generator", docstring = "routine" }, {
		f(function()
			local routine = { -- {{{
				["sunday"] = {
					"Hmath",
					"Bio",
					"Physics(cr)",
				},
				["monday"] = {
					"Bgs",
					"Ime",
					"Bangla (cr)",
					"Math @6/@6:30",
				},
				["tuesday"] = {
					"Revision",
					"Chemistry (cr)",
				},
				["wednesday"] = {
					"Do whatever you want",
					"Bangla (cr)",
					"Math @6/@6:30",
				},

				["thursday"] = {
					"Chemistry/Physics (cr)",
					"Bangla",
				},
				["friday"] = {
					"Physics",
					"GMath",
					"Hujur @10:30",
				},
				["saturday"] = {
					"Revision",
					"Bangla(cr)",
					"Math @6/@6:30",
					"Hujur @3:30",
				},
			} -- }}}
			-- %A returns full weekday string
			routine.current_day = os.date("%A")
			routine.current_day_tasks = routine[string.lower(routine.current_day)]

			routine.main = function()
				local gen_routine = {
					[1] = "* " .. routine.current_day .. "",
				}
				for z, v in ipairs(routine.current_day_tasks) do
					gen_routine[1 + z] = "  - " .. v
				end
				return gen_routine
			end
			return routine.main()
		end),
	}),
	s(
		{
			trig = "sF ",
			wordTrig = true,
			snippetType = "autosnippet",
			dscr = "Session time (now -> future)",
			docstring = "sF",
		},
		{
			t("** Session "),
			i(1, "1 "),
			f(function()
				result = {}
				-- result.start_hour = os.date("%I") -- defining start hour
				result.start_hour = os.date("%I")
				result.start_min = os.date("%M") -- defining start min
				result.status = function(hour, min)
					if os.date("%p") == "am" then
						local time = os.time({ day = 1, year = 1, month = 1, hour = hour, min = min })
						return os.date("%p", time)
					else
						local time = os.time({ day = 1, year = 1, month = 1, hour = hour + 12, min = min })
						return os.date("%p", time)
					end
				end
				result.format_below10 = function(time) --time refers to hour/min
					return "0" .. tostring(time)
				end
				result.format_min_past60 = function(hour, min)
					min = min - 60
					hour = hour + 1
					return hour, min
				end
				result.format_hour_past12 = function(hour)
					return hour - 12
				end
				-- result.end_min is used as we are calc-ing it
				result.format = function(hour, min)
					if result.end_min < 10 then
						result.end_min = result.format_below10(result.end_min)
					end
					if min >= 60 then
						result.end_hour, result.end_min = result.format_min_past60(hour, min)
						print(result.end_hour)
					end
					--as the end_hour gets modifed in the upper cond, i need to check for the global val
					--instead of the value passed as a param
					if result.end_hour > 12 then
						result.end_hour = result.format_hour_past12(result.end_hour)
					end
					return result.end_time()
				end
				result.adder = function(session_duration)
					local ses_hour = string.sub(session_duration, 1, 1)
					local ses_min = string.sub(session_duration, 3, 4)
					return tonumber(result.start_hour) + tonumber(ses_hour),
						tonumber(result.start_min) + tonumber(ses_min)
					-- result.format(result.end_hour,result.end_min)
				end
				result.end_time = function()
					return result.end_hour .. ":" .. result.end_min .. result.status(result.end_hour, result.end_min)
				end
				result.start_time = function()
					return result.start_hour
						.. ":"
						.. result.start_min
						.. result.status(result.start_hour, result.start_min)
				end
				result.init = function()
					local session_duration = vim.fn.input("Enter session duration (H:M) = ")
					result.end_hour, result.end_min = result.adder(session_duration)
					local end_time = result.format(result.end_hour, result.end_min)
					return " {"
						.. session_duration
						.. " H}"
						.. " [ "
						.. result.start_time()
						.. " -> "
						.. end_time
						.. " ]"
				end
				return result.init()
			end),
			t({ "", "" }),
			i(0),
		}
	), --}}}
	s(
		{
			trig = "sP ",
			wordTrig = true,
			snippetType = "autosnippet",
			dscr = "Session time (past -> now)",
			docstring = "sP",
		},
		{
			t("** Session "),
			i(1, "1 "),
			f(function()
				result = {}
				-- result.start_hour = os.date("%I") -- defining start hour
				result.end_hour = os.date("%I")
				result.end_min = os.date("%M") -- defining start min

				result.status = function(hour, min)
					if os.date("%p") == "am" then
						local time = os.time({ day = 1, year = 1, month = 1, hour = hour, min = min })
						return os.date("%p", time)
					else
						local time = os.time({ day = 1, year = 1, month = 1, hour = hour + 11, min = min })
						return os.date("%p", time)
					end
				end

				result.format_below10 = function(time) --time refers to hour/min
					return "0" .. tostring(time)
				end

				result.format_min_below60 = function(hour, min) --when you substract things you go below
					min = min + 60
					hour = hour - 1
					return hour, min
				end

				result.format_hour_past12 = function(hour)
					return hour - 12
				end
				-- the value that gets modified by result.adder is to be used when chaning the variable
				result.format = function(hour, min)
					if result.start_min < 10 then
						result.start_min = result.format_below10(result.start_min)
					end

					if min < 0 then
						result.start_hour, result.start_min = result.format_min_below60(hour, min)
					end
					--as the end_hour gets modifed in the upper cond, i need to check for the global val
					--instead of the value passed as a param
					if result.start_hour > 12 then
						result.start_hour = result.format_hour_past12(result.start_hour)
						print("hi")
					end

					if hour == 0 then
						result.start_hour = 12
					end
					return result.start_time()
				end

				result.adder = function(session_duration)
					local ses_hour = string.sub(session_duration, 1, 1)
					local ses_min = string.sub(session_duration, 3, 4)
					return tonumber(result.end_hour) - tonumber(ses_hour), tonumber(result.end_min) - tonumber(ses_min)
				end

				result.end_time = function()
					return result.end_hour .. ":" .. result.end_min .. result.status(result.end_hour, result.end_min)
				end

				result.start_time = function()
					return result.start_hour
						.. ":"
						.. result.start_min
						.. result.status(result.start_hour, result.start_min)
				end

				result.init = function()
					local session_duration = vim.fn.input("Enter session duration (H:M) = ")
					result.start_hour, result.start_min = result.adder(session_duration)
					local start_time = result.format(result.start_hour, result.start_min)
					return " {"
						.. session_duration
						.. " H}"
						.. " [ "
						.. start_time
						.. " -> "
						.. result.end_time()
						.. " ]"
				end

				return result.init()
			end),
			t({ "", "" }),
			i(0),
		}
	), --}}}
}
