
local ls = require 'luasnip'

local s = ls.snippet -- build snippets
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input

local extras = require('luasnip.extras')
local rep = extras.rep -- repeat for multiple cursors
local fmt = require('luasnip.extras.fmt').fmt -- formatting with [[]]

-- local c = ls.choice_node -- multiple options
-- local f = ls.function_node -- insert lua functions

-- local d = ls.dynamic_node -- functions surround snippets
-- local sn = ls.snippet.node -- insert snippets withing functions (d)

-- local tabs="  "

ls.add_snippets("tex", {
  s({
    trig="\\formulas-AM3C-EDO-teorema",
    desc={
      "Teorema para resolver EDOs de ordem 1",
      "y' + a(x) y = b(x)",
      "onde: 𝛗(x)=\\exp(\\int{ a(x)dx })"
    }
  }, fmt([[
    \gamma = \exp{{\left(
      \int{{{}\,\odif{x}}}
    \right)}}
    ; &\\&
    y
    = \left({}\right)^{{-1}}
    \,\left(\int{{
    \tC + \int{{ \gamma(x)\,{}\,\odif{x}}}
    }}\right)
  ]], { i(1,"a(x)"), rep(1), i(2,"b(x)") })),
  s({ -- test
    trig="\\formulas-AM3C-EDO-bernoulli",
    desc={
      "Bernoulli equation to solve:",
      "y' + a(x) y = b(x) y^k; k ∈ ℝ|{0,1}",
      "onde: z=y^{1-k}"
    }
  }, fmt([[
    z=y^{{1-k}},
    z' + (1-k){}\,z = (1-k)\,{}
  ]], { i(1,"a(x)"), i(2,"b(x)") })),
  s({
    trig="begin",
    desc="begin-end tag"
  }, fmt([[
    \begin{{{}}}
    \t{}
    \end{{{}}}
  ]], { i(1), i(0), rep(1) })),
  s({
    trig="\\formulas-AM3C-EDO-Riccati",
    desc = {
      "Riccati equation to solve:",
      "y' + a(x) y = b(x) + c(x) y^2", 
      "where:",
      "y(x) = y(x_1) + z^{-1};",
      "z' + (2 c(x) y(x_1) - a(x)) z = -c(x)",
      "an arbitrary solution is given y(x_1)",
    },
  }, fmt([[
      y' 
      + {}\,y
      = {}
      + {}\,y^2
      ; &\\& 
      y({})={}
      ; &\\& 
      z' + (
        2
        \,{}
        \,{}
        - {}
      )\,z
      = -{}
      ; &\\& 
      y(x)
      = {}
      + z^{-1}
    ]], 
      i(1,"a(x)"), 
      i(2,"b(x)"), 
      i(3,"c(x)"),
      i(4,"x_1"), 
      i(5,"y(x_1)"), 
      rep(3), 
      rep(5), 
      rep(1), 
      rep(3), 
      rep(5), 
    )),
  s({
    trig="formulas-AM3C-wrong...",
    desc={
      "Matrix which its module shows if equations are linear independent",
      "det W == 0 => dependent",
      "det W != 0 => independent",
    },
  }, fmt([[
    \det{W}(Y)
    \in\mathcal{M}_{n,m}
    :w_{i,j}
    = D^j\,y_i
  ]])),
  S({
    trig="formulas-AM-regra-de-crammer",
    desc={
      "Regra de crammer para determinar as soluções de um sistema linear"
    }
  }, fmt([[
    \begin{{cases}}
      a_1\,f_{{1,1}} + a_2\,f_{{1,2}} = f_{{1,3}}
      \\
      a_1\,f_{{2,1}} + a_2\,f_{{2,2}} = f_{{2,3}}
    \end{{cases}}
    &\\&
    \implies
    a_1 = \frac
    {{\begin{{vmatrix}}
      f_{{1,3}} & f_{{1,2}}
      \\
      f_{{2,3}} & f_{{2,2}}
    \begin{{vmatrix}}}}
    {{\begin{{vmatrix}}
      f_{{1,1}} & f_{{1,2}}
      \\
      f_{{2,1}} & f_{{2,2}}
    \begin{{vmatrix}}}}
  ]])),
})
