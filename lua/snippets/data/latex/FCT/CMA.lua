local ls = require("luasnip")

local s = ls.snippet -- build snippets
-- local t = ls.text_node -- insert text
-- local i = ls.insert_node -- user input

-- local extras = require("luasnip.extras")
-- local rep = extras.rep                         -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return
-- formulas
    s( -- lei de bragg
      {
        trig = "\\formula-lei-bragg-difracao-raios-x",
        desc = {
          "n: ordem de reflexão",
          "λ: ordem de reflexão",
          "d: distancia entre planos",
          "θ: angulo de impacto",
        },
      },
      fmt([[ n\,\lambda=2\,d_{h\,k\,l}\,\sin(\theta) ]], {})
    ),
    s( -- distancias entre planos de miller
      {
        trig = "\\formula-distancia-planos-miller",
        desc = "distancia entre planos de miller",
      },
      fmt(
        [[
    d_{h\,k\,l}
    =\frac{a}{\sqrt{h^2+k^2+l^2}}
  ]],
        {}
      )
    ),
    s( -- tabela difracao raios x
      {
        desc = "Difração com N indo de 1 a 12",
        trig = "\\formula-tabela-difracao-raios-x-bragg",
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
    s( -- parametro de rede cubica
      {
        desc = {
          "a - Parametro de rede CS, CFC e CCC em função do peso atomico e densidade",
          "CS : a=r*2",
          "CCC: a=r*4/sqrt(3)",
          "CFC: a=r*2^{3/2}",
        },
        trig = {
          "\\formula-parametro-rede-Cubica",
          "\\formula-parametro-rede-CS",
          "\\formula-parametro-rede-CFC",
          "\\formula-parametro-rede-CCC",
        },
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
    s( -- fator de empacotamento atomico cs
      {
        desc = "fea - porcentagem de volume ocupado por atomos na estrutura cristalina,\n a=2r",
        trig = "\\constante-fator-empacotamento-fea-cs",
      },
      fmt(
        [[
     \qty{52.3598775598299}{\percent}
    ]],
        {}
      )
    ),
    s( -- fator de empacotamento atomico ccc
      {
        desc = {
          "fea - porcentagem de volume ocupado por atomos na estrutura cristalina,",
          "a = r*4/\\sqrt{3}",
        },
        trig = "\\constante-fator-empacotamento-fea-ccc",
      },
      fmt(
        [[
        \qty{68.0174761587832}{\percent}
      ]],
        {}
      )
    ),
    s( -- fator de empacotamento atomico cfc
      {
        desc = {
          "fea - porcentagem de volume ocupado por atomos na estrutura cristalina,",
          "a=r*2^{3/2}",
        },
        trig = "\\constante-fator-empacotamento-fea-cfc",
      },
      fmt(
        [[
        \qty{74.0480489693062}{\percent}
      ]],
        {}
      )
    ),
    s( -- fator de empacotamento atomico hc
      {
        desc = {
          "fea - porcentagem de volume ocupado por atomos na estrutura cristalina,",
          "a=2r, c=1.633*a",
        },
        trig = "\\constante-fator-empacotamento-fea-hc",
      },
      fmt(
        [[
        \qty{74.0477388950487}{\percent}
      ]],
        {}
      )
    ),
    -- tikzpictures
    s( -- tikz estrutura cristalina cubica cs
      {
        desc = "tikz de cs",
        trig = "\\tikz-estrutura-cristalina-cubica-cs",
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
    s( -- tikz estrutura cristalina cubica ccc
      {
        trig = "tikz de ccc",
        desc = "\\tikz-estrutura-cristalina-cubica-ccc",
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
    s( -- tikz estrutura cristalina cubica cfc
      {
        desc = "tikz de cfc",
        trig = "\\tikz-estrutura-cristalina-cubica-cfc",
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
    s( -- tikz plano miller (110)
      {
        desc = {
          "plano com indice de miller (110)",
          "diagonal sobre z",
        },
        trig = "\\tikz-plano-miller-(110)",
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
    s( -- tikz plano miller (001)
      {
        desc = {
          "plano com indice de miller (001)",
          "face z=1",
        },
        trig = "\\tikz-plano-miller-(001)",
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
    s( -- tikz plano miller (111)
      {
        desc = {
          "plano com indice de miller (111)",
          "triangulo",
        },
        trig = "\\tikz-plano-miller-(111)",
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
    )
