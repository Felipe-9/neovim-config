local ls = require("luasnip")

-- local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
-- local t = ls.text_node -- insert text
-- local i = ls.insert_node -- user input

-- local extras = require("luasnip.extras")
-- local rep = extras.rep                         -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  --
  ms( -- Equacao de Clapeyron
    {
      common =  {
        name = "Clapeyron Equation ΔH_vap",
        desc = "Demonstração da equação de clapeyron para entalpia de vaporização"
      },
      "\\demonstration-QF-Clapeyron-H_vap",
    },
    fmt(
      [[
      \odv{P}{T}_{vap}
      = \frac{\adif{H}_{vap}}{T\,\adif{V}_{vap}}
      = \frac{\adif{H_{vap}}}{T\,(V_{vap,g}-V_{vap\,l})}
      \cong \frac{\adif{H_{vap}}}{T\,V_{vap,g}}
      \cong \frac{\adif{H_{vap}}}{T\,\left(
        R\,T/P
      \right)}
      =
      \frac{P\,\adif{H_{vap}}}{R\,T^2}
      \implies &\\&
      \implies
      \int{\frac{\odif{P}}{P}}
      = \adif{\ln P}
      = \ln P_g/P_l
      = &\\&
      = \int{
        \frac{\adif{H_{vap}}}{R\,T^2}
        \,\odif{T}
      }
      = \frac{\adif{H_{vap}}}{R}
      \int{
        \frac{\odif{T}}{T^2}
      }
      % = &\\&
      = \frac{\adif{H_{vap}}}{R}
      \adif{(-T^{-1})
    ]],
      {}
    )
  ),
  ms( -- Clapeyron H sublimation
    {
      common = {
        name = "Clapeyron ΔH sublimation",
        desc = "Demonstração da equação de clapeyron para entalpia de sublimação"
      },
      "\\demonstration-QF-Clapeyron-H_sub",
    },
    fmt(
      [[
      \odv{P}{T}_{sub}
      = \frac{\adif{H}_{sub}}{T\,\adif{V}_{sub}}
      = \frac{\adif{H_{sub}}}{T\,(V_{sub,g}-V_{sub\,s})}
      \cong \frac{\adif{H_{sub}}}{T\,V_{sub,g}}
      \cong \frac{\adif{H_{sub}}}{T\,\left(
        R\,T/P
      \right)}
      =
      \frac{P\,\adif{H_{sub}}}{R\,T^2}
      \implies &\\&
      \implies
      \int{\frac{\odif{P}}{P}}
      = \adif{\ln P}
      = \ln P_g/P_s
      = &\\&
      = \int{
        \frac{\adif{H_{sub}}}{R\,T^2}
        \,\odif{T}
      }
      = \frac{\adif{H_{sub}}}{R}
      \int{
        \frac{\odif{T}}{T^2}
      }
      % = &\\&
      = \frac{\adif{H_{sub}}}{R}
      \adif{(-T^{-1})
    ]],
      {}
    )
  ),
}
