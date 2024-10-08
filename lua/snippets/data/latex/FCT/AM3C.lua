local ls = require("luasnip")

-- local s = ls.snippet     -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
-- local t = ls.text_node -- insert text
local i = ls.insert_node -- user input

-- local extras = require("luasnip.extras")
-- local rep = extras.rep                         -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  --
  ms( --
    {
      common = {
        desc = {
          "Teorema para resolver EDOs de ordem 1",
          "y' + a(x) y = b(x)",
          "onde: 𝛗(x)=\\exp(\\int{ a(x)dx })",
        },
      },
      -- trig
      "\\formulas-AM3C-EDO-teorema",
    },
    fmt(
      [[
      \gamma = \exp{\left(
      \int{<a>\,\odif{x}}
    \right)}
    ; &\\&
    y
    = \left(<a>\right)^{-1}
    \,\left(\int{
    \tC + \int{ \gamma(x)\,<b>\,\odif{x}}
    }\right)
      ]],
      {
        a = i(1, "a(x)"),
        b = i(2, "b(x)"),
      }
    )
  ),
  ms( --
    {
      common = {
        desc = {
          "Bernoulli equation to solve:",
          "y' + a(x) y = b(x) y^k; k ∈ ℝ|{0,1}",
          "onde: z=y^{1-k}",
        },
      },
      "\\formulas-AM3C-EDO-bernoulli",
    },
    fmt(
      [[
    z=y^{1-k},
    z' + (1-k)<a>\,z = (1-k)\,<b>
  ]],
      {
        a = i(1, "a(x)"),
        b = i(2, "b(x)"),
      }
    )
  ),
  ms( --
    {
      common = {
        desc = {
          "Riccati equation to solve:",
          "y' + a(x) y = b(x) + c(x) y^2",
          "where:",
          "y(x) = y(x_1) + z^{-1};",
          "z' + (2 c(x) y(x_1) - a(x)) z = -c(x)",
          "an arbitrary solution is given y(x_1)",
        },
      },
      -- trig
      "\\formulas-AM3C-EDO-Riccati",
    },
    fmt(
      [[
      y'
      + <a>\,y
      = <b>
      + <c>\,y^2
      ; &\\&
      y(<x1>)=<y_x1>
      ; &\\&
      z' + (
        2
        \,<c>
        \,<y_x1>
        - <a>
      )\,z
      = - <c>
      ; &\\&
      y(x)
      = <y_x1>
      + z^{-1}
      ]],
      {
        a = i(1, "a(x)"),
        b = i(2, "b(x)"),
        c = i(3, "c(x)"),
        x1 = i(4, "x_1"),
        y_x1 = i(5, "y(x_1)"),
      }
    )
  ),
  ms( --
    {
      common = {
        desc = {
          "Matrix which its module shows if equations are linear independent",
          "det W == 0 => dependent",
          "det W != 0 => independent",
        },
      },
      -- trig
      "formulas-AM3C-wrong...",
    },
    fmt(
      [[
      \det{W}(Y)
      \in\mathcal{M}_{n,m}
      :w_{i,j}
      = D^j\,y_i
      ]],
      {}
    )
  ),
  ms( --
    {
      common = {
        desc = {
          "Regra de crammer para determinar as soluções de um sistema linear",
        },
      },
      -- trig
      "formulas-AM-regra-de-crammer",
    },
    fmt(
      [[
      \begin{cases}
      a_1\,f_{1,1} + a_2\,f_{1,2} = f_{1,3}
      \\
      a_1\,f_{2,1} + a_2\,f_{2,2} = f_{2,3}
    \end{cases}
    &\\&
    \implies
    a_1 = \frac
    {\begin{vmatrix}
      f_{1,3} & f_{1,2}
      \\
      f_{2,3} & f_{2,2}
    \begin{vmatrix}}
    {\begin{vmatrix}
      f_{1,1} & f_{1,2}
      \\
      f_{2,1} & f_{2,2}
    \begin{vmatrix}}
      ]],
      {}
    )
  ),
}
