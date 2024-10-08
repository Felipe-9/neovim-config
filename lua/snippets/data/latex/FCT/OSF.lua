local ls = require("luasnip")

-- local s = ls.snippet     -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
local t = ls.text_node -- insert text
-- local i = ls.insert_node -- user input

-- local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local c = ls.choice_node -- multiple options
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  --
  ms( -- crushing rolls nip angle
    {
      common = {
        desc = {
          "nip angle for crushing rolls",
          "-> r_1: roll radius",
          "-> r_2: feed particle radius",
          "-> b: distance between rolls",
          "-> β<=31º",
        },
      },
      -- trig
      "\\formula-crushing_rolls-nip_angle",
    },
    fmt(
      [[
      \cos{\beta/2}
      = \frac
      {r_1+b/2}
      {r_1+r_2}
      ]],
      {}
    )
  ),
  ms( -- bonds energy law
    {
      common = {
        desc = {
          "bonds energy law",
        },
      },
      -- trig
      "\\formula-bonds-energy-law",
    },
    fmt(
      [[
      e
      = e_i
      \,\sqrt{100/l_2}
      \,(1-\sqrt{q}^{-1})
      ]],
      {}
    )
  ),
  ms( -- sphere particle factors k surface
    {
      common = {
        desc = {
          "sphere particle factors k' (surface)",
        },
      },
      -- trig
      "\\formula-particle-surface-factor-sphere",
    },
    fmt(
      [[
      k'=\pi
      ]],
      {}
    )
  ),
  ms( -- sphere particle factors k volume
    {
      common = {
        desc = {
          'sphere particle factors k" (volume)',
        },
      },
      -- trig
      "\\formula-particle-volume-factor-sphere",
    },
    fmt(
      [[
      k"=\pi/6
      ]],
      {}
    )
  ),
  ms( -- rittingers law
    {
      common = {
        desc = {
          "rittingers law",
          "-> fine reduction, p = -2.0",
          "-> l_1 2 -> 5 mm",
          "-> l_2  < 0.1 mm",
          "-> k_r depende do triturador",
          "-> f_c depende das particulas",
        },
      },
      -- trig
      "\\formula-rittingers-law-fine-reduction",
    },
    fmt(
      [[
      e
      = c\,\adif{l^{-1}}
      = k_r\,f_c\,\adif{l^{-1}}
      ]],
      {}
    )
  ),
  ms( -- bonds law
    {
      common = {
        desc = {
          "bonds law",
          "intermediate reduction, p=-1.5\n",
          "l_1 2   -> 50 mm",
          "l_2 0.1 ->  5 mm",
        },
      },
      -- trig
      "\\formula-bonds-law-intermediate-reduction",
    },
    fmt(
      [[
      e
      =2\,c\adif{l^{-1/2}}
      =e_i\,\sqrt{100/l_1}
      \left(
        1 - q^{-1/2}
      \right)
      ]],
      {}
    )
  ),
  ms( -- kick law
    {
      common = {
        desc = {
          "kick law",
          "coarse reduction, p=-1.0",
          "-> l_1 50 -> 1500 mm",
          "-> l_2  5 ->   50 mm",
          "-> k_k depende do triturador",
          "-> f_c depende das particulas",
        },
      },
      -- trig
      "\\formua-kick-law-coarse-reduction",
    },
    fmt(
      [[
      e
      =c\,\adif{\ln{l}}
      =k_k\,f_c\,\adif{\ln{l}}
      ]],
      {}
    )
  ),
  -- Constantes
  ms( -- viscosidade ar
    {
      common = {
        desc = {
          "viscosidade ar",
          "Pa s (20℃, 1 atm)",
        },
      },
      -- trig
      "\\constante-viscosidade-ar",
    },
    fmt(
      [[
      <qty>{ 1.81e-5 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{\\pascal.\\second}"), t("") }),
      }
    )
  ),
}
