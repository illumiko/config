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
		s(
			"hajime", --{{{
			fmt(
				[=[
      * Things i've to take care of
        #time.due 2022-0{1}-{2}
        #contexts Todo
        *TO BE AT A PLACE NO ONE ELSE IS; YOU HAVE DO THINGS NO ONE ELSE WANTS*
          {3}
      * Pomodoro

    ]=],
				{ i(1), i(2), i(3) }
			)
		), --}}}
		--session future{{{
		s({ trig = "sF", docstring = "sF" }, {
			t("** Session "),
			i(1, "1 "),
			f(function()
				result = {}
				result.start_hour = os.date("%I") -- defining start hour
				result.start_min = os.date("%M") -- defining start min
				result.status = function()
					return os.date("%p") -- finding wheter pm or am
				end
				result.format = function(ses)
					local hour = tonumber(result.end_hour)
					local min = tonumber(result.end_min)

					if hour < 10 then
						-- result.end_hour = string.sub(tostring(result.end_hour),2,2)
						result.start_hour = string.sub(tostring(result.start_hour), 2, 2)
					end
					if min >= 60 then
						result.end_min = min - 60
						result.end_hour = 1 + hour
					end
					if tonumber(result.end_min) < 10 then
						print("hello")
						result.end_min = "0" .. result.end_min
					end
					print(result.end_min)
					return "{" .. ses .. " H}" .. " [ " .. result.start_time() .. " -> " .. result.end_time() .. " ]"
				end
				result.adder = function()
					local time = vim.fn.input("Enter session time (H:M) = ")
					local hour = string.sub(time, 1, 1)
					local min = string.sub(time, 3, 4)
					result.end_hour = tonumber(result.start_hour) + tonumber(hour)
					result.end_min = tonumber(result.start_min) + tonumber(min)
					return result.format(time)
					-- result.format(result.end_hour,result.end_min)
				end
				result.end_time = function()
					return result.end_hour .. ":" .. result.end_min .. result.status()
				end
				result.start_time = function()
					return result.start_hour .. ":" .. result.start_min .. result.status()
				end
				return " " .. result.adder()
			end),
			t({ "", "> " }),
			i(0),
		}), --}}}
		--session past{{{
		s({ trig = "sP", docstring = "sP" }, {
			t("** Session "),
			i(1, "1 "),
			f(function()
				result = {}
				result.end_hour = os.date("%I") -- defining start hour
				result.end_min = os.date("%M") -- defining start min
				result.status = function()
					return os.date("%p") -- finding wheter pm or am
				end
				result.format = function(ses)
					local hour = tonumber(result.start_hour)
					local min = tonumber(result.start_min)

					if hour < 10 then
						-- result.end_hour = string.sub(tostring(result.end_hour),2,2)
						result.end_hour = string.sub(tostring(result.end_hour), 2, 2)
					end
					if min < 0 then
						result.start_min = 60 + min -- as min a negative value
						result.start_hour = hour - 1
						print(result.start_min)
					end
					if result.start_min < 10 then
						result.start_min = "0" .. result.start_min
					end
					return "{" .. ses .. " H}" .. " [ " .. result.start_time() .. " -> " .. result.end_time() .. " ]"
				end
				result.adder = function()
					local time = vim.fn.input("Enter session time (H:M) = ")
					local hour = string.sub(time, 1, 1)
					local min = string.sub(time, 3, 4)
					result.start_hour = tonumber(result.end_hour) - tonumber(hour)
					result.start_min = tonumber(result.end_min) - tonumber(min)
					return result.format(time)
					-- result.format(result.end_hour,result.end_min)
				end
				result.end_time = function()
					return result.end_hour .. ":" .. result.end_min .. result.status()
				end
				result.start_time = function()
					return result.start_hour .. ":" .. result.start_min .. result.status()
				end
				return " " .. result.adder()
			end),
			t({ "", "> " }),
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
			"fnc", --{{{
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
					c(3, { fmta("log.Fatal(<>)", { i(1,"err") }), fmta("<>", i(1, "Handle")) }),
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
      ]=],{}--<--required
			)
		), --}}}
		s(
			"lgf", --{{{
			fmta(
				[=[
          log.Fatal(<>)
      ]=],
				{ i(1, "text") }
			)
		), --}}}

	},

})
--[==[[

--]==]
