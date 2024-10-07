local ls = require("luasnip")

local s = ls.snippet -- build snippets
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
local c = ls.choice_node -- multiple options

local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return { --
  s(
    {
      desc = "my desc2",
      trig = "\\my-trig2",
    },
    fmt(
      [[
      a^2 + b^2 = c^2 + d^2
      ]],
      {}
    )
  ),
}
