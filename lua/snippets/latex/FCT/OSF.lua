local ls = require("luasnip")

-- local s = ls.snippet     -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
local t = ls.text_node -- insert text
-- local i = ls.insert_node -- user input

local extras = require("luasnip.extras")
local rep = extras.rep -- repeat for multiple cursors
local c = ls.choice_node -- multiple options
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  --
  ms( -- kick law
    {
      common = {
        name = "kick law",
        desc = {
          "Coarse reduction, p = -1.0",
          "ratio L/L₀ defines Energy",
          "-> L₀ 50 -> 1500 mm",
          "-> L   5 ->   50 mm",
          "-> K_K depende do triturador",
          "-> f_c depende das particulas",
        },
      },
      -- trig
      "\\formua -OSF-kick-law-coarse-reduction",
    },
    fmt(
      [[
      E
      =-K_K\,f_c\,\adif{\ln{L}}
      ]],
      {}
    )
  ),
  ms( -- rittingers law
    {
      common = {
        name = "Rittinger's law",
        desc = {
          "Fine reduction, p = -2.0",
          "E ∝ Increase of surface area",
          "-> L₀ 2 -> 5 mm",
          "-> L  < 0.1  mm",
          "-> K_R depende do triturador",
          "-> f_c depende das particulas",
        },
      },
      -- trig
      "\\formula-OSF-rittingers-law-fine-reduction",
    },
    fmt(
      [[
      E
      = K_R\,f_c\,\adif{L^{-1}}
      ]],
      {}
    )
  ),
  ms( -- bonds law
    {
      common = {
        name = "Bond's law",
        desc = {
          "Intermediate reduction, p = -1.5",
          "L₀ 2.0 -> 50 mm",
          "L  0.1 ->  5 mm",
          "E_i Work index (energy for ∞ -> 200µm)",
          "q = L₀/L",
        },
      },
      -- trig
      "\\formula-OSF-bonds-law-intermediate-reduction",
    },
    fmt(
      [[
      E
      = E_i
      \,\sqrt{\frac{100}{L_0}}
      \,\left(1-\frac{1}{\sqrt{q}}\right)
      ]],
      {}
    )
  ),
  ms( -- crushing rolls nip angle
    {
      common = {
        name = "nip angle for crushing rolls",
        desc = {
          "-> r₁: roll radius",
          "-> r₂: feed particle radius",
          "-> b: distance between rolls",
          "-> β <= 31º",
        },
      },
      -- trig
      "\\formula-OSF-crushing_rolls-nip_angle",
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
  ms( -- sphere particle factors k surface
    {
      common = {
        name = "sphere particle factors k' (surface)",
      },
      -- trig
      "\\formula-OSF-particle-surface-factor-sphere",
    },
    fmt( [[ \dot{k}=\pi ]], {})
  ),
  ms( -- sphere particle factors k volume
    {
      common = {
    name = 'sphere particle factors k" (volume)',
      },
      -- trig
      "\\formula-OSF-particle-volume-factor-sphere",
    },
    fmt([[ \ddot{k}=\pi/6 ]], {})
  ),
  ms( -- PSD mean diameter property length
    {
      common = {
        name = "PSD mean diameter property: Length",
      },
      -- trig
      "\\formula-OSF-PSD-mean-diameter-property-length"
    },
    fmt( [[l = n\,d]],{} )
  ),
  ms( -- PSD mean diameter property surface
    {
      common = {
        name = "PSD mean diameter property: Surface",
      },
      -- trig
      "\\formula-OSF-PSD-mean-diameter-property-surface"
    },
    fmt( [[s = n\,\dot{k}\,d^2]],{} )
  ),
  ms( -- PSD mean diameter property volume
    {
      common = {
        name = "PSD mean diameter property: Volume",
      },
      -- trig
      "\\formula-OSF-PSD-mean-diameter-property-volume"
    },
    fmt( [[v=n\,\ddot{k}\,d^3]],{} )
  ),
  ms( -- PSD mean diameter property mass
    {
      common = {
        name = "PSD mean diameter property: Mass",
      },
      -- trig
      "\\formula-OSF-PSD-mean-diameter-property-mass"
    },
    fmt( [[x = n\,\rho\,\ddot{k}\,d^3]],{} )
  ),
}
