local ls = require("luasnip")

local s = ls.snippet     -- build snippets
-- local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
-- local r = ls.restore_node -- restore from variable

local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return
--
    s( -- quadratic formula
      {
        desc = {
          "quadratic formula",
          "0=ax²+bx+c",
        },
        trig = "\\formula-quadratic",
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
    s( -- underset
      {
        desc = "underset",
        trig = "\\underset",
      },
      fmt([[ \underset{<under>}{<>} ]], {
        under = i(1, "under"),
        i(2, "="),
      })
    ),
    -- s( -- math enclosing brackets
    --   {
    --     desc = "math enclosing brackets",
    --     trig = "\\{",
    --   },
    --   fmt([[
    --     \left\{
    --       <>
    --     \right\}
    --   ]],{i(1)})
    -- ),
    s( -- flalign* environment
      {
        desc = {
          "flalign* environment",
        },
        trig = {
          "\\begin{flalign*}",
          "\\BFLA*",
        },
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
    s( -- boldmath environment
      {
        desc = {
          "boldmath environment",
        },
        trig = { "\\begin{BM}", "\\BBM" },
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
    )
