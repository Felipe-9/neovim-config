local ls = require("luasnip")

-- local s = ls.snippet     -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
-- local t = ls.text_node -- insert text
local i = ls.insert_node -- user input

local extras = require("luasnip.extras")
local rep = extras.rep                         -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  --
  ms( -- Solucoes EDO lineares de ordem 1
    {
      common = {
        name = "Formula EDOs Lineares ordem 1",
        desc = {
          "y' + a(x) y = b(x)",
          "onde: 𝛗(x)=\\exp(∫{ a(x)dx })",
        },
      },
      -- trig
      "\\formulas-AM3C-EDO-linear-ordem1",
    },
    fmt(
      [[
      % a(x) = <a>
      % b(x) = <b>
      % y    = <y>
      % x    = <x>
      <y_rep>
      = \frac{c_0}{\varphi(<x_rep>)}
      + \frac{1  }{\varphi(<x_rep>)}
      \,\int{<b_rep>\,\varphi(<x_rep>)\,\odif{<x_rep>}}
      %
      %
      %
      = &\\[3ex]&
      = \frac{c_0}{\varphi(<x_rep>)}
      + \frac{1  }{\varphi(<x_rep>)}
      \,\int{<b_rep>\,\varphi(<x_rep>)\,\odif{<x_rep>}}
      %
      %
      %
      ; &\\[3ex]&
      \varphi(<x_rep>) 
      = \exp{\left(
        \int{<a_rep>\,\odif{<x_rep>}}
      \right)}
      = \exp{\left(
        \int{<a_rep>\,\odif{<x_rep>}}
      \right)}
      ]],
      {
        y = i(1, "y"),
        x = i(2, "x"),
        a = i(3, "a(x)"),
        b = i(4, "b(x)"),
        y_rep = rep(1),
        x_rep = rep(2),
        a_rep = rep(3),
        b_rep = rep(4),
      }
    )
  ),
  ms( -- Bernoulli's Equation
    {
      common = {
        name = "Bernoulli equation EDO",
        desc = {
          "Find general solution for non linear equation:",
          "y' + a(x) y = b(x) y^k; k ∈ ℝ|{0,1}",
          "where: z=y^{1-k}",
        },
      },
      "\\formulas-AM3C-EDO-bernoulli",
    },
    fmt(
      [[
      % a(x) = <a>
      % b(x) = <b>
      % k    = <k>
      y' + <a_rep>\,y = <b_rep>\,y^<k_rep>
      %
      %
      %
      &\\[3ex]&
      z=y^{1-<k_rep>} 
      \implies &\\&
      \implies
      z' + (1-<k_rep>)<a_rep>\,z = (1-<k_rep>)\,<b_rep>
      ]],
      {
        a = i(1, "a(x)"),
        b = i(2, "b(x)"),
        k = i(3, "k"),
        a_rep = rep(1),
        b_rep = rep(2),
        k_rep = rep(3),
      }
    )
  ),
  ms( -- Riccati equation
    {
      common = {
        name = "Riccati's Equation",
        desc = {
          "y' + a(x) y = b(x) + c(x) y²",
          "where:",
          "y(x) = y_1(x) + z^{-1};",
          "z' + (2 c(x) y(x_1) - a(x)) z = -c(x)",
          "an arbitrary solution is given: y_1(x)",
        },
      },
      -- trig
      "\\formulas-AM3C-EDO-Riccati",
    },
    fmt(
      [[
      % a(x) = <a>
      % b(x) = <b>
      % c(x) = <c>
      % y_1(x) = <y_1>
      y'
      + <a_rep>\,y
      = <b_rep>
      + <c_rep>\,y^2
      %
      %
      %
      ; &\\[3ex]&
      y(x)
      = y_1(x)
      + z^{-1}
      = <y_1_rep>
      + z^{-1}
      %
      %
      %
      ; &\\[3ex]&
      y_1(x)=<y_1_rep>
      %
      %
      %
      ; &\\[3ex]&
      z' + (
        2
        \,<c_rep>
        \,<y_1_rep>
        - <a_rep>
      )\,z
      = - <c_rep>
      ]],
      {
        a = i(1, "a(x)"),
        b = i(2, "b(x)"),
        c = i(3, "c(x)"),
        -- x1 = i(4, "x_1"),
        y_1 = i(4, "y(x_1)"),
        a_rep = rep(1),
        b_rep = rep(2),
        c_rep = rep(3),
        y_1_rep = rep(4),
      }
    )
  ),
  ms( -- Reduce order of homogenous linear equation
    {
      common = {
        name = "Order reduction for homogeneous linear equation",
        desc = {
          ""
        }
      },
      "\\formula-AM3C-eq-lin-homogenea-reducao-de-ordem",
      "\\formula-AM3C-homogenous-lin-eq-order-reduction"
    },
    fmt(
      [[
      % P = <P>
      % φ(x) = <varphi>
      P\,y
      = \left(
        <P_rep>
      \right)
      \,y
      = 0
      %
      %
      %
      ; &\\[3ex]&
      y 
      = \varphi(x)\,\int{z(x)\,\odif{x}}
      = <varphi_rep>\,\int{
        z(x)
        \,\odif{x}
      }
      %
      %
      %
      ; &\\[3ex]&
      P\,y
      = \left(
        <P_rep>
      \right)
      \,\left(
        <varphi_rep>\,\int{
          z(x)\,\odif{x}
        }
      \rigt)
      = &\\&
      = \left(
        <P_rep>
      \right)
      \,\left(
        <varphi_rep>\,\int{
          z(x)\,\odif{x}
        }
      \rigt)
      = 0
      %
      %
      %
      ; &\\[3ex]&
      \mdif[1]{x}{y}
      = \mdif[1]{x}{\left(
        \varphi(x)
        \,\int{z(x)\,\odif{x}}
      \right)}
      = \mdif[1]{x}{\left(
        <varphi_rep>
        \,\int{z(x)\,\odif{x}}
      \right)}
      = \mdif[1]{x}{\left(
        <varphi_rep>
        \,\int{z(x)\,\odif{x}}
      \right)}
      %
      %
      %
      ; &\\[3ex]&
      \mdif[2]{x}{y}
      = \mdif[2]{x}{\left(
        \varphi(x)
        \,\int{z(x)\,\odif{x}}
      \right)}
      = \mdif[2]{x}{\left(
        <varphi_rep>
        \,\int{z(x)\,\odif{x}}
      \right)}
      = \mdif[2]{x}{\left(
        <varphi_rep>
        \,\int{z(x)\,\odif{x}}
      \right)}
      ]],
      {
        P          = i(1,"P"),
        varphi     = i(2,"\\varphi(x)"),
        P_rep      = rep(1),
        varphi_rep = rep(2),
      }
    )
  ),
  ms( -- Wronskiano: Linear independent check
    {
      common = {
        name = "Wronskiano: Linear independent check",
        desc = {
          "Matrix which its module shows if equations are linear independent",
          "det w == 0 => dependent",
          "det w != 0 => independent",
        },
      },
      -- trig
      "formulas-AM3C-Wronskiano-linear-indep-check",
    },
    fmt(
      [[
      W(F)(x)
      = \det(w)
      % = 
      % \det\begin{bmatrix}
      %   f_1 & f_2 & \dots
      %   f_1' & f_2' & \dots
      % \end{bmatrix}
      %
      %
      %
      &\\&
      \begin{cases}
        = 0 &\quad \text{não é linearmente indep}
        \\
        \neq 0 &\quad \text{é linearmente indep}
      \end{cases}
      %
      %
      %
      ; &\\[3ex]&
      w \in \mathcal{M}_{n,m}
      : w_{i,j}
      = \mdif[j]{x}\,f_i
      ]],
      {}
    )
  ),
  ms( -- Solucoes para metodo da variacao das constantes arb para eq lin de ord 2
    {
      common = {
        name = "Metodo da variacao das constantes arb para eq lin (2)",
        desc = "Soluções para equações lineares de ordem 2",
      },
      "\\formulas-AM3C-solve-linear-equation-ord-2-metodo-var-das-const-arb",
    },
    fmt(
      [[
      % a_0(x) = <a_0>
      % a_1(x) = <a_1>
      % a_2(x) = <a_2>
      % f(x)   = <f>
      % y_1(x) = <y_1>
      % y_2(x) = <y_2>
      y:
      \begin{pmatrix}
          <a_0_rep>
        \\ + <a_1_rep>\,\mdif[1]{x}
        \\ + <a_2_rep>\,\mdif[2]{x}
      \end{pmatrix}
      \,y
      = <f_rep>
      %
      %
      %
      &\\[3ex]&
      y
      = c_1(x)\,y_1(x)
      + c_2(x)\,y_2(x)
      = c_1(x)\,<y_1_rep>
      + c_2(x)\,<y_2_rep>
      %
      %
      %
      ; &\\[3ex]&
      % Regra de Crammer
      c_1(x) 
      = \int{c_1'(x)\,\odif{x}}
      %
      %
      ; &\\[1ex]&
      c_2(x) 
      = \int{c_2'(x)\,\odif{x}}
      %
      %
      %
      &\\[3ex]&
      c_1'(x)
      = \frac{1}{W(<y_1_rep>,<y_2_rep>)}
      \,\begin{vmatrix}
        0 
        &  \mdif[0]{x}<y_2_rep>
        \\ \frac{<f_rep>}{<a_2_rep>}
        &  \mdif[1]{x}<y_2_rep>
      \end{vmatrix}
      %
      %
      %
      &\\[3ex]&
      c_2'(x)
      = \frac{1}{W(<y_1_rep>,<y_2_rep>)}
      \,\begin{vmatrix}
           \mdif[0]{x}<y_1_rep>
        &  0 
        \\ \mdif[1]{x}<y_1_rep>
        &  \frac{<f_rep>}{<a_2_rep>}
      \end{vmatrix}
      %
      %
      %
      &\\[3ex]&
      % Wronskiano
      W(<y_1_rep>,<y_2_rep>)
      = \det\begin{bmatrix}
           \mdif[0]{x}\,<y_1_rep>
        &  \mdif[0]{x}\,<y_2_rep>
        \\ \mdif[1]{x}\,<y_1_rep>
        &  \mdif[1]{x}\,<y_2_rep>
      \end{bmatrix}
      %
      %
      %
      &\\[3ex]&
      \begin{Bmatrix}
        {
            c_1'(x)\,\mdif[0]{x}y_1(x) 
          + c_2'(x)\,\mdif[0]{x}y_2(x)
        } = 0
        \\ {
            c_1'(x)\,\mdif[1]{x}\,y_1(x) 
          + c_2'(x)\,\mdif[1]{x}\,y_2(x)
        } = \frac{<f_rep>}{<a_2_rep>}
      \end{Bmatrix}
      = &\\&
      = \begin{Bmatrix}
        {
            c_1'(x)\,\mdif[0]{x}<y_1_rep> 
          + c_2'(x)\,\mdif[0]{x}<y_2_rep>
        } = 0
        \\ {
            c_1'(x)\,\mdif[1]{x}\,<y_1_rep>
          + c_2'(x)\,\mdif[1]{x}\,<y_2_rep>
        } = \frac{<f_rep>}{<a_2_rep>}
      \end{Bmatrix}
      = &\\&
      = \begin{Bmatrix}
        {
            c_1'(x)\,\mdif[0]{x}<y_1_rep> 
          + c_2'(x)\,\mdif[0]{x}<y_2_rep>
        } = 0
        \\ {
            c_1'(x)\,\mdif[1]{x}\,<y_1_rep>
          + c_2'(x)\,\mdif[1]{x}\,<y_2_rep>
        } = \frac{<f_rep>}{<a_2_rep>}
      \end{Bmatrix}
      %
      %
      %
      ; &\\[3ex]&
      \mdif[1]{x}\,<y_1_rep>
      = \mdif[1]{x}\,<y_1_rep>
      %
      %
      ; &\\[1ex]&
      \mdif[1]{x}\,<y_2_rep>
      = \mdif[1]{x}\,<y_2_rep>
      ]],
      {
        a_0 = i(1,"a_0(x)"),
        a_1 = i(2,"a_1(x)"),
        a_2 = i(3,"a_2(x)"),
        f = i(4,"f(x)"),
        y_1 = i(5,"y_1(x)"),
        y_2 = i(6,"y_2(x)"),
        a_0_rep = rep(1),
        a_1_rep = rep(2),
        a_2_rep = rep(3),
        f_rep = rep(4),
        y_1_rep = rep(5),
        y_2_rep = rep(6),
      }
    )
  ),
  ms( -- Solucoes para metodo da variacao das constantes arb para eq lin de ord 3
    {
      common = {
        name = "Metodo da variacao das constantes arb para eq lin (3)",
        desc = "Soluções para equações lineares de ordem 3",
      },
      "\\formulas-AM3C-solve-linear-equation-ord-3-metodo-var-das-const-arb",
    },
    fmt(
      [[
      % a_0(x) = <a_0>
      % a_1(x) = <a_1>
      % a_2(x) = <a_2>
      % a_3(x) = <a_3>
      % f(x)   = <f>
      % y_1(x) = <y_1>
      % y_2(x) = <y_2>
      % y_3(x) = <y_3>
      y:
      \begin{pmatrix}
          <a_0_rep>
        \\ + <a_1_rep>\,\mdif[1]{x}
        \\ + <a_2_rep>\,\mdif[2]{x}
        \\ + <a_3_rep>\,\mdif[3]{x}
      \end{pmatrix}
      \,y
      = <f_rep>
      %
      %
      %
      &\\[3ex]&
      y
      = c_1(x)\,y_1(x)
      + c_2(x)\,y_2(x)
      + c_3(x)\,y_3(x)
      = c_1(x)\,<y_1_rep>
      + c_2(x)\,<y_2_rep>
      + c_3(x)\,<y_3_rep>
      %
      %
      %
      ; &\\[3ex]&
      % Regra de Crammer
      c_1(x) 
      = \int{c_1'(x)\,\odif{x}}
      %
      %
      ; &\\[1ex]&
      c_2(x) 
      = \int{c_1'(x)\,\odif{x}}
      %
      %
      ; &\\[1ex]&
      c_3(x) 
      = \int{c_1'(x)\,\odif{x}}
      %
      %
      %
      &\\[3ex]&
      c_1'(x)
      = \frac{1}{W(<y_1_rep>,<y_2_rep>,<y_3_rep>)}
      \,\begin{vmatrix}
        0 
        &  \mdif[0]{x}<y_2_rep>
        &  \mdif[0]{x}<y_3_rep>
        \\ 0
        &  \mdif[1]{x}<y_2_rep>
        &  \mdif[1]{x}<y_3_rep>
        \\ \frac{<f_rep>}{<a_3_rep>}
        &  \mdif[2]{x}<y_2_rep>
        &  \mdif[2]{x}<y_3_rep>
      \end{vmatrix}
      %
      %
      %
      &\\[3ex]&
      % Wronskiano
      W(<y_1_rep>,<y_2_rep>,<y_3_rep>)
      = \det\begin{bmatrix}
           \mdif[0]{x}\,<y_1_rep>
        &  \mdif[0]{x}\,<y_2_rep>
        &  \mdif[0]{x}\,<y_3_rep>
        \\ \mdif[1]{x}\,<y_1_rep>
        &  \mdif[1]{x}\,<y_2_rep>
        &  \mdif[1]{x}\,<y_3_rep>
        \\ \mdif[2]{x}\,<y_1_rep>
        &  \mdif[2]{x}\,<y_2_rep>
        &  \mdif[2]{x}\,<y_3_rep>
      \end{bmatrix}
      %
      %
      %
      &\\[3ex]&
      c_2'(x)
      = \frac{1}{W(<y_1_rep>,<y_2_rep>,<y_3_rep>)}
      \,\begin{vmatrix}
           \mdif[0]{x}<y_1_rep>
        &  0 
        &  \mdif[0]{x}<y_3_rep>
        \\ \mdif[1]{x}<y_1_rep>
        &  0
        &  \mdif[1]{x}<y_3_rep>
        \\ \mdif[2]{x}<y_1_rep>
        &  \frac{<f_rep>}{<a_3_rep>}
        &  \mdif[2]{x}<y_3_rep>
      \end{vmatrix}
      %
      %
      %
      &\\[3ex]&
      c_3'(x)
      = \frac{1}{W(<y_1_rep>,<y_2_rep>,<y_3_rep>)}
      \, \begin{vmatrix}
           \mdif[0]{x}<y_1_rep>
        &  \mdif[0]{x}<y_2_rep>
        &  0
        \\ \mdif[1]{x}<y_1_rep>
        &  \mdif[1]{x}<y_2_rep>
        &  0
        \\ \mdif[2]{x}<y_1_rep>
        &  \mdif[2]{x}<y_2_rep>
        &  \frac{<f_rep>}{<a_3_rep>}
      \end{vmatrix}
      %
      %
      %
      &\\[3ex]&
      \begin{Bmatrix}
        {
            c_1'(x)\,\mdif[0]{x}y_1(x) 
          + c_2'(x)\,\mdif[0]{x}y_2(x)
          + c_3'(x)\,\mdif[0]{x}y_3(x)
        } = 0
        \\ {
            c_1'(x)\,\mdif[1]{x}\,y_1(x) 
          + c_2'(x)\,\mdif[1]{x}\,y_2(x)
          + c_3'(x)\,\mdif[1]{x}\,y_3(x)
        } = 0
        \\ {
            c_1'(x)\,\mdif[2]{x}\,y_1(x) 
          + c_2'(x)\,\mdif[2]{x}\,y_2(x)
          + c_3'(x)\,\mdif[2]{x}\,y_3(x)
        } = \frac{<f_rep>}{<a_3_rep>}
      \end{Bmatrix}
      = &\\&
      = \begin{Bmatrix}
        {
            c_1'(x)\,\mdif[0]{x}<y_1_rep> 
          + c_2'(x)\,\mdif[0]{x}<y_2_rep>
          + c_3'(x)\,\mdif[0]{x}<y_3_rep>
        } = 0
        \\ {
            c_1'(x)\,\mdif[1]{x}\,<y_1_rep>
          + c_2'(x)\,\mdif[1]{x}\,<y_2_rep>
          + c_3'(x)\,\mdif[1]{x}\,<y_3_rep>
        } = 0
        \\ {
            c_1'(x)\,\mdif[2]{x}\,<y_1_rep>
          + c_2'(x)\,\mdif[2]{x}\,<y_2_rep>
          + c_3'(x)\,\mdif[2]{x}\,<y_3_rep>
        } = \frac{<f_rep>}{<a_3_rep>}
      \end{Bmatrix}
      = &\\&
      = \begin{Bmatrix}
        {
            c_1'(x)\,\mdif[0]{x}<y_1_rep> 
          + c_2'(x)\,\mdif[0]{x}<y_2_rep>
          + c_3'(x)\,\mdif[0]{x}<y_3_rep>
        } = 0
        \\ {
            c_1'(x)\,\mdif[1]{x}\,<y_1_rep>
          + c_2'(x)\,\mdif[1]{x}\,<y_2_rep>
          + c_3'(x)\,\mdif[1]{x}\,<y_3_rep>
        } = 0
        \\ {
            c_1'(x)\,\mdif[2]{x}\,<y_1_rep>
          + c_2'(x)\,\mdif[2]{x}\,<y_2_rep>
          + c_3'(x)\,\mdif[2]{x}\,<y_3_rep>
        } = \frac{<f_rep>}{<a_3_rep>}
      \end{Bmatrix}
      %
      %
      %
      ; &\\[3ex]&
      \mdif[1]{x}\,<y_1_rep>
      = \mdif[1]{x}\,<y_1_rep>
      %
      %
      ; &\\[1ex]&
      \mdif[2]{x}\,<y_1_rep>
      = \mdif[2]{x}\,<y_1_rep>
      %
      %
      ; &\\[1ex]&
      \mdif[1]{x}\,<y_2_rep>
      = \mdif[1]{x}\,<y_2_rep>
      %
      %
      ; &\\[1ex]&
      \mdif[2]{x}\,<y_2_rep>
      = \mdif[2]{x}\,<y_2_rep>
      %
      %
      ; &\\[1ex]&
      \mdif[1]{x}\,<y_3_rep>
      = \mdif[1]{x}\,<y_3_rep>
      %
      %
      ; &\\[1ex]&
      \mdif[2]{x}\,<y_3_rep>
      = \mdif[2]{x}\,<y_3_rep>
      ]],
      {
        a_0 = i(1,"a_0(x)"),
        a_1 = i(2,"a_1(x)"),
        a_2 = i(3,"a_2(x)"),
        a_3 = i(4,"a_3(x)"),
        f = i(5,"f(x)"),
        y_1 = i(6,"y_1(x)"),
        y_2 = i(7,"y_2(x)"),
        y_3 = i(8,"y_3(x)"),
        a_0_rep = rep(1),
        a_1_rep = rep(2),
        a_2_rep = rep(3),
        a_3_rep = rep(4),
        f_rep = rep(5),
        y_1_rep = rep(6),
        y_2_rep = rep(7),
        y_3_rep = rep(8),
      }
    )
  ),
  ms( -- Crammer's Rule
    {
      common = {
        name = "Crammer's Rule: linear system solutions",
        desc = {
          "Determina as soluções de um sistema linear",
        },
      },
      -- trig
      "formulas-AM-regra-de-crammer-solucoes-sistema-linear",
    },
    fmt(
      [[
      % a_1 = <a_1>
      % a_2 = <a_2>
      %
      % f_{1,1} = <f_1_1>
      % f_{1,2} = <f_1_2>
      % f_{1,3} = <f_1_3>
      %
      % f_{2,1} = <f_2_1>
      % f_{2,2} = <f_2_2>
      % f_{2,3} = <f_2_3>
      \begin{Bmatrix}
           <a_1_rep>\,<f_1_1_rep> + <a_2_rep>\,<f_1_2_rep> = <f_1_3_rep>
        \\ <a_1_rep>\,<f_2_1_rep> + <a_2_rep>\,<f_2_2_rep> = <f_2_3_rep>
      \end{Bmatrix}
      &\\&
      \implies
      <a_1_rep> = \frac{
        \begin{vmatrix}
          <f_1_3_rep> & <f_1_2>
          \\
          <f_2_3_rep> & <f_2_2_rep>
        \begin{vmatrix}
      }{
        \begin{vmatrix}
          <f_1_1_rep> & <f_1_2_rep>
          \\
          <f_2_1_rep> & <f_2_2_rep>
        \begin{vmatrix}
      }
      ]],
      {
        a_1 = i(1,"a_1"),
        a_2 = i(2,"a_2"),
        f_1_1 = i(3,"f_{1,1}"),
        f_1_2 = i(4,"f_{1,2}"),
        f_1_3 = i(5,"f_{1,3}"),
        f_2_1 = i(6,"f_{2,1}"),
        f_2_2 = i(7,"f_{2,2}"),
        f_2_3 = i(8,"f_{2,3}"),
        a_1_rep = rep(1),
        a_2_rep = rep(2),
        f_1_1_rep = rep(3),
        f_1_2_rep = rep(4),
        f_1_3_rep = rep(5),
        f_2_1_rep = rep(6),
        f_2_2_rep = rep(7),
        f_2_3_rep = rep(8),
      }
    )
  ),
}
