local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
ls.add_snippets(nil, {
	all = {
		ls.parser.parse_snippet("test", "tessssssssst"),
	},
	norg = {
		--{{{ norg snippet
		--[[ ls.parser.parse_snippet("ses", "- [ ] session $1 {$2} [$0->to]"), ]]
		ls.parser.parse_snippet("h1", "* $1"),
		ls.parser.parse_snippet("h2", "** $1"),
		ls.parser.parse_snippet("h3", "*** $1"),
		ls.parser.parse_snippet("h4", "**** $1"),
		ls.parser.parse_snippet("h5", "***** $1"),
		ls.parser.parse_snippet("Ud", "#contexts Udvash"),
		ls.parser.parse_snippet("UdEx", "#contexts UdvashExam"),
		ls.parser.parse_snippet("UdExP", "#contexts UdvashExamPrep"),
		ls.parser.parse_snippet("Todo", "#contexts Todo"),
		ls.parser.parse_snippet("code", "#contexts Code"),
		ls.parser.parse_snippet("pre", "#contexts PreTestPrep"),
		ls.parser.parse_snippet("sHw", "#contexts SchoolHw"),
		s({ trig = "hajime", docstring = "hajime" }, {
			f(function()
				local routine = {-- {{{
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
				}-- }}}
				-- %A returns full weekday string
				routine.current_day = os.date("%A")
				routine.current_day_tasks = routine[string.lower(routine.current_day)]

				routine.main = function()
					local snip_last = {
						[1] = "  ===",
						[2] = "*TO BE AT A PLACE NO ONE ELSE IS; YOU HAVE DO THINGS NO ONE ELSE WANTS*",
						[3] = "* Agenda",
					}
					local snip = {
						[1] = "@document.meta",
						[2] = "created: " .. os.date("%Y-%m-%d") .. "",
						[3] = "@end",
						[4] = "* " .. routine.current_day .. "",
					}
					for z, v in ipairs(routine.current_day_tasks) do
						snip[4 + z] = "  - " .. v
					end
					local len = #snip
					for e, v in ipairs(snip_last) do
						snip[len + e] = v
					end
					return snip
				end

				return routine.main()
			end),
		}),
		--session future{{{
		s({ trig = "sF", docstring = "sF" }, {
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
		}), --}}}
		--session past{{{
		s({ trig = "sP", docstring = "sP" }, {
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
		}), --}}}
		--}}}
	},
	lua = {
		ls.parser.parse_snippet("lvr", "local $1 = require('$0')"),
	},
	javascript = {
		s(
			"IDB", --{{{
			fmt(
				[=[
        const ifExist = (storeName) => {{
            if(!openReq.result.objectStoreNames.contains(storeName)) {{
                openReq.result.createObjectStore(storeName, {{keyPath: "id", autoIncrement:true}})
            }}
        }}
        //init db
        let db
        const openReq = indexedDB.open(`{1}`, 1)
        openReq.onerror = (err) => console.warn(err)
        openReq.onsuccess = (ev) => {{
            console.log('~~{2} DB inited~~')
        }}
        openReq.onupgradeneeded = (ev) => {{
            ifExist(`{2}`)
        }}
      ]=],
				{ i(1), rep(1) }
			)
		), --}}}
		s(
			"IDBT", --{{{
			fmt(
				[=[
        let tx = openReq.result.transaction(`{1}`, "readwrite").objectStore(`{2}`){}
      ]=],
				{ i(1), rep(1), i(0) }
			)
		), --}}}
	},
	vue = {
		s(
			"IDB", --{{{
			fmt(
				[=[
        const ifExist = (storeName) => {{
            if(!openReq.result.objectStoreNames.contains(storeName)) {{
                openReq.result.createObjectStore(storeName, {{keyPath: "id", autoIncrement:true}})
            }}
        }}
        //init db
        let db
        const openReq = indexedDB.open(`{1}`, 1)
        openReq.onerror = (err) => console.warn(err)
        openReq.onsuccess = (ev) => {{
            console.log('~~{2} DB inited~~')
        }}
        openReq.onupgradeneeded = (ev) => {{
            ifExist(`{2}`)
        }}
      ]=],
				{ i(1), rep(1) }
			)
		), --}}}
		s(
			"IDBT", --{{{
			fmt(
				[=[
        let tx = openReq.result.transaction(`{1}`, "readwrite").objectStore(`{2}`){}
      ]=],
				{ i(1), rep(1), i(0) }
			)
		), --}}}
	},
	go = {
		s(
			"rfunc", --{{{
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
		), --}}}
		s(
			"tfunc", --{{{
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
		), --}}}
		s(
			"lisn", --{{{
			fmta(
				[=[
        http.HandleFunc("/", handleIndex)
        http.Handle("/favicon.ico", http.NotFoundHandler())
        http.ListenAndServe(":8080", nil)
      ]=],
				{} --<--required
			)
		), --}}}
		s(
			"flog", --{{{
			fmta(
				[=[
          log.Fatal(<>)
      ]=],
				{ i(1, "text") }
			)
		), --}}}
		s(
			"prin", --{{{
			fmta(
				[=[
          fmt.Println(<>)
      ]=],
				{ i(1, "text") }
			)
		), --}}}
		s(
			"fprin", --{{{
			fmta(
				[=[
          fmt.Printf(<>)
      ]=],
				{ i(1, "text") }
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
		), --}}}
	},
})
--[==[[

--]==]
