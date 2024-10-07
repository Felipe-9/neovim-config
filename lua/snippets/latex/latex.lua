local ls = require 'luasnip'

local s = ls.snippet -- build snippets
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input

local extras = require('luasnip.extras')
local rep = extras.rep -- repeat for multiple cursors
local fmt = require('luasnip.extras.fmt').fmt -- formatting with [[]]

local c = ls.choice_node -- multiple options
local f = ls.function_node -- insert lua functions

-- local d = ls.dynamic_node -- functions surround snippets
-- local sn = ls.snippet.node -- insert snippets withing functions (d)

-- local tabs="  "

ls.add_snippets("tex", {
  s({ 
    trig="begin",
    desc="begin-end tag"
  }, fmt([[
    \begin{{{}}}
    \t{}
    \end{{{}}}
  ]], { i(1), i(0), rep(1) }))
})
