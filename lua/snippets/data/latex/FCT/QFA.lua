local ls = require("luasnip")

local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
-- local t = ls.text_node -- insert text
local i = ls.insert_node -- user input

-- local extras = require("luasnip.extras")
-- local rep = extras.rep                         -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  --
  ms( -- 0th order rate law derivated
    {
      common = {
        desc = {
          "0th order rate law derivated",
          "a -> p",
        },
      },
      -- trig
      "\\formula-rate-deriv-0",
    },
    fmt(
      [[
      \odv{\ch{[<a>]}}{t} = -k
      ]],
      { a = i(1, "a") }
    )
  ),
  ms( -- 0th order rate law integrated
    {
      common = {
        desc = {
          "0th order rate law integrated",
          "a -> p",
        },
      },
      -- trig
      "\\formula-rate-int-0",
    },
    fmt(
      [[
      \adif{\ch{[a]}} = -k\,\adif{t}
      ]],
      {}
    )
  ),
  ms( -- 1st order rate law derivated
    {
      common = {
        desc = {
          "1st order rate law derivated",
          "a -> p",
        },
      },
      -- trig
      "\\formula-rate-deriv-1",
    },
    fmt(
      [[
      \odv{\ch{[<a>]}}{t} = -k\,\ch{[<a>]}
      ]],
      { a = i(1, "a") }
    )
  ),
  ms( -- 1st order rate law integrated
    {
      common = {
        desc = {
          "1st order rate law integrated",
          "a -> p",
        },
      },
      -- trig
      "\\formula-rate-int-1",
    },
    fmt(
      [[
      \adif{\ln\ch{[<a>]}}=-k\,\adif{t}
      ]],
      { a = i(1, "a") }
    )
  ),
  ms( -- 1st order pre equilibrium a deriv
    {
      common = {
        desc = {
          "1st order pre equilibrium a deriv",
          "a -> p\t[p]=[a]",
        },
      },
      -- trig
      "\\formula-pre-equilibrium-deriv-a-1",
    },
    fmt(
      [[
      \odv{\ch{[a]}}{t}
      = \ch{[a]}_0\,k_{-1}
      - \ch{[a]}\,(k_{-1}+k_{+1})
      ]],
      {}
    )
  ),
  ms( -- 1st order pre equilibrium a
    {
      common = {
        desc = {
          "1st order pre equilibrium a",
          "a -> p\t[p]=[a]₀-[a]",
        },
      },
      -- trig
      "\\formula-pre-equilibrium-a-1",
    },
    fmt(
      [[
      \ch{[<a>]}
      =\frac{
         k_{-1}\,\ch{[a]}_0
         + k_{+1}\,\exp(
             -(k_{-1}+k_{+1})\,t
         )
      }{k_{-1}+k_{+1}}
      ]],
      { a = i(1, "a") }
    )
  ),
  ms( -- 1st order equilibrium a
    {
      common = {
        desc = {
          "1st order equilibrium a",
          "a -> p",
          "[p]=[a]₀-[a]",
        },
      },
      -- trig
      "\\formula-equilibrium-a-1",
    },
    fmt(
      [[
      \ch{[<a>]}
        =\frac{k_{-1}\,\ch{[<a>]}_0}{k_{-1}+k_{+1}}
      ]],
      { a = i(1, "a") }
    )
  ),
  ms( -- 1st order equilibrium p
    {
      common = {
        desc = {
          "1st order equilibrium p",
          "a -> p",
          "[p]=[a]₀-[a]",
        },
      },
      -- trig
      "\\formula-equilibrium-p-1",
    },
    fmt(
      [[
      \ch{[<p>]}
        =\frac{k_{+1}\,\ch{[<a>]}_0}{k_{-1}+k_{+1}}
      ]],
      { p = i(1, "p"), a = i(2, "a") }
    )
  ),
  ms( -- 1th order half-life
    {
      common = {
        desc = {
          "1th order half-life",
          "t½",
        },
      },
      -- trig
      "\\formula-half-life-1",
    },
    fmt(
      [[
      t_{1/2} = \ln{2}/k
      ]],
      {}
    )
  ),
  ms( -- 1th order time constant
    {
      common = {
        desc = { "1th order time constant: te" },
      },
      -- trig
      "\\formula-te-time-constant-1",
    },
    fmt(
      [[
      t_{e} = k^{-1}
      ]],
      {}
    )
  ),
  ms( -- 2nd order rate law derivated
    {
      common = {
        desc = {
          "2nd order rate law derivated",
          "a² -> p",
        },
      },
      -- trig
      "\\formula-rate-deriv-2.1",
    },
    fmt(
      [[
      \odv{\ch{[<a>]}}{t} = -k\,\ch{[<a>]}^2
      ]],
      { a = i(1, "a") }
    )
  ),
  ms( -- 2nd order rate law a² integrated
    {
      common = {
        desc = {
          "2nd order rate law a² integrated",
          "a² -> p",
        },
      },
      -- trig
      "\\formula-rate-int-2.1",
    },
    fmt(
      [[
      \adif{-\ch{[<a>]}^{-1}} = -k\,\adif{t}
      ]],
      { a = i(2, "a") }
    )
  ),
  ms( -- 2nd order rate law a+b integrated
    {
      common = {
        desc = {
          "2nd order rate law a+b integrated",
          "a + b -> p",
        },
      },
      -- trig
      "\\formula-rate-int-2.2",
    },
    fmt(
      [[
      \ln\frac{
         \ch{[<b>]}/\ch{[<b>]}_0
      }{
         \ch{[<a>]}/\ch{[<a>]}_0
      }
      =\frac{k\,t}{\ch{[<b>]}_0-\ch{[<a>]}_0}
      ]],
      { a = i(1, "a"), b = i(2, "b") }
    )
  ),
  ms( -- n-th order half-life
    {
      common = {
        desc = {
          "n-th order half-life",
          "t½",
        },
      },
      -- trig
      "\\formula-half-life-n",
    },
    fmt(
      [[
      t_{1/2} = \left(k\,\ch{[<a>]_{0}^{n-1}}\right)^{-1}
      ]],
      { a = i(1, "a") }
    )
  ),
  ms( -- arrhenius equation
    {
      common = {
        desc = {
          "arrhenius equation",
          "relation between activation energy and reaction rate constant",
        },
      },
      -- trig
      "\\formula-arrhenius-equation",
    },
    fmt(
      [[
      k=a\,\exp(-ea/r\,t)
      ]],
      {}
    )
  ),
  ms( -- eyring equation
    {
      common = {
        desc = {
          "eyring equation",
          "describe the relationship between reaction rate and temperature.",
          "",
          "-> useful when we are talking about activation energy",
          "k‡: transition state equilibrium constant",
          "δh‡: activation entalpy",
        },
      },
      -- trig
      "\\formula-eyring-equation",
      "\\formula-transition-state-equilibrium-constant",
    },
    fmt(
      [[
      \ln{k^{\ddagger}}
      = -\frac{\adif{h}^{\ddagger}}{r\,t}
      + \frac{\adif{s}^{\ddagger}}{r}
      ]],
      {}
    )
  ),
  ms( -- arrhenius-eyring equation
    {
      common = {
        desc = {
          "arrhenius-eyring equation",
          "join both arrhenius and eyring equation to get a relation between activation energy and entalpy of activantion",
        },
      },
      -- trig
      "\\formula-arrhenius-eyring",
      "\\formula-activation-energy-entalpy",
    },
    fmt(
      [[
      ea=\adif{h}^{\ddagger} + r\,t
      ]],
      {}
    )
  ),
  ms( -- gibbs free energy equation
    {
      common = {
        desc = {
          "gibbs free energy equation",
          "gibbs free energy",
          "",
          "δg: change of gibbs free energy of the reaction",
          "δh: change in entalpy",
          "δs: change in entropy",
        },
      },
      -- trig
      "\\formula-gibbs-free-energy-equation",
    },
    fmt(
      [[
      \adif{g}=\adif{h}-t\,\adif{s}
      ]],
      {}
    )
  ),
  ms( -- gibbs free energy non standard state equation
    {
      common = {
        desc = {
          "gibbs free energy when reaction is not in standard state",
          "=> standard state: 1 atm, 298 k, ph 7",
          "=> δg: change of gibbs free energy of the reaction",
          "=> δg⁰: standard gibbs free energy",
          "=> k⁰: equilibrium constant",
        },
      },
      -- trig
      "\\formula-gibbs-free-energy-non-standard-equation",
    },
    fmt(
      [[
      \adif{g}=\adif{g}^{0}+r\,t\,\ln{k}
      ]],
      {}
    )
  ),
  ms( -- gibbs free energy of activation
    {
      common = {
        desc = {
          "transition theory, gibbs free energy of activation",
          "-> standard state: 1 atm, 298 k, ph 7",
          "-> δg‡: gibbs energy of activation",
          "-> δh‡: entalpy of activation",
          "-> δs‡: entropy of activation",
        },
      },
      -- trig
      "\\formula-gibbs-free-energy-activation-equation",
    },
    fmt(
      [[
      \adif{g}^{\ddagger}=
      = -r\,t\,\ln{k}
      = \adif{h}^{\ddagger}-t\,\adif{s}^{\ddagger}
      ]],
      {}
    )
  ),
}
