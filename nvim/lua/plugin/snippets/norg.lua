local line_begin = require("luasnip.extras.expand_conditions").line_begin
return {
	s({ trig = "([^%w])h1", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[* {}]], i(0))),
	s({ trig = "([^%w])h2", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[** {}]], i(0))),
	s({ trig = "([^%w])h3", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[*** {}]], i(0))),
	s({ trig = "([^%w])h4", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[**** {}]], i(0))),
	s({ trig = "([^%w])h5", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[***** {}]], i(0))),
	s({ trig = "tk", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmt([[  ( ) {}]], i(0))),
	s(
		{ trig = "daily", wordTrig = true, regTrig = false, snippetType = "snippet" },
		fmta(
			[=[** Daily
   - ( ) Eye drop
   -- ( ) 1
   -- ( ) 2
   -- ( ) 3
   -- ( ) 4

   - ( ) Namaj
   -- ( ) Fazr
   -- ( ) Jumma
   -- ( ) Asr
   -- ( ) Magrib
   -- ( ) Asha <> ]=],
			{ i(0) }
		)
	),

	s(
		{ trig = "sc ", wordTrig = true, dscr = "boiler plate for schedule timers", snippetType = autosnippet },
		fmt([[- {1}: {2}      *<{3}-{4}-{5} {6}>*]], {
			i(1, "school|udvash"),
			i(2, "Subject"),
			i(3, "year"),
			i(4, "month"),
			i(5, "day"),
			i(6, "time(4:00 pm)"),
		}),
		{ condition = line_begin }
	),

	s({
		trig = "haj",
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
					[2] = "*Refresh strategy: 30m nap + shower + coffee*",
					[3] = "* Agenda",
					[4] = "* Pomodoro",
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
	}, { condition = line_begin }),

	s({ trig = "routine", dscr = "routine_generator", docstring = "routine" }, {
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
	}, { conditon = line_begin }),

	s(
		{ trig = "slog", docstring = "slog", snippetType = "snippet", dscr = "time logging" },
		f(function()
			local time = {}
			local functions = {}
			local helper_functions = {}

			time.start_time = vim.fn.input("Enter start time(24H:M) = ")
			time.end_time = vim.fn.input("Enter end time(24H:M) =")

			helper_functions.into_seconds = function(time)
				local hour = tonumber(string.sub(time, 1, 2))
				local min = tonumber(string.sub(time, 4, 5))

				return (hour * 60 ^ 2) + (min * 60)
			end

			helper_functions.into_time = function(time)
				local minute_in_sec = time % (60 ^ 2) -- hour % (60x60) = minute; 1h = 60minx60sec = 3600seconds

				if minute_in_sec ~= 0 then
					local hour = (time - minute_in_sec) / (60 ^ 2)
				end
				local hour = (time - minute_in_sec) / (60 ^ 2)
				local min = minute_in_sec / 60

				return { hour, min }
			end

			helper_functions.status = function(time)
				local hour = tonumber(string.sub(time, 1, 2))
				local min = tonumber(string.sub(time, 4, 5))

				local xtime = os.time({ day = 1, year = 1, month = 1, hour = hour, min = min })
				return os.date("%p", xtime)
			end

			helper_functions.tbl_to_string = function(tbl) -- {{{
				return tbl[1] .. ":" .. tbl[2] .. " H"
			end -- }}}

			functions.calculate_duration = function(start_time, end_time)
				local start_sec = helper_functions.into_seconds(start_time)
				local end_sec = helper_functions.into_seconds(end_time)
				local duration_sec = end_sec - start_sec
				local duration = helper_functions.into_time(duration_sec)

				return duration
			end

			functions.format = function()
				local start_time = time.start_time .. helper_functions.status(time.start_time)
				local end_time = time.end_time .. helper_functions.status(time.end_time)
				return "{"
					.. helper_functions.tbl_to_string(functions.calculate_duration(time.start_time, time.end_time))
					.. "} "
					.. "[ "
					.. start_time
					.. " -> "
					.. end_time
					.. " ]"
			end

			return functions.format()
		end)
	),

	s({
		trig = "sF",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Session time (now -> future)",
		docstring = "sF",
	}, {
		t("** Session "),
		i(1, "1"),
		f(function()
			-- TODO: swap the variable namees
			local M = {}
			local time = {}
			local helper_functions = {}

			time.duration = vim.fn.input("Enter duration(24H:M) ")
			time.end_time = os.date("%H:%M")

			helper_functions.into_seconds = function(type, time) -- type: duraiton || clock
				local hour = tonumber(string.sub(time, 1, 2))
				local min = tonumber(string.sub(time, 4, 5))

				if hour == 0 and type ~= "duration" then
					return (24 * 60 ^ 2) + (min * 60)
				end
				return (hour * 60 ^ 2) + (min * 60)
			end

			helper_functions.into_time = function(time)
				local minute_in_sec = time % (60 ^ 2) -- hour % (60x60) = minute; 1h = 60minx60sec = 3600seconds

				local hour = (time - minute_in_sec) / (60 ^ 2)
				local min = minute_in_sec / 60
				if hour < 10 then
					hour = 0 .. hour
				end
				if min < 10 then
					min = 0 .. min
				end

				return { hour, min }
			end

			helper_functions.status = function(time)
				local hour = tonumber(string.sub(time, 1, 2))
				local min = tonumber(string.sub(time, 4, 5))

				local xtime = os.time({ day = 1, year = 1, month = 1, hour = hour, min = min })
				return os.date("%p", xtime)
			end

			helper_functions.tbl_to_string = function(tbl) -- {{{
				-- vim.pretty_print()
				return tbl[1] .. ":" .. tbl[2]
			end -- }}}

			helper_functions.format = function(start_time, end_time, duration)
				return " {" .. duration .. " H" .. "} " .. "[ " .. start_time .. " -> " .. end_time .. " ]"
			end

			-- end_time got, duraiton got, now calc start time
			M.main = function(duration, end_time)
				local end_time_seconds = helper_functions.into_seconds("", end_time)
				local duraiton_seconds = helper_functions.into_seconds("duration", duration)
				local start_time =
					helper_functions.tbl_to_string(helper_functions.into_time(end_time_seconds + duraiton_seconds))
				return helper_functions.format(end_time, start_time, duration)
			end

			return (M.main(time.duration, time.end_time))
		end),
		t({ "", "" }),
		i(0),
	}), --}}}

	s({
		trig = "sP",
		wordTrig = true,
		snippetType = "autosnippet",
		dscr = "Session time (past -> now)",
		docstring = "sP",
	}, {
		t("** Session "),
		i(1, "1 "),
		f(function()
			local M = {}
			local time = {}
			local helper_functions = {}

			time.duration = vim.fn.input("Enter duration(24H:M) ")
			time.end_time = os.date("%H:%M")

			helper_functions.into_seconds = function(type,time) -- type: duration || clock
				local hour = tonumber(string.sub(time, 1, 2))
				local min = tonumber(string.sub(time, 4, 5))

				if hour == 0 and type ~= "duration" then
					return (24 * 60 ^ 2) + (min * 60)
				end
				return (hour * 60 ^ 2) + (min * 60)
			end

			helper_functions.into_time = function(time)
				local minute_in_sec = time % (60 ^ 2) -- hour % (60x60) = minute; 1h = 60minx60sec = 3600seconds

				local hour = (time - minute_in_sec) / (60 ^ 2)
				local min = minute_in_sec / 60
				if hour < 10 then
					hour = 0 .. hour
				end
				if min < 10 then
					min = 0 .. min
				end

				return { hour, min }
			end

			helper_functions.status = function(time)
				local hour = tonumber(string.sub(time, 1, 2))
				local min = tonumber(string.sub(time, 4, 5))

				local xtime = os.time({ day = 1, year = 1, month = 1, hour = hour, min = min })
				return os.date("%p", xtime)
			end

			helper_functions.tbl_to_string = function(tbl) -- {{{
				-- vim.pretty_print()
				return tbl[1] .. ":" .. tbl[2]
			end -- }}}

			helper_functions.format = function(start_time, end_time, duration)
				return " {" .. duration .. " H" .. "} " .. "[ " .. start_time .. " -> " .. end_time .. " ]"
			end

			-- end_time got, duraiton got, now calc start time
			M.main = function(duration, end_time)
				local end_time_seconds = helper_functions.into_seconds("",end_time)
				local duraiton_seconds = helper_functions.into_seconds("duration",duration)
				local start_time =
					helper_functions.tbl_to_string(helper_functions.into_time(end_time_seconds - duraiton_seconds))
				return helper_functions.format(start_time, end_time, duration)
			end

			return (M.main(time.duration, time.end_time))
		end),
		t({ "", "" }),
		i(0),
	}), --}}}
}
