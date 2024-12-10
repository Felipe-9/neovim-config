local ls = require("luasnip")

local s = ls.snippet -- build snippets
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
local c = ls.choice_node -- multiple options

local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

-- local snippets = require("snippets.data.latex.mysnippets")

ls.add_snippets(
  "tex",
  { s( -- table/multirow
    {
      desc = {
        "table/multirow",
        "\\multirow[⟨vpos⟩]{⟨nrows⟩}[⟨bigstruts⟩]{⟨width⟩}[⟨vmove⟩]{⟨text⟩}",
      },
      trig = "\\multirow",
    },
    fmt(
      [[
      \multirow[<vpos>]{<nrows>}{<width>}{<text>}
      ]],
      {
        vpos = i(3, "vpos"),
        nrows = i(1, "nrows"),
        width = i(2, "*"),
        text = i(0, "text")
      }
    )
  ) }
  -- require("snippets.data.latex.constants"),
  -- require("snippets.data.latex.math"),
  -- require("snippets.data.latex.mysnippets")
  -- require("snippets.data.latex.tikz-pfg"),
  -- -- FCT
  -- require("snippets.data.latex.FCT.AM2C"),
  -- require("snippets.data.latex.FCT.AM3C"),
  -- require("snippets.data.latex.FCT.CMA"),
  -- require("snippets.data.latex.FCT.CNA"),
  -- -- require("snippets.data.latex.FCT.EB"),
  -- require("snippets.data.latex.FCT.FTII"),
  -- require("snippets.data.latex.FCT.OSF"),
  -- require("snippets.data.latex.FCT.QF"),
  -- require("snippets.data.latex.FCT.QFA"),
  -- require("snippets.data.latex.FCT.TEQB"),
  -- -- Templates
  -- require("snippets.data.latex.templates.mainfile"),
  -- require("snippets.data.latex.templates.subfile"),
)

-- ls.add_snippets("tex", {
--   s(
--     {
--       desc = "my desc",
--       trig = "\\my-trig",
--     },
--     fmt(
--       [[
--       a^2 + b^2 = c^2
--       ]],
--       {}
--     )
--   ),
-- })
