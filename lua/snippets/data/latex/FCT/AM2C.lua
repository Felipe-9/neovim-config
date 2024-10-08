--
local ls = require("luasnip")

-- local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
-- local t = ls.text_node -- insert text
-- local i = ls.insert_node -- user input

-- local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  --
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
        desc = "parametrização coordenadas esfericas",
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
        desc = "parametrização coordenadas cilíndricas em r3",
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
}
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
