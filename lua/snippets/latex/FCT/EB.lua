local ls = require("luasnip")

-- local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
-- local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
local c = ls.choice_node -- multiple options

local extras = require("luasnip.extras")
local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  -- Cell grown in Batch culture
  ms( -- Monod equation μ (s)
    {
      common = {
        name = "Monod equation",
        desc = {
          "Specific cell growth rate (μ) in function of substrate s",
        },
      },
      "formulas-EB-monod-equation-specific-cell-grownth-rate",
    },
    fmt(
      [[
      \mu
      = \frac
      {\mu_{\max{}}}
      {1+K_S/s}
      ]],{}
    )
  ),
  ms( -- Element balance for aerobical cell growth
    {
      common = {
        name = "Element Balance for aerobical cell growth"
      },
      "\\formula-EB-element-balance-aerobical-cell-growth"
    },
    fmt(
      [[
      \begin{center}
        \ch{
          C_{<w>}H_{<x>}O_{<y>}N_{<z>}
          + {<a>} O2
          + {<b>} H_{<g>}O_{<h>}N_{<i>}
          ->> {<c>} CH_{<alpha>}O_{<beta>}N_{<delta>}
          + {<d>} CO2
          + {<e>} H2O
        }
      \end{center}

      Balancing
      \begin{flalign*}
        &
        \begin{cases}
              C: & <w_r> = <c_r> + <d_r>
          \\  H: & <x_r> + <b_r>\,<g_r> = <c_r>\,<alpha_r> + 2\,<e_r>
          \\  O: & <y_r> + 2\,<a_r> + <b_r>\,<h_r> = <c_r>\,<beta_r> + 2\,<d_r> + <e_r>
          \\  N: & <z_r> + <b_r>\,<i_r> = <c_r>\,<delta_r>
          % \\  RQ: & RQ = <d_r>/<a_r>
        \end{cases}
        &\\&
        \begin{Bmatrix}
              <w_r> = <c_r> + <d_r>
          \\  <x_r> + <b_r>\,<g_r> = <c_r>\,<alpha_r> + 2\,<e_r>
          \\  <y_r> + 2\,<a_r> + <b_r>\,<h_r> = <c_r>\,<beta_r> + 2\,<d_r> + <e_r>
          \\  <z_r> + <b_r>\,<i_r> = <c_r>\,<delta_r>
          % \\  RQ = <d_r>/<a_r>
        \end{Bmatrix}
        &
      \end{flalign*}
      ]],{
        a = i(1,"a"),
        b = i(2,"b"),
        c = i(3,"c"),
        d = i(4,"d"),
        e = i(5,"e"),
        w = i(6,"w"),
        x = i(7,"x"),
        y = i(8,"y"),
        z = i(9,"z"),
        g = i(10,"g"),
        h = i(11,"h"),
        i = i(12,"i"),
        alpha = i(13,"\\alpha"),
        beta = i(14,"\\beta"),
        delta = i(15,"\\delta"),
        a_r = rep(1),
        b_r = rep(2),
        c_r = rep(3),
        d_r = rep(4),
        e_r = rep(5),
        w_r = rep(6),
        x_r = rep(7),
        y_r = rep(8),
        z_r = rep(9),
        g_r = rep(10),
        h_r = rep(11),
        i_r = rep(12),
        alpha_r = rep(13),
        beta_r = rep(14),
        delta_r = rep(15),
      }
    )
  ),
  ms( -- Respiratory Quotient
    {
      common = {
        name = "RQ respiratory quotient",
        desc = "Mol of CO2 produced/ mol of O2 consumed"
      },
      "\\formula-EB-RQ-respiratory-quotient"
    },
    fmt( [[RQ = d/a]],{})
  ),
  ms( -- Valence of elements
    {
      common = {
        name = "Table: Valence of Elements",
        desc = "Used for eletronic balance"
      },
      "\\Table-EB-Valence-of-elements"
    },
    fmt([[
      \begin{cases}
            \text{valence}_N &= -3 (\ch{NH3})
        \\  \text{valence}_N &= 0 (\ch{N2})
        \\  \text{valence}_N &= 5 (\ch{N})
        \\  \text{valence}_C &= 4
        \\  \text{valence}_H &= 1
        \\  \text{valence}_O &= -2
        \\  \text{valence}_P &=  5
        \\  \text{valence}_S &= -6
        \\  \ae_{NH3} &= 0
        \\  \ae_{CO2} &= 0
        \\  \ae_{H2O} &= 0
      \end{cases}
    ]],{})
  ),
  ms( -- Gamma_S degree of reduction of substrate
    {
      common = {
        name = "γ_B Biomass Degree of Reduction",
        desc = "Number of equivalent electrons that quantity of material containing 1g atom of C"
      },
      "\\formula-EB-gamma_S-degree-of-reduction-for-substrate",
    },
    fmt(
      [[
      % S = C_{<w>}H_{<x>}O_{<y>}N_{<z>}
      \gamma_S
      = \frac{ae_{S}}{<w_r>}
      = \frac{4\,<w_r>+<x_r>-2\,<y_r>-3\,<z_r>}{<w_r>}
      ]],{
        w = i(1,"w"),
        x = i(2,"x"),
        y = i(3,"y"),
        z = i(4,"z"),
        w_r = rep(1),
        x_r = rep(2),
        y_r = rep(3),
        z_r = rep(4),
      }
    )
  ),
  ms( -- biomass yield
    {
      common = {
        name = "Y_{XS} Biomass Yield",
        desc = {
          "Linear relationship between the amount of biomass produced and the amount of substrate consumed",
          "MW: Molecular weight",
          "ash: residual ash"
        }
      },
      "\\formula-EB-Y_XS-biomass-yield",
    },
    fmt(
      [[
      Y_{XS}
      = \unit{\frac
        {\gram\of{\text{Cells produced}}}
        {\gram\of{\text{Substrate consumed}}}
      }
      = \frac
      {c*MW_{\text{cells+ash}}}
      {MW_S}
      ]],{}
    )
  ),
  ms( -- Product yield
    {
      common = {
        name = "Y_{PS} Product Yield",
        desc = "Experimentally determined"
      },
      "\\formula-EB-Y_PS-product-yield",
    },
    fmt(
      [[
      Y_{PS}
      = \unit{\frac
        {\gram\of{\text{Product formed}}}
        {\gram\of{\text{Substract Consumed}}}
      }
      = \frac
      {f\,MW_P}
      {MW_S}
      ]],{}
    )
  ),
  ms( -- Oxygen demand
    {
      common = {
        name = "a: Theoretical Oxygen Demand"
      },
      "\\formula-EB-teo-oxygen-demand"
    },
    fmt(
      [[
      % S = C_<w>...
      % B = <c> * C_1...
      % P = <f> * C_<j>...
      a 
      = \frac{1}{4}\left(
        <w_r>\,\gamma_S
        - <c_r>\,\gamma_B
        - <f_r>\,<j_r>\,\gamma_P
      \right)
      ]],{
        w = i(1,"w"),
        c = i(2,"c"),
        f = i(3,"f"),
        j = i(4,"j"),
        w_r = rep(1),
        c_r = rep(2),
        f_r = rep(3),
        j_r = rep(4),
      }
    )
  ),
  ms( -- ζ_B fraction of available eletrons on the substrate
    {
      common = {
        name = "ζ_B: fraction of available electrons on the substrate"
      },
      "\\formula-EB-zeta_B-fraction-of-available-electrons-on-the-substrate",
    },
    fmt(
      [[
      \zeta_B
      = \frac
      {c\,\gamma_B}
      {w\,\gamma_S}
      ]],{}
    )
  ),
  ms( -- c_max max oxygen comsumption
    {
      common = {
        name = "c_max",
        desc = {
          "Maximum oxygen comsuption",
          "Used to calculate upper limit for biomass yield",
          "γ_B = 4.2 if cell composition is unknown"
        },
      },
      "\\formula-EB-c_max-max-oxygen-comsumption",
    },
    fmt(
      [[
      c_{\max{}}
      = w\,\gamma_S/\gamma_B
      ]],{}
    )
  ),
  ms( -- f_max max product yield
    {
      common = {
        name = "f_max",
        desc = "Maximum product yield",
      },
      "\\formula-EB-f_max-maximum-product-yield",
    },
    fmt(
      [[
      f_{max} = w\,\gamma_S/l\,\gamma_P
      ]],{}
    )
  ),
}
