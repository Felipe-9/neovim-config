--
local ls = require("luasnip")

local s = ls.snippet -- build snippets
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input

-- local extras = require("luasnip.extras")
-- local rep = extras.rep                         -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return
  --
  s( -- formula gibbs
  {
    desc = "equação de gibbs formad derivada",
    trig = "\\formula-gibbs-derivada",
  },
  fmt(
    [[
    \odif{g}
    = v\,\odif{p}
    -s\,\odif{t}
    ]],
    {}
  )
),
  s( -- formula variação de entropia de gás perfeito
    {
      desc = "equação para variação de entropia de um gás perfeito",
      trig = "\\formula-entropia_gas_perfeito",
    },
    fmt(
      [[
      \adif{s}_{g}
      =\int_{t_1}^{t_2}{
          n\,c_{p,g}\,\frac{\odif{t}}{t}
      }
      + n\,r\,\ln\frac{p_1}{p_2}
    ]],
      {}
    )
  ),
  s( -- forumla de clapeyron
    {
      desc = "equação de clapeyron",
      trig = "\\formula-clapeyron",
    },
    fmt(
      [[
      \odv{p}{t}
      = t^{-1}\adv{h}{v}
    ]],
      {}
    )
  ),
  s( -- forumla de clapeyron h vap
    {
      desc = "equação de clapeyron para entalpia de vaporização",
      trig = "\\formula-clapeyron-h_vap",
    },
    fmt(
      [[
      \ln\frac{p_g}{p_l}
      = \frac{p\,\adif{h}_{vap}}{r}
      \,\left(
        \frac{1}{t_l}
        - \frac{1}{t_g}
      \right)
    ]],
      {}
    )
  )
