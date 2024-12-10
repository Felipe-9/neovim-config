local ls = require("luasnip")

local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
-- local r = ls.restore_node -- restore from variable
local c = ls.choice_node -- multiple options

local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

-- ls.add_snippets("tex",
--   require("snippets.data.latex.constants"),
--   require("snippets.data.latex.math"),
--   require("snippets.data.latex.mysnippets"),
--   require("snippets.data.latex.tikz-pfg"),
--   -- FCT
--   require("snippets.data.latex.FCT.AM2C"),
--   require("snippets.data.latex.FCT.AM3C"),
--   require("snippets.data.latex.FCT.CMA"),
--   require("snippets.data.latex.FCT.CNA"),
--   -- require("snippets.data.latex.FCT.EB"),
--   require("snippets.data.latex.FCT.FTII"),
--   require("snippets.data.latex.FCT.OSF"),
--   require("snippets.data.latex.FCT.QF"),
--   require("snippets.data.latex.FCT.QFA"),
--   require("snippets.data.latex.FCT.TEQB"),
--   -- Templates
--   require("snippets.data.latex.templates.mainfile"),
--   require("snippets.data.latex.templates.subfile")
-- )

ls.add_snippets("tex", {
  --
  -- FCT
  --
  -- TEQB
  ms( -- formula gibbs
    {
      common = {
        desc = { "equação de gibbs forma derivada" },
      },
      -- trig
      "\\formula-gibbs-derivada",
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
  ms( -- formula variação de entropia de gás perfeito
    {
      common = {
        desc = { "equação para variação de entropia de um gás perfeito" },
      },
      -- trig
      "\\formula-entropia_gas_perfeito",
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
  ms( -- forumla de clapeyron
    {
      common = {
        desc = { "equação de clapeyron" },
      },
      -- trig
      "\\formula-clapeyron",
    },
    fmt(
      [[
      \odv{p}{t}
      = t^{-1}\adv{h}{v}
      ]],
      {}
    )
  ),
  ms( -- forumla de clapeyron h vap
    {
      common = {
        desc = { "equação de clapeyron para entalpia de vaporização" },
      },
      -- trig
      "\\formula-clapeyron-h_vap",
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
  ),
  -- QFA
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
  -- QF
  -- OSF
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
  -- FTII
  ms( -- difusão em misturas
    {
      common = {
        desc = { "d_{a,m} difusão de um gás em mistura" },
      },
      -- trig
      "\\formula-difusao-mistura",
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
  ms( -- variação da difusão
    {
      common = {
        desc = { "d ∝ t^{3/2}*ω, d ∝ p^{-1}" },
      },
      -- trig
      "\\formula-difusão-variacao",
      "\\formula-difusão-prop",
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
  ms( -- difusão em liquidos (stokes-einstein)
    {
      common = {
        desc = {
          "difusão em liquidos (stokes-einstein)",
          "𝒟 liquidos",
        },
      },
      -- trig
      "\\formula-difusao-liquido-stoke-einstein",
    },
    fmt(
      [[
      \mathscr{d}_a
      =\frac{k_b\,t}{6\,\pi\,\mu\,r_a}
      ]],
      {}
    )
  ),
  ms( -- diluição infinita hayduk-laudie
    {
      common = {
        desc = {
          "diluição infinita hayduk-laudie",
          "𝒟 inf em líquidos",
        },
      },
      -- trig
      "\\formula-diluicao-infinita-hayduk-laudie",
    },
    fmt(
      [[
      \mathscr{d}_{a,b}
      = 13.26*10^{-5}\,\mu_b^{-1.14}\,v_a^{-0.589}
      ]],
      {}
    )
  ),
  ms( -- equação de scheibel
    {
      common = {
        desc = { "equação de scheibel 𝒟" },
      },
      -- trig
      "\\formula-difusao-sheibel",
    },
    fmt(
      [[
      \frac{\mathscr{d}_{a,b}\,\mu_b}{t}
      =\frac{
        8.2*10^{-8}
        \left(
          1 + (3\,v_b/v_a)^{2/3}
        \right)
      }{
        v_a^{1/3}
      }
      ]],
      {}
    )
  ),
  ms( -- fluxo
    {
      common = {
        desc = {
          "fluxo",
          "θ=1+n_b/n_a",
        },
      },
      -- trig
      "\\formula-fluxo-geral",
    },
    fmt(
      [[
      n_{a,z}
      = -\frac{c\,d_{a,b}}{1-\theta\,y_a}
      \,\odv{y_a}{z}
      ]],
      {}
    )
  ),
  ms( -- fluxo estacionário plano
    {
      common = {
        desc = {
          "fluxo estacionário plano",
          "s*n_{a,z}: cte;",
          "θ=1+n_b/n_a",
        },
      },
      -- trig
      "\\formula-fluxo-estacionario-plano",
    },
    fmt(
      [[
      n_{a,z}
      = \frac{c\,d_{a,b}}{\theta\,\adif{z}}
      \,\ln\frac
      {1-\theta\,y_{a,1}}
      {1-\theta\,y_{a,0}}
      ]],
      {}
    )
  ),
  ms( -- fluxo estacionário cilindro
    {
      common = {
        desc = {
          "fluxo estacionário cilindro",
          "2*pi*r*l*n_{a,r}: cte;",
          "θ=1+n_b/n_a",
        },
      },
      -- trig
      "\\formula-fluxo-estacionario-cilindro",
    },
    fmt(
      [[
      n_{a,r}
      = -\frac{c\,d_{a,b}}{\theta\,r_0\,\ln{(r_1/r_0)}}
      \,\ln\frac
      {1-\theta\,y_{a,1}}
      {1-\theta\,y_{a,0}}
      ]],
      {}
    )
  ),
  ms( -- fluxo estacionário esfera
    {
      common = {
        desc = {
          "fluxo estacionário esfera",
          "4*pi*r^2*n_{a,r}: cte;",
          "θ=1+n_b/n_a",
        },
      },
      -- trig
      "\\formula-fluxo-estacionario-esfera",
    },
    fmt(
      [[
      n_{a,r}
      = -\frac{c\,d_{a,b}}{\theta\,r_0(1-r_0/r_1)}
      \,\ln\frac
      {1-\theta\,y_{a,1}}
      {1-\theta\,y_{a,0}}
      ]],
      {}
    )
  ),
  -- EB
  ms( -- formulas-cell-concentration-mass-balance-cstr
    {
      common = {
        desc = {
          "CSTR Mass balance for cell concentration",
        },
      },
      -- trig
      "\\formulas-cell-concentration-mass-balance-cstr",
    },
    fmt(
      [[

      ]],
      {}
    )
  ),
  -- CNA
  ms( -- polinomio de lagrange
    {
      common = {
        desc = { "lagrange polynomn" },
      },
      -- trig
      "\\formula-CNA-polinomio-lagrange",
    },
    fmt(
      [[
      p_{n\,(x)}=\sum_{i=0}^{n}{y_i\,l_{i\,(x)}}
      ;&\\&
      l_{i\,(x)}
      =\varphi_{i\,(x)}
      =\prod_{j=0}^{i-1}{\frac{x-x_j}{x_i-x_j}}
      \,\prod_{j=i+1}^{n}{\frac{x-x_j}{x_i-x_j}}
      ]],
      {}
    )
  ),
  ms( -- polinómio de newton com diferenças divididas
    {
      common = {
        desc = { "polinómio de newton com diferenças divididas" },
      },
      -- trig
      "\\formula-polinomio-newton-com-diff-div",
    },
    fmt(
      [[
      p_{n\,(x)}
      = f_0
      + \sum_{i=0}^{n-1}{
        \left(\prod_{j=0}^{i}{x-x_j}\right)
        \,f_{[x_0,\dots,x_{i+1}]}
      }
      ]],
      {}
    )
  ),
  ms( -- erro de interpolação
    {
      common = {
        desc = { "erro de interpolação" },
      },
      -- trig
      "\\formula-erro-interpolacao",
    },
    fmt(
      [[
      f_{x^*}-p_{n\,(x^*)}
      = \frac{f^{x+1}_{(\xi)}}{(n+1)!}
      \prod_{i=0}^{n}{x^*-x_i}
      \\\xi\in\myrange*{
        \min(x_0,x_1,\dots,x_n),
        \max(x_0,x_1,\dots,x_n)
      }
      ]],
      {}
    )
  ),
  ms( -- interpolação por splines polinomiais cúbicos
    {
      common = {
        desc = {
          "expressão de spline polinomial cúbico",
          "interpolador de f em x_0,x_1,...,x_n",
          "no intervalo [x_i,x_{i+1}]",
        },
      },
      -- trig
      "\\formula-interp-spline-poli-cubico",
    },
    fmt(
      [[
      s_{i\,(x)}
      = \left(
        \begin{aligned}
          - &
            \frac{(x-x_{i+1})^3}{6\,h_i}\,m_i
          &+\\+&
            \frac{(x-x_i)^3}{6\,h_i}\,m_{i+1}
          &+\\+&
            \left(
              f_i
              - \frac{h_i^2}{6}\,m_i
            \right)
            \,\frac{x_{i+1}-x}{h_i}
          &+\\+&
            \left(
              f_{i+1}
              - \frac{h_i^2}{6}\,m_{i+1}
            \right)
            \,\frac{x-x_i}{h_i}
          &
        \end{aligned}
      \right)
      ;&\\&
      h_i=x_{i+1}-x_i
      ,\quad i=0,1,\dots,n-1
      ;&\\&
      m_i=\odv[order=2]{s_{(x_i)}}{x}
      ,\quad i=0,1,\dots,n
      ]],
      {}
    )
  ),
  ms( -- sistema de equações para det spline cubico interpolador de f
    {
      common = {
        desc = {
          "sistema de equações para determinação de um spline cúbico",
          "interpolador de f",
          "nos pontos x_0,x_1,...,x_n",
        },
      },
      -- trig
      "\\formula-sistema-eq-spline-cubico-interp",
    },
    fmt(
      [[
      h_{i-1}\,m_{i-1}
      + 2\,(h_{i-1}+h_i)\,m_i
      + h_i\,m_{i+1}
      = 6\left(
        \frac{f_{i+1}-f_{i}}{h_i}
        -\frac{f_{i}-f_{i-1}}{h_{i-1}}
      \right)
      ,\quad i\in\myrange{1,n-1}
      ]],
      {}
    )
  ),
  ms( -- sistema de equações para determinação do spline cúbico completo
    {
      common = {
        desc = { "adicionar às equações [e] as equações" },
      },
      -- trig
      "\\formula-sistema-eq-spline-cubico-completo",
    },
    fmt(
      [[
      2\,h_0\,m_0 + h_0\,m_1
        = 6\,\left(
          \frac{f_1-f_0}{h_0}-f'_{0}
        \right)
        &\\&
        h_{n-1}\,m_{n-1} + 2\,h_{n-1}\,m_n
        = 6\,\left(
          f'_{0}-\frac{f_n-f_{n-1}}{h_{n-1}}
        \right)
      ]],
      {}
    )
  ),
  ms( -- sistema de equações para determinação do spline cúbico natural
    {
      common = {
        desc = { "adicionar às equações [e] as equações" },
      },
      -- trig
      "\\formula-sistema-eq-spline-cubico-natural",
    },
    fmt("m_0=m_n=0", {})
  ),
  ms( -- metodo dos mínimos quadrados
    {
      common = {
        desc = {
          "função polinomial que melhor aproxima",
          "os dados {(x_0,y_0),...,(x_n,y_n)}",
          "em relacao à base {1,x,...,x^m}",
        },
      },
      "\\formula-metodo-minimos-quadrados",
    },
    fmt(
      [[
      p_{(x)} = \sum_{i=0}^{m}{\alpha_i\,x^i}
      &\\[3ex]&
      \begin{cases}
          \sum_{i=0}^{m}{\left(
              \alpha_i\,\sum_{j=0}^{n}{x_{j}^{i+k}}
          \right)}
          = \sum_{i=0}^{n}{x_i^k\,y_i}
          \\
          k\in\myrange{0,m}
      \end{cases}
      ]],
      {}
    )
  ),
  -- numerical integration
  ms( -- formulas de newton-cotes (fechadas) 0
    {
      common = {
        desc = { "regra do ponto médio" },
      },
      -- trig
      "\\formula-newton-cotes-0-regra-ponto-medio",
    },
    fmt(
      [[
      % integração
      \int_{a=x_0}^{b=x_1}{f_{(x)}\,\odif{x}}
      \approx h\,f_{\left(\frac{x_0+x_1}{2}\right)}
      &\\[3ex]&
      % erro de quadratura
      \frac{h^3}{24}\,\odv[order=2]{f_{(\xi)}}{x}
      ;\quad\xi\in\myrange*{x_0,x_1}
      ]],
      {}
    )
  ),
  ms( -- formulas de newton-cotes (fechadas) 1
    {
      common = {
        desc = { "regra dos trapézios" },
      },
      -- trig
      "\\formula-newton-cotes-1-regra-trapezios",
    },
    fmt(
      [[
      % integração
      \int_{a=x_0}^{b=x_1}{f_{(x)}\,\odif{x}}
      \approx \frac{h}{2}\,(f_0+f_1)
      &\\[3ex]&
      % erro de quadratura
      -\frac{h^3}{12}\,\odv[order=2]{f_{(\xi)}}{x}
      ;\quad\xi\in\myrange*{x_0,x_1}
      ]],
      {}
    )
  ),
  ms( -- formulas de newton-cotes (fechadas) 2
    {
      common = {
        desc = { "regra de simpson simples" },
      },
      -- trig
      "\\formula-newton-cotes-2-regra-simpson-simples",
      "\\formula-regra-simpson-simples",
    },
    fmt(
      [[
      % integração
      \int_{a=x_0}^{b=x_2}{f_{(x)}\,\odif{x}}
      =i
      \approx \hat{i}
      =\frac{h}{3}\,(f_0+4\,f_1+f_2)
      &\\[3ex]&
      % erro de quadratura
      \varepsilon_i
      =i-\hat{i}_s
      = -\frac{h^5}{90}\,f^{(4)}(\xi)
      ;\quad\xi\in\myrange*{x_0,x_2}
      ]],
      {}
    )
  ),
  ms( -- regra de simpson composta
    {
      common = {
        desc = {
          "regra de simpson composta",
          "grau de precisão: 3",
          "σ ∈ ]a,b[",
          "h = (b-a)/2n",
        },
      },
      -- trig
      "\\formula-regra-simpson-composta",
    },
    fmt(
      [[
      % integração
      \int_{a=x_0}^{b=x_2}{f_{(x)}\,\odif{x}}
      =i
      \approx \hat{i}
      = \frac{h}{3}\left(
        f(x_0)
        + 4\,\sum_{j=1}^{n  }{f(x_{(2\,j-1)})}
        + 2\,\sum_{j=1}^{n-1}{f(x_{(2\,j  )})}
        + f(x_{2\,n})
      \right)
      &\\[3ex]&
      % erro de quadratura
      \varepsilon_i
      = i-\hat{i}_s
      = -n\,\frac{h^5}{90}\,f^{(4)}(\sigma)
      ;\quad\sigma\in\myrange*{x_0,x_2}
      ]],
      {}
    )
  ),
  ms( -- método de integração de gauss
    {
      common = {
        desc = { "método de integração de gaussu" },
      },
      -- trig
      "\\formula-metodo-integracao-gauss",
    },
    fmt(
      [[
      \int_a^b{f_{(x)}\,\odif{x}}
      = \frac{b-a}{2}
      \,\int_{-1}^{1}{f_{\left(
        \frac{b-a}{2}\,y
        + \frac{b+a}{2}
      \right)}\,\odif{y}}
      ${1:&}\\[3ex]${1:&}
      f\in c^{(2\,n)}_{(\myrange{-1,1})}
      // \implies ${1:&}\\${1:&}
      \implies
      i-\hat{i}
      = \frac{
        2^{2\,n+1}\,(n!)^4
      }{
        (2\,n+1)\,((2\,n)!)^3
      }
      \,\odv[order={2\,n}]{f_{(\theta)}}{x}
      ,\quad\theta\in\myrange{-1,1}
      ]],
      {}
    )
  ),
  ms( -- cn a convergencia
    {
      common = {
        desc = { "convergencia de uma sucessão x_i=f(x_(i-1)) a partir de um x_0 para α" },
      },
      -- trig
      "\\formula-cna-convergencia-sucessao",
    },
    fmt(
      [[
      \text{condições de conversão}&\\&
      \begin{cases}
        f(x) \text{ é contínua em } i
        \\
        f(x)\in i,\forall x\in i
        \\
        \myvert{f'(x)}\leq\myvert{f'(\alpha)}
      \end{cases}
      ]],
      {}
    )
  ),
  -- CMA
  -- formulas
  ms( -- lei de bragg
    {
      common = {
        desc = {
          "n: ordem de reflexão",
          "λ: ordem de reflexão",
          "d: distancia entre planos",
          "θ: angulo de impacto",
        },
      },
      -- trig
      "\\formula-lei-bragg-difracao-raios-x",
    },
    fmt(
      [[
      n\,\lambda=2\,d_{h\,k\,l}\,\sin(\theta)
      ]],
      {}
    )
  ),
  ms( -- distancias entre planos de miller
    {
      common = {
        desc = { "distancia entre planos de miller" },
      },
      -- trig
      "\\formula-distancia-planos-miller",
    },
    fmt(
      [[
      d_{h\,k\,l}
    =\frac{a}{\sqrt{h^2+k^2+l^2}}
      ]],
      {}
    )
  ),
  ms( -- tabela difracao raios x
    {
      common = {
        desc = { "Difração com N indo de 1 a 12" },
      },
      -- trig
      "\\formula-tabela-difracao-raios-x-bragg",
    },
    fmt(
      [[
      \begin{center}
      \vspace{1ex}
      \begin{tabular}{*{5}{C}}
          \toprule

              h & k & l & N & 2\,\theta

          \\\midrule

                 1 & 0 & 0 &  1 &
              \\ 1 & 1 & 0 &  2 &
              \\ 1 & 1 & 1 &  3 &
              \\ 2 & 0 & 0 &  4 &
              \\ 2 & 1 & 0 &  5 &
              \\ 2 & 1 & 1 &  6 &
              \\ 2 & 2 & 0 &  8 &
              \\ 2 & 2 & 1 &  9 &
              \\ 3 & 0 & 0 &  9 &
              \\ 3 & 1 & 0 & 10 &
              \\ 3 & 1 & 1 & 11 &
              \\ 2 & 2 & 2 & 12 &

          \\\bottomrule
      \end{tabular}
      \vspace{2ex}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- parametro de rede cubica
    {
      common = {
        desc = {
          "a - Parametro de rede CS, CFC e CCC em função do peso atomico e densidade",
          "CS : a=r*2",
          "CCC: a=r*4/sqrt(3)",
          "CFC: a=r*2^{3/2}",
        },
      },
      -- trig
      "\\formula-parametro-rede-Cubica",
      "\\formula-parametro-rede-CS",
      "\\formula-parametro-rede-CFC",
      "\\formula-parametro-rede-CCC",
    },
    fmt(
      [[
      a
      =\sqrt[3]{
        \frac
        {Pa\,n_{\text{at por cel}}}
        {\rho\,N_A} % N_A numero de avogadro
      }
      ]],
      {}
    )
  ),
  -- constantes
  ms( -- fator de empacotamento atomico cs
    {
      common = {
        desc = { "fea - porcentagem de volume ocupado por atomos na estrutura cristalina,\n a=2r" },
      },
      -- trig
      "\\constante-fator-empacotamento-fea-cs",
    },
    fmt(
      [[
      \qty{52.3598775598299}{\percent}
      ]],
      {}
    )
  ),
  ms( -- fator de empacotamento atomico ccc
    {
      common = {
        desc = {
          "fea - porcentagem de volume ocupado por atomos na estrutura cristalina,",
          "a = r*4/\\sqrt{3}",
        },
      },
      -- trig
      "\\constante-fator-empacotamento-fea-ccc",
    },
    fmt(
      [[
      \qty{68.0174761587832}{\percent}
      ]],
      {}
    )
  ),
  ms( -- fator de empacotamento atomico cfc
    {
      common = {
        desc = {
          "fea - porcentagem de volume ocupado por atomos na estrutura cristalina,",
          "a=r*2^{3/2}",
        },
      },
      -- trig
      "\\constante-fator-empacotamento-fea-cfc",
    },
    fmt(
      [[
      \qty{74.0480489693062}{\percent}
      ]],
      {}
    )
  ),
  ms( -- fator de empacotamento atomico hc
    {
      common = {
        desc = {
          "fea - porcentagem de volume ocupado por atomos na estrutura cristalina,",
          "a=2r, c=1.633*a",
        },
      },
      -- trig
      "\\constante-fator-empacotamento-fea-hc",
    },
    fmt(
      [[
      \qty{74.0477388950487}{\percent}
      ]],
      {}
    )
  ),
  -- tikzpictures
  ms( -- tikz estrutura cristalina cubica cs
    {
      common = {
        desc = { "tikz de cs" },
      },
      -- trig
      "\\tikz-estrutura-cristalina-cubica-cs",
    },
    fmt(
      [[
      % atoms
        \fill[ball color=graph33] (0,0,0) circle (.5);
        \fill[ball color=graph33] (1,0,0) circle (.5);
        \fill[ball color=graph33] (1,1,0) circle (.5);
        \fill[ball color=graph33] (0,1,0) circle (.5);
        %
        \fill[ball color=graph31] (0,0,1) circle (.5);
        \fill[ball color=graph31] (1,0,1) circle (.5);
        \fill[ball color=graph31] (1,1,1) circle (.5);
        \fill[ball color=graph31] (0,1,1) circle (.5);
      ]],
      {}
    )
  ),
  ms( -- tikz estrutura cristalina cubica ccc
    {
      common = {
        desc = { "\\tikz-estrutura-cristalina-cubica-ccc" },
      },
      -- trig
      "tikz de ccc",
    },
    fmt(
      [[
      % atoms
      \fill[ball color=graph33] (0,0,0) circle (0.433012701892219);
      \fill[ball color=graph33] (1,0,0) circle (0.433012701892219);
      \fill[ball color=graph33] (1,1,0) circle (0.433012701892219);
      \fill[ball color=graph33] (0,1,0) circle (0.433012701892219);
      %
      \fill[ball color=graph32] (0.5,0.5,0.5) circle (0.433012701892219);
      %
      \fill[ball color=graph31] (0,0,1) circle (0.433012701892219);
      \fill[ball color=graph31] (1,0,1) circle (0.433012701892219);
      \fill[ball color=graph31] (1,1,1) circle (0.433012701892219);
      \fill[ball color=graph31] (0,1,1) circle (0.433012701892219)
      ]],
      {}
    )
  ),
  ms( -- tikz estrutura cristalina cubica cfc
    {
      common = {
        desc = { "tikz de cfc" },
      },
      -- trig
      "\\tikz-estrutura-cristalina-cubica-cfc",
    },
    fmt(
      [[
      % atoms
        \fill[ball color=graph33] (0,0,0) circle (0.353553390593274);
        \fill[ball color=graph33] (1,0,0) circle (0.353553390593274);
        \fill[ball color=graph33] (1,1,0) circle (0.353553390593274);
        \fill[ball color=graph33] (0,1,0) circle (0.353553390593274);
        \fill[ball color=graph33] (0.5,0.5,0) circle (0.353553390593274);
        %
        \fill[ball color=graph32] (1,0.5,0.5) circle (0.353553390593274);
        \fill[ball color=graph32] (0,0.5,0.5) circle (0.353553390593274);
        \fill[ball color=graph32] (0.5,1,0.5) circle (0.353553390593274);
        \fill[ball color=graph32] (0.5,0,0.5) circle (0.353553390593274);
        %
        \fill[ball color=graph31] (0,0,1) circle (0.353553390593274);
        \fill[ball color=graph31] (1,0,1) circle (0.353553390593274);
        \fill[ball color=graph31] (1,1,1) circle (0.353553390593274);
        \fill[ball color=graph31] (0,1,1) circle (0.353553390593274);
        \fill[ball color=graph31] (0.5,0.5,1) circle (0.353553390593274)
      ]],
      {}
    )
  ),
  -- planos indices de miller
  ms( -- tikz plano miller (110)
    {
      common = {
        desc = {
          "plano com indice de miller (110)",
          "diagonal sobre z",
        },
      },
      -- trig
      "\\tikz-plano-miller-(110)",
    },
    fmt(
      [[
      % plano (110)
      \draw[-, fill, fill opacity=0.3]
         (0,0,1)
      -- (0,1,1)
      -- (1,1,0)
      -- (1,0,0)
      ]],
      {}
    )
  ),
  ms( -- tikz plano miller (001)
    {
      common = {
        desc = {
          "plano com indice de miller (001)",
          "face z=1",
        },
      },
      -- trig
      "\\tikz-plano-miller-(001)",
    },
    fmt(
      [[
      % plano (001)
      \draw[-, fill, fill opacity=0.3]
         (1+0.3, 1, 0-0.3)
      -- (1+0.3, 1, 1+0.3)
      -- (0-0.3, 1, 1+0.3)
      -- (0-0.3, 1, 0-0.3)
      ]],
      {}
    )
  ),
  ms( -- tikz plano miller (111)
    {
      common = {
        desc = {
          "plano com indice de miller (111)",
          "triangulo",
        },
      },
      -- trig
      "\\tikz-plano-miller-(111)",
    },
    fmt(
      [[
      % plano (111)
      \draw[-, fill, fill opacity=0.3]
         (1,0,0)
      -- (0,1,0)
      -- (0,0,1);
      ]],
      {}
    )
  ),
  -- AM3C
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
  -- AM2C
  ms( -- parabolas
    {
      common = {
        desc = { "parametrizando parabolas" },
      },
      -- trig
      "\\formula-parabolas",
    },
    fmt(
      [[
      y=\alpha\,x^2+\beta\,x+\gamma
      \implies &\\&
      \implies
      \begin{cases}
        a = (4\,\alpha)^{-1}
        \\
        x_0
        = -\beta\,2\,a
        = -\beta/2\,\alpha
        \\
        y_0
        = \gamma-x_0^2/4\,a
        = \gamma-\beta/4\,\alpha
      \end{cases}
      ]],
      {}
    )
  ),
  ms( -- elipses
    {
      common = {
        desc = { "caracterizando elipses" },
      },
      -- trig
      "\\formua-elipses",
    },
    fmt(
      [[
      \frac{(x-x_0)^2}{r_1^2}
      + \frac{(y-y_0)^2}{r_2^2}
      = 1
      &\\&
      \begin{cases}
        c = \myvert{\vec{p_0\,f}}
        = \sqrt{r_1^2+r_2^2}
        \\
        f_1\in\mathbb{r}^2:f_1=(x_0-c,y_0)
        \\
        f_1\in\mathbb{r}^2:f_1=(x_0-c,y_0)
      \end{cases}
      ]],
      {}
    )
  ),
  ms( -- hiperboles
    {
      common = {
        desc = { "caracterizando hiperboles" },
      },
      -- trig
      "\\formula-hiperboles",
    },
    fmt(
      [[
      \left(
        \frac{x-x_0}{r_1}
      \right)
      - \left(
        \frac{y-y_0}{r_2}
      \right)
      = 1
      &\\&
      \begin{cases}
        c = \myvert{\vec{p_0\,f}}
        = \sqrt{r_1^2+r_2^2}
        \\
        v=(x_0\pm r_1,y_0)
        \\
        f=(x_0\pm c,y_0)
        \\
        a = \left{
          (x,y):(y-y_0)
          = \pm\frac{r_2}{r_1}
          \,(x-x_0)
        \right}
      \end{cases}
      ]],
      {}
    )
  ),
  ms( -- plano tangente a f
    {
      common = {
        desc = { "formula para plano tangente a uma superficie f genérica no ponto genérico (x0,y0,z0)" },
      },
      -- trig
      "\\formula-plano-tangente",
    },
    fmt(
      [[
      \left(
        \begin{aligned}
          &
                 \pdv{f}{x}(x_0)\,(x-x_0)
          &+\\+& \pdv{f}{y}(y_0)\,(y-y_0)
          &+\\+& \pdv{f}{z}(z_0)\,(z-z_0)
          &
        \end{aligned}
      \right)
      = 0
      ]],
      {}
    )
  ),
  -- s( -- limite segundo cauchy
  --   {
  --     desc = { "definição de limite segundo cauchy" },
  --     trig = { "\\formula-limite-cauchy" },
  --   },
  --   fmt([[
  --     \forall\,\delta>0\,
  --     \exists\,\varepsilon>>0:
  --     \left(
  --       \left(
  --         \forall x\in \dominio
  --         \land
  --         \myvert{x-a}<<\varepsilon
  --       \right)
  --       \implies
  --       \myvert{
  --         f(x)-b
  --       }<<\delta
  --     \right)
  --   ]],{})
  -- ),
  ms( -- jacobiana(2x2)
    {
      common = {
        desc = { "jacobiana 2x2" },
      },
      -- trig
      "\\formula-jacobiana-2x2",
    },
    fmt(
      [[
      \begin{bmatrix}
        \pdv{x}{u} & \pdv{x}{v}
        \\
        \pdv{y}{u} & \pdv{y}{v}
      \end{bmatrix}_{(x,y)}
      ]],
      {}
    )
  ),
  ms( -- matriz hessiana 2x2
    {
      common = {
        desc = {
          "matriz hessiana 2x2",
          "máximos e minimos",
          "",
          "det h:",
          ">0: crítico local",
          "=0: indeterminável",
          "<0: ponto de sela",
          "",
          "det h>0 and d^2f/dx^2:",
          "<0: mínimo local",
          ">0: máximo local",
        },
      },
      -- trig
      "\\formula-matrix-hessiana-2",
      -- "\\formula-matriz-hessiana-2",
    },
    fmt(
      [[
      \det h_f=\begin{vmatrix}
            \pdv{f}{x,x}
          & \pdv{f}{x,y}
          \\\pdv{f}{y,x}
          & \pdv{f}{y,y}
      \end{vmatrix}
      ]],
      {}
    )
  ),
  ms( -- parametrização coordenadas esfericas
    {
      common = {
        desc = { "parametrização coordenadas esfericas" },
      },
      -- trig
      "\\formula-coordenadas-esfericas",
    },
    fmt(
      [[
      \begin{cases}
           x=r\sin\phi\,\cos\theta
        \\ y=r\sin\phi\,\sin\theta
        \\ z=\cos\phi
        \\ \myvert{\det j}=r^2\sin\phi
      \end{cases}
      ]],
      {}
    )
  ),
  ms( -- parametrização coordenadas cilindricas
    {
      common = {
        desc = { "parametrização coordenadas cilíndricas em r3" },
      },
      -- trig
      "\\formula-coordenadas-cilindricas",
    },
    fmt(
      [[
      \begin{cases}
          x=r\cos\theta
          \\ y=r\sin\theta
          \\ z=z
          \\ x^2+y^2=r
          \\ \tan{\theta}=y/x
          \\ \myvert{det j}=r
      \end{cases}
      ]],
      {}
    )
  ),
  --
  -- mysnippets
  --
  ms( -- tikz/external/remake next
    {
      common = {
        desc = {
          "tikz/external/remake next",
          "a variant of force remake which applies only to the next image.",
        },
      },
      -- trig
      "\\tikz/external/remake next",
    },
    fmt(
      [[
      \tikzset{external/remake next=<cond>}
      ]],
      { cond = i(1, "true") }
    )
  ),
  ms( -- tikz/external/force remake
    {
      common = {
        desc = {
          "tikz/external/force remake",
          "automatic regeneration of every following figure",
        },
      },
      -- trig
      "\\tikz/external/force remake",
    },
    fmt(
      [[
      \tikzset{external/force remake=<cond>}
      ]],
      { cond = i(1, "true") }
    )
  ),
  ms( -- tikz sci graph
    {
      common = {
        desc = {
          "tikz sci graph",
          "draw a scientific graph",
        },
      },
      -- trig
      "\\tikz-sci-graph",
    },
    fmt(
      [[
      % \tikzset{external/remake next=true}
      % {\large\bfseries{solução 1}}\par\medskip
      \begin{tikzpicture}
      \begin{axis}
      [
        xmajorgrids=true,
        ymajorgrids=true,
        minor tick num=3,
        xminorgrids=true,
        yminorgrids=true,
        % legend pos={north west},
        % axis on top,
        % ylabel={},
        % xlabel={},
      ]

        % % legends
        % \addlegendimage{empty legend}
        % \addlegendentry[graph]{}
        % ================= interpolation ================ %
        % \addplot[
        %     no marks,
        %     dashed,
        %     samples=2,
        % ] expression [
        %     domain=0:4000
        % ] {
        %     -3.5953e-4*x+0.0013
        % };
        % ==================== points ==================== %
        \addplot[
          mark=*,
          only marks,
        ] coordinates {
          (   0,  0)
          (1000, -0.35667494393873245)
          (2000, -0.717289485881545)
          (3000, -1.0777309126157544)
          (4000, -1.437104913523651)
        };

      \end{axis}
      \end{tikzpicture}
      ]],
      {}
    )
  ),
  ms( -- tikzpicture
    {
      common = {
        desc = { "tikzpicture, draw a tikzpicture" },
      },
      -- trig
      "\\begin{tikzpicture}",
      "\\btikzpicture",
    },
    fmt(
      [[
      \begin{tikzpicture}

        \draw[->>, thick, blue!60!]
        ( 0,  0)--node[anchor=south west]{\( a \)}
        (-1,0.5);

        \draw[->>, thick, blue!60!]
        ( 0,0  )--
        (-1,0.5)--node[anchor=south west]{\( 2\,a \)}
        (-2,1  );

        \draw[->>, thick, red!60!]
        (0,0)--node[anchor=south]{\( b \)}
        (1,0);

        \draw[->>, thick, red!60!]
        (-2,1)--node[anchor=south]{\( -3\,b \)}
        +(-3,0);

        \draw[->>, thick, green!60!]
        ( 0,0)--
        (-5,1) node[anchor=south east]{\( 2\,a - 3\,b \)};

      \end{tikzpicture}
      ]],
      {}
    )
  ),
  ms( -- graphEdge
    {
      common = {
        desc = { "graphEdge function" },
      },
      -- trig
      "\\graphEdge",
    },
    fmt(
      [[
      \graphEdge<mod><di_p><opts_p><do_p><di_d><opts_d><do_d>{<labels>}{<nodes>}
      ]],
      {
        mod = i(1, "*"),
        opts_p = i(2, "placement opts"),
        opts_d = i(3, "drawing opts"),
        labels = i(4, "labels"),
        nodes = i(5, "nodes"),
        di_p = ne(2, "["),
        do_p = ne(2, "]"),
        di_d = ne(2, "["),
        do_d = ne(2, "]"),
      }
    )
  ),
  ms( -- tikzgraphs
    {
      common = {
        desc = {
          "tikzgraphs",
          "Simple graphs template",
        },
      },
      -- trig
      "\\tikzgraphs",
    },
    fmt(
      [[
      \tikzset{external/remake next=true} % remake next
      \begin{center}
      \begin{tikzpicture}[myGraphsStyle]

        % ===================== Vertices ===================== %

        % 1,2,3
        \pic (1) at (0, 0) {graphVertice={1/0/0/below/3mm}};
        \pic (2) at (1, 1) {graphVertice={2/0/0/below/3mm}};
        \pic (3) at (1,-1) {graphVertice={3/0/0/below/3mm}};

        % ======================= Edges ====================== %

        % 1 ->> {2,3}
        \draw[->>] (1-x) -- (2-x);
        \draw[->>,dashed] (1-x) -- (3-x);

        % ==================================================== %

      \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- tikz 3d cube
    {
      common = {
        desc = {
          "tikz 3d cube",
          "Cube inside a tikzpicture",
        },
      },
      -- trig
      "\\tikz-3d-cube",
    },
    fmt(
      [[
      % Cube
      \draw[-]
         (0,0,0)
      -- (1,0,0)
      -- (1,1,0)
      -- (0,1,0)
      -- (0,0,0)
         (0,0,1)
      -- (1,0,1)
      -- (1,1,1)
      -- (0,1,1)
      -- (0,0,1)
      (0,0,0) -- (0,0,1)
      (0,1,0) -- (0,1,1)
      (1,1,0) -- (1,1,1)
      (1,0,0) -- (1,0,1);
      ]],
      {}
    )
  ),
  ms( -- tikz 3d guide
    {
      common = {
        desc = {
          "tikz 3d guide",
          "guides to help with drawing",
        },
      },
      -- trig
      "\\tikz-3d-guide",
    },
    fmt(
      [[
      % Guide
      \draw[-] (0,0,0) circle (.2);
      \draw[-, red  ] (1,0,0) circle (.2);
      \draw[-, green] (0,1,0) circle (.2);
      \draw[-, blue ] (0,0,1) circle (.2);
      ]],
      {}
    )
  ),
  --
  -- PGF
  --
  ms( -- PGF data
    {
      common = {
        desc = {
          "PGF data",
          "2D plot of fitted data with regression",
        },
      },
      -- trig
      "\\pgfplot-data",
    },
    fmt(
      [[
      \begin{center}
      \tikzset{external/remake next=true}
      % \pgfplotsset{height=7cm, width= .6\textwidth}
      \begin{tikzpicture}
      \begin{axis}
        [
          set layers, mark layer={axis tick labels}, % regression on top
          % xmajorgrids = true,
          % legend pos  = north west
          % domain=0:4,
          xlabel={\(x\)},
          ylabel={\(y\)},
        ]
        % % Legends
        % \addlegendimage{empty legend}
        % \addlegendentry[Graph]{\(y=\num{a}\,x+\num{b}\)}
        % \addlegendimage{empty legend}
        % \addlegendentry[Graph]{\(R^2=\num{}\)}

        % Plot from file
        \addplot[mark=*,draw=none]
        table{graph.dat};

        % line regression
        \addplot[
          draw=GraphC,thick,
          domain={0:0.3},
        ]{a*x+b};

      \end{axis}
      \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- PGF 2D Axes
    {
      common = {
        desc = {
          "PGF 2D Axes",
          "2D Axes for pgf plots",
        },
      },
      -- trig
      "\\pgf-axes-2d",
    },
    fmt(
      [[
      % Axes 2D
      \draw[-\stealth] (-0.5,0) -- (1,0) node[pos=1.1]{\(x\)};
      \draw[-\stealth] (0,-0.5) -- (0,1) node[pos=1.1]{\(y\)};
      ]],
      {}
    )
  ),
  ms( -- PGF 3D Axes
    {
      common = {
        desc = {
          "PGF 3D Axes",
          "Simple 3D Axes for pgf plots",
        },
      },
      -- trig
      "\\pgf-axes-3d",
    },
    fmt(
      [[
      % Axes 3D
      \draw[-\stealth] (-0.5,0,0) -- (1,0,0) node[pos=1.1]{\(x\)};
      \draw[-\stealth] (0,-0.5,0) -- (0,1,0) node[pos=1.1]{\(y\)};
      \draw[-\stealth] (0,0,-0.5) -- (0,0,1) node[pos=1.1]{\(z\)};
      ]],
      {}
    )
  ),
  ms( -- PGFplot math 2D
    {
      common = {
        desc = {
          "PGFplot math 2D",
          "Plot 2D graph for math (with fillbetween)",
        },
      },
      -- trig
      "\\pgfplot-math-2d",
    },
    fmt(
      [[
      \begin{center}
        \tikzset{external/remake next=true}
        % \pgfplotsset{height=7cm, width= .6\textwidth}
        \begin{tikzpicture}
        \begin{axis}
          [
            % xmajorgrids = true,
            legend pos={south east},
            % domain=0:4,
            % xlabel={},
            % ylabel={},
            axis lines={center}, % left|right|center|box,
          ]
          % Legends
          % \addlegendimage{empty legend}
          % \addlegendentry[Graph]{\(
          %   {\color{Graph}x}
          %   {\color{GraphC}x^2}
          % \)}

          % Plot from equation
          \addplot[
            name path={A},
            smooth,
            thick,
            Graph,
            domain  = 0:1.1,
            samples = \mysampledensitySimple,
          ]{ x };
          % Plot from equation
          \addplot[
            name path={B},
            smooth,
            thick,
            GraphC,
            domain  = 0:1.1,
            samples = \\mysampledensitySimple,
          ]{ x^2 };

          % ================ fillbetween =============== %
          \addplot [
            fill opacity=0.1,
            foreground
          ] fill between [
            of={A and B},
            soft clip={domain={0:1}}
          ];

        \end{axis}
        \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- PGFplot 2D simple
    {
      common = {
        desc = {
          "PGFplot 2D simple",
          "Plot 2D graph (Simple settings)",
        },
      },
      -- trig
      "\\pgfplot-2d-simple",
      "\\BPGFPlot2D-simple",
    },
    fmt(
      [[
      \begin{center}
        \tikzset{external/remake next=true}
        % \pgfplotsset{height=7cm, width= .6\textwidth}
        \begin{tikzpicture}
        \begin{axis}
          [
            % xmajorgrids = true,
            % legend pos  = north west
            % domain=0:4,
            % xlabel={},
            % ylabel={},
          ]
          % Legends
          % \addlegendimage{empty legend}
          % \addlegendentry[Red]{\( x \)}

          % % Plot from csv file
          % \addplot[smooth, thick, mark=*] % mesh for colormap
          % table[
          %   col sep=comma,  % csv: comma,
          %   header=true,
          %   x index=3,      % x column on file
          %   y index=4,      % y column on file
          %   point meta=x,   % value to colormap
          % ]{  file.csv };

          % % Plot from equation
          % \addplot[
          %   smooth,
          %   thick,
          %   % Graph,
          %   domain  = -2:2,
          %   samples = \mysampledensityDouble,
          % ]{ x };

        \end{axis}
        \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- PGFplot 2D full
    {
      common = {
        desc = {
          "PGFplot 2D full",
          "Plot 2D graph (Full settings)",
        },
      },
      -- trig
      "\\pgfplot-2d-full",
      "\\BPGFPlot2D-full",
    },
    fmt(
      [[
      \begin{center}
        %\pgfplotsset{height=7cm, width= .6\textwidth}
        \begin{tikzpicture}
        \begin{axis}
          [
            % extra x ticks= { 0.5 },
            % extra y ticks= { 0.236798 },
            % Number formating
            x tick label style={
              /pgf/number format/.cd,
                fixed,
                fixed zerofill,
                precision=3,
              /tikz/.cd
            },
            y tick label style={
              /pgf/number format/.cd,
                fixed,
                fixed zerofill,
                precision=3,
              /tikz/.cd
            },
            % Label titles
            xlabel= {X\textsubscript{Cu}},
            ylabel= {Absorvância corrigida},
            % MIN/MAX
            % xmin= 250,    xmax= 1100,
            % ymin= 0,        ymax= ,
            % Ticks
            % minor x tick num= 3,
            minor x tick num= 1,
            % Grids Major
            xmajorgrids= true,
            ymajorgrids= false,
            % Grids Minor
            % xminorgrids= false,
            % yminorgrids= false,
          ]

          % Legends
          % \addlegendimage{empty legend}
          % \addlegendentry[LegendColor\Light]{  }

          % % Plot from csv file
          % \addplot[smooth, thick, mark=*] % mesh for colormap
          % table[
          %   col sep=comma,  % csv: comma,
          %   header=true,
          %   x index=3,      % x column on file
          %   y index=4,      % y column on file
          %   point meta=x,   % value to colormap
          % ]{  file.csv };

          % % Plot from equation
          % \addplot[
          %   smooth,
          %   thick,
          %   % Red,
          %   domain  = -2:2,
          %   samples = 0.4*\mysampledensity,
          % ]{  x };

        \end{axis}
        \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- PGFplot 3D
    {
      common = {
        desc = {
          "PGFplot 3D",
          "Plot 3D graph (Simple settings)",
        },
      },
      -- trig
      "\\pgfplot-3d-simple",
      "\\BPGFPlot3D-simple",
    },
    fmt(
      [[
      \begin{center}
        % \pgfplotsset{height=0.3\pageheight, width= .95\textwidth}

        % \tikzset{external/remake next=true}
        \begin{tikzpicture}
          \begin{axis}
          [
            z buffer = {sort}, % default|none|auto|sort|reverse x seq|reverse y seq|reverse xy seq
            % xlabel={\(x\)}, ylabel={\(y\)}, zlabel={\(z\)}
            % xmajorgrids = true,
            % legend pos  = north west,
            % 3d view,
            % perspective,
            % view = {10}{10}, % rot/elevation
            hide axis,
            % axis lines = {center}, % 3D center/box/left/right
            % axis on top,
            % ticks = {none} % minor/major/both/none,
          ]
            % Legends
            % \addlegendimage{empty legend}
            % \addlegendentry[Red]{\( x \)}

            % Conical surface
            \addplot3 [
              % Aparence
              surf,
              opacity      = 0.5,
              fill opacity = 1,
              faceted color = White,
              shader = faceted interp,
              % Scope
              data cs = cart, % cart/polar/polarrad
              samples = \mysampledensitySimple,
              % Variable
              % variable   = z,
              % variable y = z,
              % domain   = -1:1,
              % domain y = -1:1,
            ]{
              sqrt(x^2+y^2)
            };

          \end{axis}
        \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  -- Tables
  ms( -- table/multirow
    {
      common = {
        desc = {
          "table/multirow",
          "\\multirow[⟨vpos⟩]{⟨nrows⟩}[⟨bigstruts⟩]{⟨width⟩}[⟨vmove⟩]{⟨text⟩}",
        },
      },
      -- trig
      "\\multirow",
    },
    fmt(
      [[
      \multirow[<vpos>]{<nrows>}{<width>}{<text>}
      ]],
      {
        vpos = i(3, "vpos"),
        nrows = i(1, "nrows"),
        width = i(2, "*"),
        text = i(0, "text"),
      }
    )
  ),
  ms( -- table setup
    {
      common = {
        desc = { "Setup table width and lenght" },
      },
      -- trig
      "\\tablesetup",
    },
    fmt(
      [[
      % \setlength\tabcolsep{6mm}        % width
    \renewcommand\arraystretch{<height>} % height
      ]],
      {
        height = i(1, "1.25"),
      }
    )
  ),
  -- minipages
  ms( -- Minipage environment
    {
      common = {
        desc = { "Minipage environment" },
      },
      -- trig
      "\\minipage",
    },
    fmt(
      [[
      \begin{minipage}{<width>\textwidth}
      <content>
    \end{minipage}
      ]],
      { width = i(1, "1"), content = i(0, "content") }
    )
  ),
  -- Biology
  ms( -- DNAblock
    {
      common = {
        desc = {
          "DNAblock",
          "renew command \\DNAblock from mydnaseq",
        },
      },
      -- trig
      "\\DNAblock",
    },
    fmt(
      [[
      \renewcommand\DNAblock{<count>}
      ]],
      { count = i(1, "5") }
    )
  ),
  -- Graphics and images
  ms( -- Figure Environment
    {
      common = {
        desc = { "Figure Template" },
      },
      -- trig
      "\\figure",
      "\\begin{figure}",
    },
    fmt(
      [[
      \begin{figure}\centering
      \includegraphics[width=<width>\textwidth]{<path>}
      \end{figure}
      ]],
      {
        width = i(1, ".8"),
        path = i(2, "path"),
      }
    )
  ),
  ms( -- includegraphics
    {
      common = {
        desc = { "Include a simple graphic centered" },
      },
      -- trig
      "\\includegraphics",
    },
    fmt(
      [[
      \begin{center}
        \includegraphics[width=<width>\textwidth]{<path>}
    \end{center}
      ]],
      {
        width = i(1, ".8"),
        path = i(2, "path"),
      }
    )
  ),
  ms( -- geometry default
    {
      common = {
        desc = { "geometry: default settings" },
      },
      -- trig
      "\\geometry",
    },
    fmt(
      [[
      \geometry{
      top       = 21mm,
      bottom    = 21mm,
      left      = .06\paperwidth,
      right     = .06\paperwidth,
      portrait  = true,
      noheader, nofoot,
    }
      ]],
      {}
    )
  ),
  ms( -- sisetup default
    {
      common = {
        desc = { "Sisetup: set default settings" },
      },
      -- trig
      "\\sisetup",
    },
    fmt(
      [[
      \sisetup{
      % input / scientific / engineering / input / fixed
      exponent-mode={input},
      % exponent-to-prefix={false}, % 1000 g ->> 1 kg
      % exponent-product={*}, % x * 10^y
      % fixed-exponent={0},
      % round-mode={places}, % figures/places/unsertanty/none
      round-precision={2},
    % round-minimum={0.01}, % <<x =>> 0
      % output-exponent-marker={\,\mathrm{E}},
    }
      ]],
      {}
    )
  ),
  --
  -- MY ENVIRONMENTS
  --
  ms( -- Section shortcut 2
    {
      common = {
        desc = { "shortcut for Section 2" },
      },
      -- trig
      "\\ssection",
    },
    fmt(
      [[
      \subsection{<>}
      ]],
      { i(1) }
    )
  ),
  ms( -- Section shortcut 3
    {
      common = {
        desc = { "shortcut for Section 3" },
      },
      -- trig
      "\\sssection",
    },
    fmt(
      [[
      \subsubsection{<>}
      ]],
      { i(1) }
    )
  ),
  ms( -- Question shortcut 1
    {
      common = {
        desc = { "shortcut for question 2" },
      },
      -- trig
      "\\squestion",
    },
    fmt(
      [[
      \subquestion{<>}
      ]],
      { i(1) }
    )
  ),
  ms( -- Question shortcut 3
    {
      common = {
        desc = { "shortcut for question 3" },
      },
      -- trig
      "\\ssquestion",
    },
    fmt(
      [[
      \subsubquestion{<>}
      ]],
      { i(1) }
    )
  ),
  ms( -- Example shortcut 1
    {
      common = {
        desc = { "shortcut for example 2" },
      },
      -- trig
      "\\sexample",
    },
    fmt(
      [[
      \subexample{<>}
      ]],
      { i(1) }
    )
  ),
  ms( -- Example shortcut 3
    {
      common = {
        desc = { "shortcut for example 3" },
      },
      -- trig
      "\\ssexample",
    },
    fmt(
      [[
      \subsubexample{<>}
      ]],
      { i(1) }
    )
  ),
  --
  -- Boxes
  --
  ms( -- Question Box environment
    {
      common = {
        desc = { "questionBox environment" },
      },
      -- trig
      "\\questionBox",
      "\\begin{questionBox}",
      "\\BQB",
    },
    fmt(
      [[
      \begin{questionBox}<opts>{ % MARK:Q<index>
        <title>
      } % Q<index>
      <body>
      \end{questionBox}
    ]],
      -- INFO:test
      {
        opts = i(1, "opts"),
        index = i(2, "index"),
        title = i(3, "question"),
        body = i(4, "body"),
      }
    )
  ),
  ms( -- Proposition Box environment
    {
      common = {
        desc = { "propositionBox environment" },
      },
      -- trig
      "\\propositionBox",
      "\\begin{propositionBox}",
      "\\BPB",
    },
    fmt(
      [[
    \begin{propositionBox}<opts>{<title>} % PROP<index>
        <body>
    \end{propositionBox}
      ]],
      {
        opts = i(1, "opts"),
        index = i(2, "index"),
        title = i(3, "title"),
        body = i(4, "body"),
      }
    )
  ),
  ms( -- Answer Box environment
    {
      common = {
        desc = {
          "answerBox environment",
        },
      },
      -- trig
      "\\answerBox",
      "\\begin{answerBox}",
      -- "\\BAB",
      "\\BANS",
      -- "\\BRES",
    },
    fmt(
      [[
      \begin{answerBox}<opts>{<title>} % RS<index>
      <body>
    \end{answerBox}
      ]],
      {
        opts = i(1, "opts"),
        index = i(2, "index"),
        title = i(3, "question"),
        body = i(4, "body"),
      }
    )
  ),
  ms( -- Definition Box environment
    {
      common = {
        desc = { "definitionBox environment" },
      },
      -- trig
      "\\definitionBox",
      "\\begin{definitionBox}",
      "BDEFB",
    },
    fmt(
      [[
      \begin{definitionBox}<opts>{<title>} % DEF<index>
      <body>
    \end{definitionBox}
      ]],
      {
        opts = i(1, "opts"),
        index = i(2, "index"),
        title = i(3, "question"),
        body = i(4, "body"),
      }
    )
  ),
  ms( -- Example Box environment
    {
      common = {
        desc = {
          "exampleBox environment",
        },
      },
      -- trig
      "\\exampleBox",
      "\\begin{exampleBox}",
      "\\BEB",
    },
    fmt(
      [[
      \begin{exampleBox}<opts>{ % E<index>
        <title>
    } % E<index>
        <body>
    \end{exampleBox}
      ]],
      {
        opts = i(1, "opts"),
        index = i(2, "index"),
        title = i(3, "question"),
        body = i(4, "body"),
      }
    )
  ),
  ms( -- sectionBox environment
    {
      common = {
        desc = {
          "sectionBox environment",
        },
      },
      -- trig
      "\\sectionBox",
      "\\begin{sectionBox}",
      "\\BSB",
    },
    fmt(
      [[
      \begin{sectionBox}<opts>{<title>} % S<index>
        <body>
    \end{sectionBox}
      ]],
      {
        opts = i(1, "opts"),
        index = i(2, "index"),
        title = i(3, "question"),
        body = i(4, "body"),
      }
    )
  ),
  --
  -- Lists
  --
  ms( -- description environment
    {
      common = {
        desc = {
          "description environment",
        },
      },
      -- trig
      "\\description",
      "\\begin{description}",
      "\\BDES",
    },
    fmt(
      [[
      \begin{description}[
        leftmargin=!,
        labelwidth=\widthof{} % Longest item
    ]
        \item[<name>] <desc>
    \end{description}
      ]],
      {
        name = i(1, "name"),
        desc = i(2, "desc"),
      }
    )
  ),
  ms( -- enumerate environment
    {
      common = {
        desc = {
          "enumerate environment",
        },
      },
      -- trig
      "\\begin{enumerate}",
      "\\Benumerate",
      "\\BEN",
    },
    fmt(
      [[
      \begin{enumerate}<d1><options><d2>
        \item <body>
      \end{enumerate}
      ]],
      {
        options = i(1, "label=\\arabic{enumi}"),
        body = i(2, "body"),
        d1 = ne(1, "["),
        d2 = ne(1, "]"),
      }
    )
  ),
  ms( -- itemize environment
    {
      common = {
        desc = {
          "itemize environment",
        },
      },
      -- trig
      "\\begin{itemize}",
      "\\Bitemize",
      "\\BIT",
    },
    fmt(
      [[
      \begin{itemize}
        \item <>
      \end{itemize}
      ]],
      { i(1) }
    )
  ),
  ms( -- multicols environment
    {
      common = {
        desc = {
          "multicols environment",
        },
      },
      -- trig
      "\\begin{multicols}",
      "\\BMC",
    },
    fmt(
      [[
      \begin{multicols}{<col>}
        <body>
      \end{multicols}
      ]],
      {
        col = i(1, "2"),
        body = i(2, "body"),
      }
    )
  ),
  ms( -- Table environment
    {
      common = {
        desc = {
          "Table environment",
        },
      },
      -- trig
      "\\BTBL",
      "\\table",
      "\\begin{table}",
    },
    fmt(
      [[
      \begin{center}
        \vspace{1ex}
        \begin{tabular}{<col>}
          \toprule

            \multicolumn{1}{c}{<title>}

          \\\midrule

            <body>

          \\\bottomrule
        \end{tabular}
        \vspace{2ex}
      \end{center}
      ]],
      {
        col = i(1, "columns"),
        title = i(2, "title"),
        body = i(3, "body"),
      }
    )
  ),
  --
  -- Code
  --
  ms( -- indexer
    {
      common = {
        desc = {
          "indexer",
          "input some files using luacode",
        },
      },
      -- trig
      "\\indexer",
    },
    fmt(
      [[
      % print files
      \begin{luacode*}
        -- Files Directory
        dir = ""
        -- Prefix and sufix
        prefix = ""
        sufix  = ""
        -- Files
        files = {
            -- 1, --
        }
        -- Print some files
        index = {1}
        -- Loop
        -- for v,i in ipairs(index) -- Generic some
        -- for i,v in ipairs(files) -- Generic all

        for i,v in ipairs(files) -- Generic all
        do
          tex.print(string.split(table.concat{
          \[\[
            \input{\]\], dir, prefix, files\[i\], sufix, \[\[}\newpage
          \]\]
          },\"\n\"))
        end
      \end{luacode*}
      ]],
      {}
    )
  ),
  ms( -- Minted environment
    {
      common = {
        desc = {
          "Minted environment",
          "Minted environment for code",
        },
      },
      -- trig
      "\\BMNT",
      "\\begin{minted}",
    },
    fmt(
      [[
      \begin{listing}[H]
        \begin{tcolorbox}[left= 2.5em]
        \begin{minted}[linenos]{<lang>}

        print("Hello, World!")

        \end{minted}
        \end{tcolorbox}
        \caption{hello world}
      \end{listing}
      ]],
      {
        lang = i(1, "python"),
      }
    )
  ),
  --
  -- chem
  --
  -- chemfig
  ms( -- chemfig shortcut
    {
      common = {
        desc = { "shortcut for centered chemfig" },
      },
      -- trig
      "\\chemfig",
    },
    fmt(
      [[
      <center_b><center>
        \chemfig[angle increment=<ang>]{
          <body>
        }
      <center_e><center>
      ]],
      {
        center = c(1, { t("{center}"), t("") }),
        center_b = ne(1, "\\begin"),
        center_e = ne(1, "\\end"),
        ang = i(2, "30"),
        body = i(3, "body"),
      }
    )
  ),
  ms( -- Chemfig-butano
    {
      common = {
        desc = {
          "Chemfig-butano",
          "cadeia de 4 carbonos",
        },
      },
      -- trig
      "\\chemfig-butano",
    },
    fmt(
      [[
      C(-[5]H)(-[-3]H)
      -[ 1]C(-[ 3]H)
      -[-1]C(-[-3]H)
      -[ 1]C(-[ 3]H)(-[-1]H)
      ]],
      {}
    )
  ),
  ms( -- Chemfig-tert-butano
    {
      common = {
        desc = {
          "Chemfig-tert-butano",
          "tetraedro de 5 carbonos",
        },
      },
      -- trig
      "\\chemfig-tert-butano",
      "\\chemfig-tetraedro",
    },
    fmt(
      [[
      C
      (-[  6]CH)
      (-[- 1]CH)
      (-[- 3]CH)
      (-[-10]CH)
      ]],
      {}
    )
  ),
  -- modiagram
  ms( -- modiagram environment
    {
      common = {
        desc = {
          "modiagram environment",
          "Molecular orbital diagram (CO)",
        },
      },
      -- trig
      "\\modiagram-template",
      "\\BMOD",
    },
    fmt(
      [[
      \begin{center}
        \begin{modiagram}
          \setlength\AtomVScale{0.1cm}
          // \setlength\MoleculeVScale{1.5cm}

          % C
          \AO(1cm){s}{-19.4\AtomVScale;}       % S2  AO1: -19.4
          \AO(1cm){s}{-10.6\AtomVScale;}       % P2x AO2: -10.6
          \AO(1cm){s}{-10.6\AtomVScale+1pt;}   % P2y AO3: -10.6
          \AO(1cm){s}{-10.6\AtomVScale-1pt;}   % P2z AO4: -10.6
          % \atom[C]{left}{
          %     2s = {-19.4\AtomVScale;},
          %     2p = {-10.6\AtomVScale;}
          % }

          % O
          \AO(5cm){s}{-32.3\AtomVScale;}       % S2  AO5: -32.3
          \AO(5cm){s}{-15.8\AtomVScale;}       % P2x AO6: -15.8
          \AO(5cm){s}{-15.8\AtomVScale+1pt;}   % P2y AO7: -15.8
          \AO(5cm){s}{-15.8\AtomVScale-1pt;}   % P2z AO8: -15.8
          % \atom[O]{right}{
          %     2s = {-32.3\AtomVScale;},
          %     2p = {-15.8\AtomVScale;}
          % }

          % CO
          % 2s
          \AO(3cm     ){s}{-29.075\AtomVScale -1.44528\MoleculeVScale; pair}   % SG3  AO9 : (-32.3) - ((-32.3)-(-19.4))/4 -1.44528
          \AO(3cm     ){s}{-22.625\AtomVScale -0.69683\MoleculeVScale; pair}   % SG4  AO10: (-19.4) + ((-32.3)-(-19.4))/4 -0.69683
          % 2p
          \AO(3cm-10pt){s}{-14.5\AtomVScale -0.53993\MoleculeVScale; pair}   % PI5  AO11: (-15.8) - (-15.8-(-10.6))/4 -0.53993
          \AO(3cm+10pt){s}{-14.5\AtomVScale -0.53993\MoleculeVScale; pair}   % PI6  AO12: (-15.8) - (-15.8-(-10.6))/4 -0.53993
          \AO(3cm     ){s}{-14.5\AtomVScale -0.44513\MoleculeVScale; pair}   % SG7  AO13: (-15.8) - (-15.8-(-10.6))/4 -0.44513
          \AO(3cm-10pt){s}{-11.9\AtomVScale +0.30615\MoleculeVScale; pair}   % PI8  AO14: (-10.6) + (-15.8-(-10.6))/4 +0.30615
          \AO(3cm+10pt){s}{-11.9\AtomVScale +0.30615\MoleculeVScale; pair}   % PI9  AO15: (-10.6) + (-15.8-(-10.6))/4 +0.30615
          \AO(3cm     ){s}{-11.9\AtomVScale +1.00913\MoleculeVScale; pair}   % SG10 AO16: (-10.6) + (-15.8-(-10.6))/4 +1.00913
          % \molecule[CO]{
          %     2sMO = {
          %         1.44528/-0.69683; pair
          %     },
          %     2pMO = {
          %         0.44513/1.00913,
          %         0.53993/0.30615;
          %         up, pair, pair
          %     }
          % }

          \connect{
            % left
            AO1  & AO9,
            AO1  & AO10,
            AO1  & AO11,
            AO1  & AO13,
            AO1  & AO14,
            AO1  & AO16,
            AO2  & AO9,
            AO2  & AO10,
            AO2  & AO11,
            AO2  & AO13,
            AO2  & AO14,
            AO2  & AO16,
            % right
            AO9  & AO5,
            AO10 & AO5,
            AO12 & AO5,
            AO13 & AO5,
            AO15 & AO5,
            AO16 & AO5,
            AO9  & AO6,
            AO10 & AO6,
            AO12 & AO6,
            AO13 & AO6,
            AO15 & AO6,
            AO16 & AO6,
          }

          \EnergyAxis[title=E, head=stealth]

        \end{modiagram}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- Chem Reaction table
    {
      common = {
        desc = {
          "Chem Reaction table",
          "Table for a chemical reaction",
        },
      },
      -- trig
      "\\Chemtable",
    },
    fmt(
      [[
      \begin{table}\[H\]\centering
        \begin{tabular}{c *{4}{l}}

          \toprule

          & \multicolumn{1}{c @{\,+}      }{\ch{HA}}
          & \multicolumn{1}{c @{\,\ch{<<>>}}}{\ch{OH^-}}
          & \multicolumn{1}{c @{\,+}      }{\ch{A^-}}
          & \multicolumn{1}{c             }{\ch{H2O}}

          \\\midrule

            \(t0\)
          & \(\ch{\[HA\]}_{t0}\)
          & \(x\)
          & \(0\)
          & --

          \\

            \(t1\)
          & \(\ch{\[HA\]}_{t0}-x\)
          & \(0\)
          & \(x\)
          & --

          \\\toprule

          & \multicolumn{1}{c @{\,+}      }{\ch{HA}}
          & \multicolumn{1}{c @{\,\ch{<<>>}}}{\ch{H2O}}
          & \multicolumn{1}{c @{\,+}      }{\ch{A^-}}
          & \multicolumn{1}{c             }{\ch{H3O^+}}

          \\\midrule

            t1
          & \(\ch{\[HA\]}_{t1}\)
          & --
          & \(\ch{\[A^-\]}_{t1}\)
          & \(0\)

          \\

            t2
          & \(\ch{\[HA\]}_{t1}-y\)
          & --
          & \(\ch{\[A^-\]}_{t1}+y\)
          & \(y\)

          \\\bottomrule

          \multicolumn{5}{r}{
            Concentrações(\unit{\molar}) para solução final
          }

        \end{tabular}
      \end{table}
      ]],
      {}
    )
  ),
  --
  -- Math
  --
  ms( -- quadratic formula
    {
      common = {
        desc = {
          "quadratic formula",
          "0=ax²+bx+c",
        },
      },
      -- trig
      "\\formula-quadratic",
    },
    fmt(
      [[
      x
      = \frac{
        - <b>
        \pm \sqrt{
          <b>^2
          -4\,<a>\,<c>
        }
      } {2\,<a>}
      ]],
      { a = i(1, "a"), b = i(2, "b"), c = i(3, "c") }
    )
  ),
  ms( -- underset
    {
      common = {
        desc = { "underset" },
      },
      -- trig
      "\\underset",
    },
    fmt(
      [[
      \underset{<under>}{<>}
      ]],
      {
        under = i(1, "under"),
        i(2, "="),
      }
    )
  ),
  -- s( -- math enclosing brackets
  --   {
  --     desc = { "math enclosing brackets" },
  --     trig = { "\\{" },
  --   },
  --   fmt([[
  --     \left\{
  --       <>
  --     \right\}
  --   ]],{i(1)})
  -- ),
  ms( -- flalign* environment
    {
      common = {
        desc = {
          "flalign* environment",
        },
      },
      -- trig
      "\\begin{flalign*}",
      "\\BFLA*",
    },
    fmt(
      [[
      \begin{flalign*}
        &
          <>
        &
      \end{flalign*}
      ]],
      { i(0) }
    )
  ),
  ms( -- boldmath environment
    {
      common = {
        desc = {
          "boldmath environment",
        },
      },
      -- trig
      "\\begin{BM}",
      "\\BBM",
    },
    fmt(
      [[
      \begin{BM}<d1><options><d2>
        <body>
      \end{BM}
      ]],
      {
        options = i(1, "options"),
        body = i(2, "body"),
        d1 = ne(1, "["),
        d2 = ne(1, "]"),
      }
    )
  ),
  --
  -- Constants
  --
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
  ),
  --
  -- TEMPLATES
  --
  ms( -- Main Template
    {
      common = {
        desc = { "Main Template" },
      },
      -- trig
      "\\latex-template-main",
    },
    fmt(
      [[
      % \documentclass{article}
      \documentclass[
        class=article,
        multi={minipage},
        border={3mm},
      ]{standalone}
      % -------------------------------------------------------- %
      %                          Colors                          %
      % -------------------------------------------------------- %
      \usepackage[hyperref]{xcolor} % Options: gray - dark and light
      \usepackage{mypallete}
      \colorlet{foreground}{light}
      \colorlet{background}{dark}
      % \usepackage{myGraphPallete} % Graph, GraphXY, GraphSplitX, GraphSplitCX
      % ================== Palette Secondaries ================= %
      \colorlet{Emph}       {DarkGreen!70!foreground}
      \colorlet{Link}      {LightGreen!25!foreground}
      \colorlet{Comment}   {foreground!60!background}
      \colorlet{Background}{foreground!27!background}
      % ======================= setcolor ======================= %
      \pagecolor{background}
      \color    {foreground}
      % -------------------------------------------------------- %
      %                        Essentials                        %
      % -------------------------------------------------------- %
      \usepackage{luacode}
      \usepackage{xparse} % xparse - multiple optional arguments
      \usepackage{calc}
      % % -------------------------------------------------------- %
      % %                         Geometry                         %
      % % -------------------------------------------------------- %
      \setlength\textwidth{160mm}
      % \usepackage{geometry}
      % \geometry{
      %   % papersize = {300mm, 400mm}, % ( 4:3 ) SVGA x 0.5
      %   % papersize = {240mm, 320mm}, % ( 4:3 ) SVGA x 0.4
      %   % papersize = {120mm, 640mm}, % ( 2*4:3/2 )
      %   % papersize = {180mm, 240mm}, % ( 4:3 ) SVGA x 0.3
      %   % papersize = {229mm, 305mm}, % ( 4:3 ) ArchA/Arch1
      %   % papersize = {320mm, 512mm}, % (16:10)
      %   % papersize = {280mm, 448mm}, % (16:10)
      %   % papersize = {240mm, 384mm}, % (16:10)
      %   % a4paper,  % {210mm, 297mm}, % (√2:1 ) A4
      %   papersize = {180mm, 1m}, % LONG ( 4:3 ) SVGA x 0.3
      %   top       = 21mm,
      %   bottom    = 21mm,
      %   left      = .06\paperwidth,
      %   right     = .06\paperwidth,
      %   portrait  = true,
      % }
      % -------------------------------------------------------- %
      %                           Fonts                          %
      % -------------------------------------------------------- %
      \usepackage[fontsize=12pt]{fontsize}
      \usepackage[T1]{fontenc}
      \usepackage{fontspec}
      % \usepackage[sfdefault, ultralight]{FiraSans}
      % \renewcommand{\familydefault}{\sfdefault} % set sans serif as defalt
      % Redeclare emph
      \let\emph\relax
      \DeclareTextFontCommand{\emph}{\bfseries\color{Emph}}
      % % ==================== Set font family =================== %
      \setmainfont[
        Ligatures = TeX,
        UprightFont    = *-Light,
        ItalicFont     = *-LightIt,
        SmallCapsFont  = *SmText-Light,
        BoldFont       = *-Regular,
        BoldItalicFont = *-It
      ]{
        % ==================== Serif fonts =================== %
        SourceSerif4
        % ================= Handwritten fonts ================ %
        % DancingScript
        % Apple Chancery
        % Luminari
        % PetitFormalScript
        % Merienda
        % LaBelleAurore
        % Handlee
          % BadScript
          % Calligraffitti
      }
      % % ======================= Monofont ======================= %
      % \setmonofont[Contextuals = {ligatures}]{FiraCode}
      % \makeatletter
      % \def\verbatim@nolig@list{}
      % \makeatother
      % -------------------------------------------------------- %
      %                         Linguagem                        %
      % -------------------------------------------------------- %
      \usepackage[portuguese]{babel} % Babel
      %\usepackage{polyglossia}      % Polyglossia
      %\setdefaultlanguage[variant=brazilian]{portuguese}
      % % -------------------------------------------------------- %
      % %                         Graphics                         %
      % % -------------------------------------------------------- %
      % \usepackage[draft, final]{graphics, graphicx}
      % \usepackage{graphicx}
      % \graphicspath{{./.build/figures}}
      % -------------------------------------------------------- %
      %                tocloft - Table of contents               %
      % -------------------------------------------------------- %
      \usepackage{tocloft}
      \setcounter{tocdepth}{1}    % remove subsubsection from toc
      % ========================= part ========================= %
      \renewcommand\cftpartfont{\bfseries}
      %\renewcommand\cftpartafterpnum{\vspace{0mm}}
      \setlength\cftbeforepartskip{1ex}
      % ========================== sec ========================= %
      \renewcommand\cftsecfont{} % Font
      \renewcommand\cftsecpagefont{} % page number font
      \renewcommand\cftsecleader{\cftdotfill{\cftdotsep}} % Dots
      \setlength\cftbeforesecskip{0.5ex}
      \setlength\cftsecindent{0mm}
      %\setlength{\cftsecnumwidth}{25mm} % Fix section width
      % ======================== subsec ======================== %
      \setlength\cftsubsecindent{0mm}
      %\setlength{\cftsubsecnumwidth}{15mm}
      % ====================== tab (table) ===================== %
      \setlength\cfttabindent{0mm}
      % % -------------------------------------------------------- %
      % %                       filecontents                       %
      % % -------------------------------------------------------- %
      %\usepackage{scontents}     % the better filecontents
      %\usepackage{filecontents}  % Create files
      % % -------------------------------------------------------- %
      % %                         Multicols                        %
      % % -------------------------------------------------------- %
      \usepackage{multicol}
      \setlength{\columnsep}{.05\textwidth}
      \multicoltolerance = 200
      % \renewenvironment{multicols}[1]{}{\relax} % toggle multicols  on/off
      % -------------------------------------------------------- %
      %                         enumitem                         %
      % -------------------------------------------------------- %
      \usepackage{enumitem}  % modify enumerate index
      \setlist[description]{
        format={\color{Emph}}
      }
      % -------------------------------------------------------- %
      %                         titlesec                         %
      % -------------------------------------------------------- %
      \usepackage{titlesec}
      % ================= Reset section on part ================ %
      \counterwithin*{section}{part}
      % ======================== Spacing ======================= %
      % \titlespacing*{<<left>>}{<<before>>}{<<after>>}[<<right>>]
      \titlespacing*{\part}      {0pt}{ 0pt}{0pt}
      \titlespacing*{\section}   {0pt}{10mm}{0pt}
      \titlespacing*{\subsection}{0pt}{ 5mm}{0pt}
      % ================== Part customization ================== %
      \titleclass\part{straight}
      \titleformat\part
      [block] % shape
      {%
        \begin{minipage}{\textwidth}%
        \centering\Large\bfseries\color{Emph}%
        {\titlerule[1pt]}\vspace{3pt}%
      } % format
      {%
        \thepart\hspace{.5em}{--}
      } % label
      % {\thepart} % label without --
      {.5em} % sep
      {} % before-code
      [\vspace{2pt}{\titlerule[1pt]}\end{minipage}] % after  code
      % % ================= Chapter customization ================ %
      % \titleclass{\chapter}{straight}
      % \titleformat{\chapter}
      %    [block]                         % shape
      %    {\huge\bfseries\color{Emph}}    % format
      %    {\thepart\hspace{5mm}{\(|\)}}   % label
      %    {5mm}                           % sep
      %    {\huge\bfseries}                % before-code
      %    [\vspace{0.5mm}]                % after-code
      % % -------------------------------------------------------- %
      % %                         Appendix                         %
      % % -------------------------------------------------------- %
      % \usepackage{appendix}
      % % -------------------------------------------------------- %
      % %                     siunix: SI units                     %
      % % -------------------------------------------------------- %
      % \usepackage{siunitx,mysiunitx}
      % % -------------------------------------------------------- %
      % %                           Maths                          %
      % % -------------------------------------------------------- %
      \usepackage{amsmath, amssymb, bm}
      % \usepackage{derivative} % Derivative
      % \DeclareDifferential{\gdif}{\nabla} % Gradient
      % \usepackage{mathrsfs}   % more symbols \mathscr{} (Hamiltonian)
      % % ====================== Math fonts ====================== %
      % \usepackage[math-style=ISO]{unicode-math} % change math font
      % \usepackage{firamath-otf}
      % % ======================================================== %
      \usepackage{mathtools}
      % \DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
      % \DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
      % % ======================================================== %
      % % ============== MathOperators Declarations ============== %
      % \newcommand\E[1]{\,\mathrm{E}^{#1}}
      % \newcommand\e[1]{\,\mathrm{e}^{#1}}
      % % ========= Missing trigonometric math operators ========= %
      % \DeclareMathOperator\sech   {sech}
      % \DeclareMathOperator\csch   {csch}
      % \DeclareMathOperator\arcsec {arcsec}
      % \DeclareMathOperator\arccot {arccot}
      % \DeclareMathOperator\arccsc {arccsc}
      % \DeclareMathOperator\arccosh{arccosh}
      % \DeclareMathOperator\arcsinh{arcsinh}
      % % ================== Calculus operators ================== %
      % \DeclareMathOperator\fronteira {fr}
      % \DeclareMathOperator\interior  {int}
      % \DeclareMathOperator\exterior  {ext}
      % \DeclareMathOperator\grafico   {Graf}
      % \DeclareMathOperator\dominio   {D}
      % \DeclareMathOperator\visinhanca{\mathcal{V}}
      % % =================== Algebra operators ================== %
      % \DeclareMathOperator\adj{adj}
      % \DeclareMathOperator\id{id}
      % \DeclareMathOperator\Img{Im}
      % \DeclareMathOperator\Nuc{Nuc}
      % \DeclareMathOperator\Ker{Ker}
      % % ================== Statistics Operator ================= %
      % \DeclareMathOperator\esperanca{E}
      % \DeclareMathOperator\variancia{V}
      % \DeclareMathOperator\bernoulli{Ber}
      % \DeclareMathOperator\hiperbolica{H}
      % \DeclareMathOperator\binomial{Bin}
      % \DeclareMathOperator\poisson{P}
      % \DeclareMathOperator\normal{N}
      % % ======================================================== %
      % % ======================================================== %
      % =================== My math functions ================== %
      \usepackage{mathBM}
      \usepackage{myLogicOperators}
      % \lxor, \lnand
      % \ldiv
      % [<<*>>line break]
      % [<<l>>left column]
      % [<<r>>right column]
      % [<<division>>]
      % [<<space>>]
      % [<<beforecolumn>>]
      \usepackage{mathEnclosings}
      % \myvert[*scale]{<<content>>}
      % \myVert[*scale]{<<content>>}
      % \myrange[<<*>>invert all][<<l>>invert left][<<r>>invert right]{<<content>>}
      % % -------------------------------------------------------- %
      % %                          Vectors                         %
      % % -------------------------------------------------------- %
      % \usepackage{esvect}      % Vector over-arrow
      % \NewCommandCopy\vec\vv
      % % -------------------------------------------------------- %
      % %                           Tikz                           %
      % % -------------------------------------------------------- %
      % \usepackage{tikz}\usetikzlibrary{babel}
      % \usetikzlibrary{
      %     % perspective,
      %     % 3d,
      % }
      % % ===================== External lib ===================== %
      % \usepackage{tikz-external-setup}
      % \tikzexternalize[
      %     up to date check={simple}, % faster check
      %     figure list={true}, % generate list of figures file
      %     prefix={./.build/figures/graphics/}
      % ] % turn externalization on/off
      % % Fix background
      % \NewCommandCopy\oldtikzpicture\tikzpicture
      % \RenewDocumentCommand\tikzpicture{O{}}{\oldtikzpicture[#1]\nopagecolor}
      % % ==================== Other packages ==================== %
      % \usepackage{myTikzGraphs} % For graphs
      % \usepackage{varwidth}   % List inside TikzPicture
      % % -------------------------------------------------------- %
      % %                            pgf                           %
      % % -------------------------------------------------------- %
      % \usepackage{pgf,pgfmath,pgfplots}
      % \usepackage{pgfplotstable}
      % \usepgfplotslibrary{fillbetween}
      % % ========================= Setup ======================== %
      % % 1e4 too much
      % % 1e3 fancy
      % % 1e2 simple
      % % 1e1 draft
      % \newcommand\mysampledensityDouble{2}
      % \newcommand\mysampledensitySimple{1e1}
      % \newcommand\mysampledensityFancy{1e2}
      % \usepackage{myPGFSetup}
      % % -------------------------------------------------------- %
      % %                          Tables                          %
      % % -------------------------------------------------------- %
      % \setlength\tabcolsep{6mm}        % width
      % \renewcommand\arraystretch{1.25} % height
      % \usepackage{colortbl} % Colored Cells
      % % ==================== Color commands ==================== %
      % \newcommand\cellT[1]{\cellcolor{green!70!grey!20!background}{#1}}
      % \newcommand\cellF[1]{\cellcolor{red!70!grey!20!background}{#1}}
      % \newcommand\cellemph[1]{\cellcolor{Emph!20!background}{#1}}
      % \usepackage{multirow}
      % \usepackage{longtable}
      % \usepackage{float}\restylefloat{table}  % table position H(ere)
      % % ======================= booktabs ======================= %
      % \usepackage{booktabs}
      % \setlength\heavyrulewidth{.75pt} % Top and bottom rule
      % \setlength\lightrulewidth{.30pt} % Middle rule
      % % ======================= Mathtable ====================== %
      % \usepackage{array} % for \newcolumntype macro
      % \newcolumntype{C}{>>{$}c<<{$}} % math-mode version of c column type
      % \newcolumntype{L}{>>{$}l<<{$}} % math-mode version of l column type
      % \newcolumntype{R}{>>{$}r<<{$}} % math-mode version of r column type
      % % ===================== Table Caption ==================== %
      % \newcounter{tablecounter}
      % % \newcommand\thetable{Tabela \arabic{tablecounter}:}
      % \NewDocumentCommand\tablecaption{o m}{
      %   \stepcounter{table}
      %   Tabela \thetable{}: #2
      %   \ifblank{#2}{}{\label{table:#1}}
      %   \addcontentsline{lot}{table}{Tabela \thetable{}: #2}
      % }
      % % -------------------------------------------------------- %
      % %                           Chem                           %
      % % -------------------------------------------------------- %
      % \usepackage{chemformula} % formulas quimicas
      % \usepackage{chemfig}     % Estruturas quimicas
      % \usepackage{modiagram}   % Molecular orbital diagram
      % % ======================= modiagram ====================== %
      % \setmodiagram {
      %   names,           % Display names
      %   labels,          % Display labels
      %   labels-fs=\tiny, % label font
      % }
      % \newlength\AtomVScale    \setlength\AtomVScale{1cm}
      % \newlength\MoleculeVScale\setlength\MoleculeVScale{1cm}
      % % ====================== chemmacros ====================== %
      % \usepackage{chemmacros}
      % \chemsetup[phases]{pos=sub}
      % \newcommand{\mol}[1]{ \unit{\mole\of{\ch{ #1 }}} } % mol
      % % -------------------------------------------------------- %
      % %                          Biology                         %
      % % -------------------------------------------------------- %
      % \usepackage{mydnaseq}
      % % -------------------------------------------------------- %
      % %                           Code                           %
      % % -------------------------------------------------------- %
      % % Run on terminal: lualatex --shell-escape \[file\[.tex\]\]
      % \usepackage{shellesc, minted}
      % \setminted {
      %   linenos,     % line number
      %   autogobble,  % line trim
      %   tabsize = 4, % tab size
      %   obeytabs,    % tab alignment
      %   breaklines,  % break lines
      %   % python3,     % Python lexer or idk
      % }
      % \usemintedstyle{stata-dark}
      % % \usemintedstyle{fruity}
      % % \usemintedstyle{paraiso}
      % % \usemintedstyle{rainbow_dash}
      % % \usemintedstyle{solarized-dark}
      % % \usemintedstyle{native}
      % % -------------------------------------------------------- %
      % %                         tcolorbox                        %
      % % -------------------------------------------------------- %
      \usepackage{mytcolorbox}
      \tcbuselibrary{
        breakable,                % allow page break
        % minted, xparse, listings, % code minted
      }
      % % -------------------------------------------------------- %
      % %                         Metadata                         %
      % % -------------------------------------------------------- %
      \newcommand\mytitle   {{title here}}
      \newcommand\myauthor  {{Felipe B. Pinto 61387 -- MIEQB}}
      \newcommand\mycreator {{Felipe B. Pinto}}
      \newcommand\mysubject {{subject here}}
      \newcommand\mykeywords{{{Keywords}}}
      % ================ title, author and date ================ %
      \title{\huge\bfseries\color{Emph}\mytitle}
      \author{\Large\myauthor}
      \date{\Large\today}
      % % -------------------------------------------------------- %
      % %                         fancyhdr                         %
      % % -------------------------------------------------------- %
      % \usepackage{fancyhdr}
      % \pagestyle{fancy}
      % \fancyhf{} % Clear
      % \fancyhead[R]{\normalsize\thepart}
      % \fancyfoot[L]{\normalsize\myauthor}
      % \fancyfoot[R]{\thepage}
      % \renewcommand\footrulewidth{.5pt}
      % % Marks
      % % \renewcommand{\partmark}[1]{\markboth{}{\thepart#1}}
      % % -------------------------------------------------------- %
      % %                         Subfiles                         %
      % % -------------------------------------------------------- %
      \usepackage{subfiles}
      % % -------------------------------------------------------- %
      % %                        My packages                       %
      % % -------------------------------------------------------- %
      % ======================== Setups ======================== %
      \usepackage{myhyperref}
      % ========================= Boxes ======================== %
      \usepackage{sections}
      % \usepackage{questions}
      % \usepackage{answers}
      % \usepackage{examples}
      % \usepackage{definitions}
      % ================= My title and subfile ================= %
      \usepackage{mytitle}    % \mymaketitle
      \usepackage{mysubfile}  % \mymakesubfile
      % % -------------------------------------------------------- %
      % %                  Divisions customization                 %
      % % -------------------------------------------------------- %
      \renewcommand\thesubsubsection{(\roman{subsubsection})}
      % \renewcommand\thepart{Part \arabic{part}}
      % 88                                    88
      % 88                                    \"\"
      % 88
      % 88,dPPYba,    ,adPPYba,   ,adPPYb,d8  88  8b,dPPYba,
      % 88P'    \"8a  a8P_____88  a8\"    `Y88  88  88P'   `\"8a
      % 88       d8  8PP\"\"\"\"\"\"\"  8b       88  88  88       88
      % 88b,   ,a8\"  \"8b,   ,aa  \"8a,   ,d88  88  88       88
      % 8Y\"Ybbd8\"'    `\"Ybbd8\"'   `\"YbbdP\"Y8  88  88       88
      %                           aa,    ,88
      %                            \"Y8bbdP\"
      \begin{document}
      \mymaketitle
      % print files
      \begin{luacode*}
        -- Files Directory
        dir = \"./\"
        -- Prefix and sufix
        prefix = \"\"
        sufix  = \"\"
        -- Print file range
        firstFile = 1 -- first file number
        lastFile  = 1 -- last  file number
        -- Print specific files by number
        index = {1}
        -- % ---------------------------------------------------- %
        -- %                         Loop                         %
        -- % ---------------------------------------------------- %
        -- for i=firstFile,lastFile,1 -- Print range
        -- for v,i in ipairs(index)   -- Print specific
        for i=firstFile,lastFile,1 -- Print range
        do
          tex.print(string.split(table.concat{
          \[\[
            \subfile{\]\], dir, prefix, string.format(\"%d\", i), sufix, \[\[}\newpage
          \]\]
          },\"\n\"))
        end
        -- % ==================================================== %
      \end{luacode*},
      \end{document}
      ]],
      {}
    )
  ),
  ms( -- Subfile Template
    {
      common = {
        desc = { "Subfile Template" },
      },
      -- trig
      "\\latex-template-subfile",
    },
    fmt(
      [[
      % !TEX root = ./<subfile>.tex
    \documentclass[<mainfile>.tex]{subfiles}

    % \tikzset{external/force remake=true} % - remake all

    \begin{document}

    % \graphicspath{{\subfix{./.build/figures/<subfile>}}}
    % \tikzsetexternalprefix{./.build/figures/<subfile>/graphics/}

    \mymakesubfile{<part_counter>}<di_g><group><do_g>
    {<title_sub>} % Subfile Title
    {<title_main>} % Part Title

    <body>

    \end{document}
      ]],
      {
        subfile = i(1, "subfile.tex"),
        mainfile = i(2, "mainfile.tex"),
        part_counter = i(3, "part counter"),
        group = i(4, "group"),
        di_g = ne(4, "\r["),
        do_g = ne(4, "]"),
        title_sub = i(5, "subfile title"),
        title_main = i(6, "mainfile title"),
        body = i(0, "body"),
      }
    )
  ),
})
