local ls = require("luasnip")

-- local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
-- local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
-- local r = ls.restore_node -- restore from variable

local extras = require("luasnip.extras")
local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return { --
  ms( -- quadratic formula
    {
      common = {
        desc = {
          "quadratic formula",
          "0=ax²+bx+c",
        },
      },
      -- trig
      "\\formula-quadratic",
    },
    fmt(
      [[
      x
      = \frac{
        - <b>
        \pm \sqrt{
          <b>^2
          -4\,<a>\,<c>
        }
      } {2\,<a>}
      ]],
      { a = i(1, "a"), b = i(2, "b"), c = i(3, "c") }
    )
  ),
  ms( -- underset
    {
      common = {
        desc = { "underset" },
      },
      -- trig
      "\\underset",
    },
    fmt(
      [[
      \underset{<under>}{<>}
      ]],
      {
        under = i(1, "under"),
        i(2, "="),
      }
    )
  ),
  ms( -- flalign* environment
    {
      common = {
        desc = {
          "flalign* environment",
        },
      },
      -- trig
      "\\begin{flalign*}",
      "\\BFLA*",
    },
    fmt(
      [[
      \begin{flalign*}
        &
          <>
        &
      \end{flalign*}
      ]],
      { i(0) }
    )
  ),
  ms( -- boldmath environment
    {
      common = {
        desc = {
          "boldmath environment",
        },
      },
      -- trig
      "\\begin{BM}",
      "\\BBM",
    },
    fmt(
      [[
      \begin{BM}<d1><options><d2>
        <body>
      \end{BM}
      ]],
      {
        options = i(1, "options"),
        body = i(2, "body"),
        d1 = ne(1, "["),
        d2 = ne(1, "]"),
      }
    )
  ),
  ms( -- Div derivative
    {
      common = {
        name = "Derivate of a fraction"
      },
      "\\math-derivative-fraction"
    },
    fmt(
      [[
      \frac {
        <f>\,<dg>
        -<df>\,<g>
      }{
        (<g_r>)^2
      }
      ]],
      {
        f = i(1,"f"),
        g = i(3,"g"),
        df = i(2,"f'"),
        dg = i(4,"g'"),
        g_r = rep(3),
      }
    )
  )
}
-- s( -- math enclosing brackets
--   {
--     desc = { "math enclosing brackets" },
--     trig = { "\\{" },
--   },
--   fmt([[
--     \left\{
--       <>
--     \right\}
--   ]],{i(1)})
-- ),
