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
      "\\formulas-AM3C-EDO-linear-ordem-1",
    },
    fmt(
      [[
      % tag  = <tag_input>
      % a(x) = <a_input>
      % b(x) = <b_input>
      % y    = <y_input>
      % x    = <x_input>
      \begin{gather*}
        <y>
        = \frac{c_0}{\varphi(<x>)}
        + \frac{1  }{\varphi(<x>)}
        \,\int{<b>\,\varphi(<x>)\,\odif{<x>}}
        %
        %
        %
        = \\[3ex] 
        \usingref{eq:<tag>-phi_x}
        = \frac{c_0}{\varphi(<x>)}
        + \frac{1  }{\varphi(<x>)}
        \,\int{<b>\,\varphi(<x>)\,\odif{<x>}}
        %
        %
        %
        = \\
        \usingref{eq:<tag>-prim}
        = \frac{c_0}{\varphi(<x>)}
        + \frac{1  }{\varphi(<x>)}
        \,\int{<b>\,\varphi(<x>)\,\odif{<x>}}
      \end{gather*}
      % φ(x)
      \begin{gather*}
        \varphi(<x>) 
        = \exp{\left(
          \int{<a>\,\odif{<x>}}
        \right)}
        = \exp{\left(
          \int{<a>\,\odif{<x>}}
        \right)}
        %
        \yesnumber\label{eq:<tag>-phi_x}
      \end{gather*}
      % prim
      \begin{gather*}
        & 
        P\left(
          <b>\,\varphi(<x>)
        \right)
        = P\left(
          <b>\,\varphi(<x>)
        \right)
        %
        \yesnumber\label{eq:<tag>-prim}
      \end{gather*}
      ]],
      {
        tag_input = i(1, "tag"),
        y_input = i(2, "y"),
        x_input = i(3, "x"),
        a_input = i(4, "a(x)"),
        b_input = i(5, "b(x)"),
        tag = rep(1),
        y = rep(2),
        x = rep(3),
        a = rep(4),
        b = rep(5),
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
      % tag  = <tag_input>
      % a(x) = <a_input>
      % b(x) = <b_input>
      % k    = <k_input>
      \begin{gather*}
        y' + <a>\,y = <b>\,y^<k>
        %
        %
        %
        \\[3ex]
        z=y^{1-<k>} 
        \implies \\
        \implies
        z' + (1-<k>)<a>\,z = (1-<k>)\,<b>
        %
        \yesnumber\label{eq:<tag>-z}
      \end{gather*}
      ]],
      {
        tag_input = i(1, 'tag'),
        a_input   = i(2, "a(x)"),
        b_input   = i(3, "b(x)"),
        k_input   = i(4, "k"),
        tag       = rep(1),
        a         = rep(2),
        b         = rep(3),
        k         = rep(4),
      }
    )
  ),
  ms( -- Riccati equation
    {
      common = {
        name = "Riccati's Equation",
        desc = {
          "solve",
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
      % tag  = <tag_input>
      % a(x) = <a_input>
      % b(x) = <b_input>
      % c(x) = <c_input>
      % y_1(x) = <y_1_input>

      \begin{gather*}
        y(x)
        = y_1(x)
        + z^{-1}
        = <y_1>
        + z^{-1}
        %
        %
        %
        = \\
        % \usingref{eq:<tag>-z_solution}
        = <y_1>
        + z^{-1}
      \end{gather*}
      % normalizing equation
      \begin{gather*}
        y'
        + <a>\,y
        = <b>
        + <c>\,y^2
        \yesnumber\label{eq:<tag>-y_normalized}
        %
        %
        %
        \\[3ex]
        y_1(x)=<y_1>
      \end{gather*}
      % z equation
      \begin{gather*}
        z' + (
          2
          \,<c>
          \,<y_1>
          - <a>
        )\,z
        = - <c>
        \yesnumber\label{eq:<tag>-z_equation}
      \end{gather*}
      % from here solve z using edo order 1
      ]],
      {
        tag_input = i(1,'tag'),
        a_input   = i(2, "a(x)"),
        b_input   = i(3, "b(x)"),
        c_input   = i(4, "c(x)"),
        y_1_input = i(5, "y(x_1)"),
        tag = rep(1),
        a   = rep(2),
        b   = rep(3),
        c   = rep(4),
        y_1 = rep(5),
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
      % tag  = <tag_input>
      % P    = <P_input>
      % φ(x) = <varphi_input>

      % reducing
      \begin{gather*}
        P\,y
        = \left(
          <P>
        \right)
        \,y
        =
        \usingref{eq:<tag>-D_x(y),eq:<tag>-D2_x(y)}
        = \dots
        = \\
        = 0
      \end{gather*}
      % getting y to deriv
      \begin{gather*}
        y 
        = \varphi(x)\,\int{z(x)\,\odif{x}}
        = <varphi>\,\int{
          z(x)
          \,\odif{x}
        }
        \yesnumber\label{eq:<tag>-y}
      \end{gather*}
      \begin{gather*}
        \mdif[1]{x}{y}
        = \mdif[1]{x}{\left(
          \varphi(x)
          \,\int{z(x)\,\odif{x}}
        \right)}
        = \mdif[1]{x}{\left(
          <varphi>
          \,\int{z(x)\,\odif{x}}
        \right)}
        = \mdif[1]{x}{\left(
          <varphi>
          \,\int{z(x)\,\odif{x}}
        \right)}
        \yesnumber\label{eq:<tag>-D_x(y)}
        %
        %
        %
        ; \\[3ex]
        \mdif[2]{x}{y}
        = 
        \usingref{eq:<tag>-D_x(y)}
        = \mdif{x}{\left(
          \dots
        \right)}
        \yesnumber\label{eq:<tag>-D2_x(y)}
      \end{gather*}
      ]],
      {
        tag_input    = i(1,'tag'),
        P_input      = i(2,"P"),
        varphi_input = i(3,"\\varphi(x)"),
        tag          = rep(1),
        P            = rep(2),
        varphi       = rep(3),
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
      \begin{gather*}
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
        \\
        \begin{cases}
          = 0 &\quad \text{não é linearmente indep}
          \\
          \neq 0 &\quad \text{é linearmente indep}
        \end{cases}
        %
        %
        %
        ; \\[3ex]
        w \in \mathcal{M}_{n,m}
        : w_{i,j}
        = \mdif[j]{x}\,f_i
      \end{gather*}
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
      % tag    = <tag_input>
      % a_0(x) = <a_0_input>
      % a_1(x) = <a_1_input>
      % a_2(x) = <a_2_input>
      % f(x)   = <f_input>
      % y_1(x) = <y_1_input>
      % y_2(x) = <y_2_input>

      \begin{gather*}
        y:
        \begin{pmatrix}
            <a_0>
          \\ + <a_1>\,\mdif[1]{x}
          \\ + <a_2>\,\mdif[2]{x}
        \end{pmatrix}
        \,y
        = <f>
        % 
        \\[1ex]
        \begin{cases}
          y_1 = <y_1>
          \\
          y_2 = <y_2>
        \end{cases}
        %
        %
        %
        \\[3ex]
        y
        = c_1(x)\,y_1(x)
        + c_2(x)\,y_2(x)
        = 
        \usingref{eq:<tag>-c_1,eq:<tag>-c_2}
        = \left(
          <y_1>
        \right)
        \,\left(
          c_1
        \right)
          + \left(
          <y_2>
        \right)
        \,\left(
          c_2
        \right)
      \end{gather*}

      % c_1,c_2
      \begin{gather*}
        c_1(x) 
        = \int{c_1'(x)\,\odif{x}}
        = 
        \usingref{eq:<tag>-c_1'}
        = \dots
        \yesnumber\label{eq:<tag>-c_1}
        %
        %
        ; \\[1ex]
        c_2(x) 
        = \int{c_2'(x)\,\odif{x}}
        \usingref{eq:<tag>-c_2'}
        = \dots
        \yesnumber\label{eq:<tag>-c_2}
      \end{gather*}

      % c_1',c_2'
      \begin{gather*}
        \usingref{eq:<tag>-eq_sytem}
        c_1'(x)
        = \frac{1}{W(y_1,y_2)}
        \,\begin{vmatrix}
          0 
          &  \mdif[0]{x}y_2
          \\ \frac{<f>}{<a_2>}
          &  \mdif[1]{x}y_2
        \end{vmatrix}
        = 
        \usingref{eq:<tag>-w,eq:<tag>-D_x(y_2)}
        = \dots
        \yesnumber\label{eq:<tag>-c_1'}
        %
        %
        %
        \\[3ex]
        \usingref{eq:<tag>-eq_sytem}
        c_2'(x)
        = \frac{1}{W(y_1,y_2)}
        \,\begin{vmatrix}
             \mdif[0]{x}y_1
          &  0 
          \\ \mdif[1]{x}y_1
          &  \frac{<f>}{<a_2>}
        \end{vmatrix}
        =
        \usingref{eq:<tag>-w,eq:<tag>-D_x(y_1)}
        = \dots
        \yesnumber\label{eq:<tag>-c_2'}
      \end{gather*}

      % Wronskiano
      \begin{gather*}
        W(y_1,y_2)
        = \det\begin{bmatrix}
             \mdif[0]{x}\,y_1
          &  \mdif[0]{x}\,y_2
          \\ \mdif[1]{x}\,y_1
          &  \mdif[1]{x}\,y_2
        \end{bmatrix}
        =
        \usingref{
          eq:<tag>D_x(y_1),
          eq:<tag>D_x(y_2)
        }
        = \det\begin{bmatrix}
             <y_1>
          &  <y_2>
          \\ \mdif[1]{x}\,y_1
          &  \mdif[1]{x}\,y_2
        \end{bmatrix}
        \yesnumber\label{eq:<tag>-w}
      \end{gather*}

      % Sistema de equações da regra de crammer
      \begin{gather*}
        \begin{Bmatrix}
          {
              c_1'(x)\,\mdif[0]{x}\,y_1(x) 
            + c_2'(x)\,\mdif[0]{x}\,y_2(x)
          } = 0
          \\ {
              c_1'(x)\,\mdif[1]{x}\,y_1(x) 
            + c_2'(x)\,\mdif[1]{x}\,y_2(x)
          } = \frac{<f>}{<a_2>}
        \end{Bmatrix}
        \yesnumber\label{eq:<tag>-eq_sytem}
      \end{gather*}

      % y_1',y_2'
      \begin{gather*}
        \mdif[1]{x}\,y_1
        = \mdif[1]{x}\,<y_1>
        \yesnumber\label{eq:<tag>-D_x(y_1)}
        %
        %
        ; \\[1ex]
        \mdif[1]{x}\,y_2
        = \mdif[1]{x}\,<y_2>
        \yesnumber\label{eq:<tag>-D_x(y_2)}
      \end{gather*}
      ]],
      {
        tag_input = i(1, 'tag'),
        a_0_input = i(2,"a_0(x)"),
        a_1_input = i(3,"a_1(x)"),
        a_2_input = i(4,"a_2(x)"),
        f_input   = i(5,"f(x)"),
        y_1_input = i(6,"y_1(x)"),
        y_2_input = i(7,"y_2(x)"),
        tag = rep(1),
        a_0 = rep(2),
        a_1 = rep(3),
        a_2 = rep(4),
        f   = rep(5),
        y_1 = rep(6),
        y_2 = rep(7),
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
      % tag    = <tag_input>
      % a_0(x) = <a_0_input>
      % a_1(x) = <a_1_input>
      % a_2(x) = <a_2_input>
      % a_3(x) = <a_3_input>
      % f(x)   = <f_input>
      % y_1(x) = <y_1_input>
      % y_2(x) = <y_2_input>
      % y_3(x) = <y_3_input>

      \begin{gather*}
        y:
        \begin{pmatrix}
            <a_0>
          \\ + <a_1>\,\mdif[1]{x}
          \\ + <a_2>\,\mdif[2]{x}
          \\ + <a_3>\,\mdif[3]{x}
        \end{pmatrix}
        \,y
        = <f>
        % 
        % 
        % 
        \\[1ex]
        \land \begin{cases}
          y_1 = <y_1>
          \\
          y_2 = <y_2>
          \\
          y_3 = <y_3>
        \end{cases}
        %
        %
        %
        \\[3ex]
        y
        = y_1(x)\,c_1(x)
        + y_2(x)\,c_2(x)
        + y_3(x)\,c_3(x)
        =
        \usingref{
          eq:<tag>-c_1,
          eq:<tag>-c_2,
          eq:<tag>-c_3
        }
        = \left(
          <y_1>
        \right)
        \,\left(
          c_1
        \right)
          + \left(
          <y_2>
        \right)
        \,\left(
          c_2
        \right)
        + \left(
          <y_3>
        \right)
        \,\left(
          c_3
        \right)
      \end{gather*}

      % c_1,c_2,c_3
      \begin{gather*}
        c_1(x) 
        = \int{c_1'(x)\,\odif{x}}
        =
        \usingref{eq:<tag>-c_1'}
        = \dots
        \yesnumber\label{eq:<tag>-c_1}
        %
        %
        %
        ; \\[1ex]
        c_2(x) 
        = \int{c_2'(x)\,\odif{x}}
        \usingref{eq:<tag>-c_2'}
        = \dots
        \yesnumber\label{eq:<tag>-c_2}
        %
        %
        %
        ; \\[1ex]
        c_3(x) 
        = \int{c_3'(x)\,\odif{x}}
        \usingref{eq:<tag>-c_3'}
        = \dots
        \yesnumber\label{eq:<tag>-c_3}
      \end{gather*}

      % c_1',c_2',c_3'
      \begin{gather*}
        \usingref{eq:<tag>-eq_sytem}
        c_1'(x)
        = \frac{1}{W(y_1,y_2,y_3)}
        \,\begin{vmatrix}
          0 
          &  \mdif[0]{x}y_2
          &  \mdif[0]{x}y_3
          \\ 0
          &  \mdif[1]{x}y_2
          &  \mdif[1]{x}y_3
          \\ \frac{<f>}{<a_3>}
          &  \mdif[2]{x}y_2
          &  \mdif[2]{x}y_3
        \end{vmatrix}
        =
        \usingref{
          eq:<tag>-w,
          eq:<tag>-D1_x(y_2),
          eq:<tag>-D2_x(y_2),
          eq:<tag>-D1_x(y_3),
          eq:<tag>-D2_x(y_3)
        }
        = \dots
        \yesnumber\label{eq:<tag>-c_1'}
        % 
        % 
        % 
        ; \\[3ex]
        \usingref{eq:<tag>-eq_sytem}
        c_2'(x)
        = \frac{1}{W(y_1,y_2,y_3)}
        \,\begin{vmatrix}
             \mdif[0]{x}y_1
          &  0 
          &  \mdif[0]{x}y_3
          \\ \mdif[1]{x}y_1
          &  0
          &  \mdif[1]{x}y_3
          \\ \mdif[2]{x}y_1
          &  \frac{<f>}{<a_3>}
          &  \mdif[2]{x}y_3
        \end{vmatrix}
        =
        \usingref{
          eq:<tag>-w,
          eq:<tag>-D1_x(y_1),
          eq:<tag>-D2_x(y_1),
          eq:<tag>-D1_x(y_3),
          eq:<tag>-D2_x(y_3)
        }
        = \dots
        \yesnumber\label{eq:<tag>-c_2'}
        %
        %
        %
        \\[3ex]
        \usingref{eq:<tag>-eq_sytem}
        c_3'(x)
        = \frac{1}{W(y_1,y_2,y_3)}
        \, \begin{vmatrix}
             \mdif[0]{x}y_1
          &  \mdif[0]{x}y_2
          &  0
          \\ \mdif[1]{x}y_1
          &  \mdif[1]{x}y_2
          &  0
          \\ \mdif[2]{x}y_1
          &  \mdif[2]{x}y_2
          &  \frac{<f>}{<a_3>}
        \end{vmatrix}
        \usingref{
          eq:<tag>-w,
          eq:<tag>-D1_x(y_1),
          eq:<tag>-D2_x(y_1),
          eq:<tag>-D1_x(y_2),
          eq:<tag>-D2_x(y_2)
        }
        = \dots
        \yesnumber\label{eq:<tag>-c_3'}
      \end{gather*}

      % Wronskiano
      \begin{gather*}
        W(y_1,y_2,y_3)
        = \det\begin{bmatrix}
             \mdif[0]{x}\,y_1
          &  \mdif[0]{x}\,y_2
          &  \mdif[0]{x}\,y_3
          \\ \mdif[1]{x}\,y_1
          &  \mdif[1]{x}\,y_2
          &  \mdif[1]{x}\,y_3
          \\ \mdif[2]{x}\,y_1
          &  \mdif[2]{x}\,y_2
          &  \mdif[2]{x}\,y_3
        \end{bmatrix}
        = 
        \usingref{
          eq:<tag>-D1_x(y_1),
          eq:<tag>-D2_x(y_1),
          eq:<tag>-D1_x(y_2),
          eq:<tag>-D2_x(y_2),
          eq:<tag>-D1_x(y_3),
          eq:<tag>-D2_x(y_3)
        }
        = \det\begin{bmatrix}
             <y_1>
          &  <y_2>
          &  <y_3>
          \\ \mdif[1]{x}\,y_1
          &  \mdif[1]{x}\,y_2
          &  \mdif[1]{x}\,y_3
          \\ \mdif[2]{x}\,y_1
          &  \mdif[2]{x}\,y_2
          &  \mdif[2]{x}\,y_3
        \end{bmatrix}
        \yesnumber\label{eq:<tag>-w}
      \end{gather*}

      % eq system
      \begin{gather*}
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
          } = \frac{<f>}{<a_3>}
        \end{Bmatrix}
        \yesnumber\label{eq:<tag>-eq_sytem}
      \end{gather*}

      % y_1',y_1",y_2',y_2",y_3',y_3"
      \begin{gather*}
        \mdif[1]{x}\,y_1
        = \mdif[1]{x}\,<y_1>
        \yesnumber\label{eq:<tag>-D_x(y_1)}
        %
        %
        ; \\[1ex]
        \mdif[2]{x}\,y_1
        = \mdif{x}{
          \dots
        }
        \yesnumber\label{eq:<tag>-D2_x(y_1)}
        %
        %
        %
        ; \\[1ex]
        \mdif[1]{x}\,y_2
        = \mdif[1]{x}\,<y_2>
        \yesnumber\label{eq:<tag>-D_x(y_2)}
        %
        %
        ; \\[1ex]
        \mdif[2]{x}\,y_2
        = \mdif{x}{
          \dots
        }
        \yesnumber\label{eq:<tag>-D2_x(y_2)}
        %
        %
        ; \\[1ex]
        \mdif[1]{x}\,y_3
        = \mdif[1]{x}\,<y_3>
        \yesnumber\label{eq:<tag>-D_x(y_3)}
        %
        %
        ; \\[1ex]
        \mdif[2]{x}\,y_3
        = \mdif{x}{
          \dots
        }
        \yesnumber\label{eq:<tag>-D2_x(y_3)}
      \end{gather*}
      ]],
      {
        tag_input = i(1, 'tag'),
        a_0_input = i(2,"a_0(x)"),
        a_1_input = i(3,"a_1(x)"),
        a_2_input = i(4,"a_2(x)"),
        a_3_input = i(5,"a_3(x)"),
        f_input = i(6,"f(x)"),
        y_1_input = i(7,"y_1(x)"),
        y_2_input = i(8,"y_2(x)"),
        y_3_input = i(9,"y_3(x)"),
        tag = rep(1),
        a_0 = rep(2),
        a_1 = rep(3),
        a_2 = rep(4),
        a_3 = rep(5),
        f = rep(6),
        y_1 = rep(7),
        y_2 = rep(8),
        y_3 = rep(9),
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
      % a_1 = <a_1_input>
      % a_2 = <a_2_input>
      %
      % f_{1,1} = <f_11_input>
      % f_{1,2} = <f_12_input>
      % f_{1,3} = <f_13_input>
      %
      % f_{2,1} = <f_21_input>
      % f_{2,2} = <f_22_input>
      % f_{2,3} = <f_23_input>

      % regra de crammer (sol sistema)
      \begin{gather*}
        \begin{Bmatrix}
             <a_1>\,<f_11> + <a_2>\,<f_12> = <f_13>
          \\ <a_1>\,<f_21> + <a_2>\,<f_22> = <f_23>
        \end{Bmatrix}
        \\
        \implies
        <a_1> = \frac{
          \begin{vmatrix}
            <f_13> & <f_12>
            \\
            <f_23> & <f_22>
          \end{vmatrix}
        }{
          \begin{vmatrix}
            <f_11> & <f_12>
            \\
            <f_21> & <f_22>
          \end{vmatrix}
        }
      \end{gather*}
      ]],
      {
        a_1_input = i(1,"a_1"),
        a_2_input = i(2,"a_2"),
        f_11_input = i(3,"f_{1,1}"),
        f_12_input = i(4,"f_{1,2}"),
        f_13_input = i(5,"f_{1,3}"),
        f_21_input = i(6,"f_{2,1}"),
        f_22_input = i(7,"f_{2,2}"),
        f_23_input = i(8,"f_{2,3}"),
        a_1 = rep(1),
        a_2 = rep(2),
        f_11 = rep(3),
        f_12 = rep(4),
        f_13 = rep(5),
        f_21 = rep(6),
        f_22 = rep(7),
        f_23 = rep(8)
      }
    )
  ),
  ms( -- Desenvolvimento EDO fator integrante
    {
      common = {
        name = "Desenvolvimento EDO com fator integrante",
        desc = {
          "f₁(x,y) dx + f₂(x,y) dy = 0",
          "φ(x,y) (fator integrante)"
        }
      },
      "formulas-AM3C-EDO-desenvolvimento-fator-integrante"
    },
      fmt(
      [[
      % f1:  <f1_input>
      % f2:  <f2_input>
      % φ:   <phi_input>
      \begin{gather*}
        <f1>\,\odif{x}
        + <f2>\,\odif{y}
        = 0
        ;\quad
        % ;\\
        \varphi(x,y)
        = <phi>
        %
        %
        %
        \implies \\
        \implies
        \left(<phi>\right)
        \left(<f1>\right)
        \,\odif{x}
        + 
        \left(<phi>\right)
        \left(<f2>\right)
        \,\odif{y}
        = 0
        %
        %
        %
        \implies \\
        \implies
        \pdv{}{y}
        \left(<phi>\right)
        \left(<f1>\right)
        =
        \pdv{}{x}
        \left(<phi>\right)
        \left(<f2>\right)
      \end{gather*}
      ]],
      {
        f1_input = i(1,'f_1'),
        f2_input = i(2,'f_2'),
        phi_input = i(3,'\\varphi'),
        f1 = rep(1),
        f2 = rep(2),
        phi = rep(3),
      }
    )
  )
}
