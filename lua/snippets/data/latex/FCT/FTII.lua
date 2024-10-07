local ls = require("luasnip")

local s = ls.snippet     -- build snippets
-- local t = ls.text_node -- insert text
local i = ls.insert_node -- user input

-- local extras = require("luasnip.extras")
-- local rep = extras.rep                         -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return
--
    s( -- difusão em misturas
      {
        desc = "d_{a,m} difusão de um gás em mistura",
        trig = "\\formula-difusao-mistura",
      },
      fmt(
        [[
      \mathscr{d}_{<x>,m}
      = \frac{
        \sum_{j=2}^{n}{y_{j}}
      }{
        \sum_{i=2}^{n}{y_i/\mathscr{d}_{<x>,i}}
      }
    ]],
        { x = i(1, "x") }
      )
    ),
    s( -- variação da difusão
      {
        desc = "d ∝ t^{3/2}*ω, d ∝ p^{-1}",
        trig = {
          "\\formula-difusão-variacao",
          "\\formula-difusão-prop",
        },
      },
      fmt(
        [[
      \frac
      {\mathscr{d}_{
        <a>,
        <b>,
        \qty{<t2>}{<tunit>},
        \qty{<p2>}{<punit>}
      }}
      {\mathscr{d}_{
        <a>,
        <b>,
        \qty{<t1>}{<tunit>},
        \qty{<p1>}{<punit>}
      }}
      =
      \,\frac{<p1>}{<p2>}
      \,\left(
        \frac{<t2>}{<t1>}
      \right)^{3/2}
      % \,\frac
      % {\omega_{\mathscr{d},<t1>}}
      % {\omega_{\mathscr{d},<t2>}}
    ]],
        {
          a = i(1, "a"),
          b = i(2, "b"),
          t1 = i(3, "t_1"),
          p1 = i(4, "p_1"),
          t2 = i(5, "t_2"),
          p2 = i(6, "p_2"),
          tunit = i(7, "\\kelvin"),
          punit = i(8, "\\atm"),
        }
      )
    ),
    s( -- difusão em liquidos (stokes-einstein)
      {
        desc = {
          "difusão em liquidos (stokes-einstein)",
          "𝒟 liquidos",
        },
        trig = "\\formula-difusao-liquido-stoke-einstein",
      },
      fmt([[
      \mathscr{d}_a
      =\frac{k_b\,t}{6\,\pi\,\mu\,r_a}
    ]],{})
    ),
    s( -- diluição infinita hayduk-laudie
      {
        desc = {
          "diluição infinita hayduk-laudie",
          "𝒟 inf em líquidos",
        },
        trig = "\\formula-diluicao-infinita-hayduk-laudie",
      },
      fmt([[
      \mathscr{d}_{a,b}
      = 13.26*10^{-5}\,\mu_b^{-1.14}\,v_a^{-0.589}
    ]],{})
    ),
    s( -- equação de scheibel
      {
        desc = "equação de scheibel 𝒟",
        trig = "\\formula-difusao-sheibel",
      },
      fmt([[
      \frac{\mathscr{d}_{a,b}\,\mu_b}{t}
      =\frac{
        8.2*10^{-8}
        \left(
          1 + (3\,v_b/v_a)^{2/3}
        \right)
      }{
        v_a^{1/3}
      }
    ]],{})
    ),
    s( -- fluxo
      {
        desc = {
          "fluxo",
          "θ=1+n_b/n_a",
        },
        trig = "\\formula-fluxo-geral",
      },
      fmt([[
      n_{a,z}
      = -\frac{c\,d_{a,b}}{1-\theta\,y_a}
      \,\odv{y_a}{z}
    ]],{})
    ),
    s( -- fluxo estacionário plano
      {
        desc = {
          "fluxo estacionário plano",
          "s*n_{a,z}: cte;",
          "θ=1+n_b/n_a",
        },
        trig = "\\formula-fluxo-estacionario-plano",
      },
      fmt([[
      n_{a,z}
      = \frac{c\,d_{a,b}}{\theta\,\adif{z}}
      \,\ln\frac
      {1-\theta\,y_{a,1}}
      {1-\theta\,y_{a,0}}
    ]],{})
    ),
    s( -- fluxo estacionário cilindro
      {
        desc = {
          "fluxo estacionário cilindro",
          "2*pi*r*l*n_{a,r}: cte;",
          "θ=1+n_b/n_a",
        },
        trig = "\\formula-fluxo-estacionario-cilindro",
      },
      fmt([[
      n_{a,r}
      = -\frac{c\,d_{a,b}}{\theta\,r_0\,\ln{(r_1/r_0)}}
      \,\ln\frac
      {1-\theta\,y_{a,1}}
      {1-\theta\,y_{a,0}}
    ]],{})
    ),
    s( -- fluxo estacionário esfera
      {
        desc = {
          "fluxo estacionário esfera",
          "4*pi*r^2*n_{a,r}: cte;",
          "θ=1+n_b/n_a",
        },
        trig = "\\formula-fluxo-estacionario-esfera",
      },
      fmt([[
      n_{a,r}
      = -\frac{c\,d_{a,b}}{\theta\,r_0(1-r_0/r_1)}
      \,\ln\frac
      {1-\theta\,y_{a,1}}
      {1-\theta\,y_{a,0}}
    ]],{})
    )
