local ls = require("luasnip")

-- local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
local t = ls.text_node -- insert text
-- local i = ls.insert_node -- user input
local c = ls.choice_node -- multiple options

-- local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  -- Math
  ms( -- pi
    {
      common = {
        desc = { "pi" },
      },
      -- trig
      "\\constantes-pi",
    },
    fmt(
      [[
      \num{3.14159265359}
      ]],
      {}
    )
  ),
  -- Physics
  ms( -- Constante da aceleração da Gravidade
    {
      common = {
        desc = {
          "Constante da aceleração da Gravidade",
        },
      },
      -- trig
      "\\constante-aceleração_gravidade",
    },
    fmt(
      [[
      <qty>{ 9.780327 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{ \\metre/\\second^2 }"), t("") }),
      }
    )
  ),
  ms( -- Constante de Coulomb
    {
      common = {
        desc = {
          "Constante de Coulomb",
        },
      },
      -- trig
      "\\constante-coulomb",
    },
    fmt(
      [[
      <qty>{ 8.987551792314e9 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{ \\newton\\,\\metre^2/\\coulomb^2\\ }"), t("") }),
      }
    )
  ),
  ms( -- Electric Constant
    {
      common = {
        desc = {
          "Constantes: Elétrica, Permissitiviade do espaço",
        },
      },
      -- trig
      "\\constante-electric",
      "\\constante-permissivity_of_free_space",
    },
    fmt(
      [[
      <qty>{ 8.854187812747955e-12 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{ \\newton\\,\\metre^2/\\coulomb^2 }"), t("") }),
      }
    )
  ),
  ms( -- Constantes: Carga elétrica de um eletron
    {
      common = {
        desc = { "Constantes: Carga elétrica de um eletron" },
      },
      -- trig
      "\\constante-electron_charge",
      "\\constante-eletron_charge",
    },
    fmt(
      [[
      <qty>{ 1.602176634e-19 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{ \\coulomb }"), t("") }),
      }
    )
  ),
  ms( -- Dieletric Strength
    {
      common = {
        desc = {
          "Dieletric Strength",
          "Constantes: Dielectric strenght of dry air, the magnitude of the electric field at which dielectric breakdown occurs",
        },
      },
      -- trig
      "\\constante-dieletrica",
      "\\constante-dielectric_strenght",
    },
    fmt(
      [[
      <qty>{ 3e6 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{\\mega\\volt/\\metre}"), t("") }),
      }
    )
  ),
  -- Chemistry
  ms( -- Constante de Avogadro
    {
      common = {
        desc = { "Constante de Avogadro" },
      },
      -- trig
      "\\Constante-Avogadro",
      "\\Constante-mol",
      "\\Constante-mole",
    },
    fmt(
      [[
      <qty>{ 6.02214076e23 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{ \\mole^{-1} }"), t("") }),
      }
    )
  ),
  ms( -- Constante dos gáses perfeitos
    {
      common = {
        desc = {
          "Constante dos gáses perfeitos",
          "[R]=J/mol.K",
        },
      },
      -- trig
      "\\Constante-gas_perfeito",
    },
    fmt(
      [[
      "<qty>{ 8.314462618 }<unit>"
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{\\joule.\\mole^{-1}.\\kelvin^{-1}}"), t("") }),
      }
    )
  ),
  ms( -- Constante dos gáses perfeitos 2
    {
      common = {
        desc = {
          "Constante dos gáses perfeitos 2",
          "[R]=m3.atm/mol.K",
        },
      },
      -- trig
      "\\Constante-gas_perfeito.2",
    },
    fmt(
      [[
      "<qty>{ 8.20573660809596e-5 }<unit>"
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{\\metre^3.\\atm.\\mole^{-1}.\\kelvin^{-1}}"), t("") }),
      }
    )
  ),
  ms( -- Constante dos gáses perfeitos 3
    {
      common = {
        desc = {
          "Constante dos gáses perfeitos 3",
          "[R]=L.atm/mol.K",
        },
      },
      -- trig
      "\\Constante-gas_perfeito.3",
    },
    fmt(
      [[
      <qty>{ 8.2057366080960e-2 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{ \\litre.\\atm.\\mole^{-1}.\\kelvin^{-1} }"), t("") }),
      }
    )
  ),
  ms( -- Constante dos gáses perfeitos 4
    {
      common = {
        desc = {
          "Constante dos gáses perfeitos 4",
          "[R]=L.bar/mol.K",
        },
      },
      -- trig
      "\\Constante-gas_perfeito.3",
    },
    fmt(
      [[
      <qty>{ 8.31446261815324e-2 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{ \\litre.\\bar.\\mole^{-1}.\\kelvin^{-1} }"), t("") }),
      }
    )
  ),
  ms( -- Constante dos gáses perfeitos 5
    {
      common = {
        desc = {
          "Constante dos gáses perfeitos 5",
          "[R]=cal/mol.K",
        },
      },
      -- trig
      "\\Constante-gas_perfeito.5",
    },
    fmt(
      [[
      <qty>{ 1.987204258640832 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{ \\calorie.\\mole^{-1}.\\kelvin^{-1} }"), t("") }),
      }
    )
  ),
  ms( -- Constante mmHg in atm
    {
      common = {
        desc = {
          "Constante mmHg in atm",
        },
      },
      -- trig
      "\\Constante-mmHg-to-atm",
    },
    fmt(
      [[
      \frac
      {\qty{ 760.00209995982457 }{\mmHg}}
      {\unit{\atm}}
      ]],
      {}
    )
  ),
  ms( -- Boltzmann constant k_B
    {
      common = {
        desc = {
          "Boltzmann constant k_B",
          "k_B in J/K",
        },
      },
      -- trig
      "\\constante-boltzmann",
    },
    fmt(
      [[
      <qty>{ 1.380649e-23 }<unit>
      ]],
      {
        qty = c(1, { t("\\qty"), t("\\num") }),
        unit = c(2, { t("{\\joule.\\kelvin^{-1}}"), t("") }),
      }
    )
  )
}
