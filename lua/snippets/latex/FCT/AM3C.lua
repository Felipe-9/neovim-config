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
          "onde: 𝛗(x)=\\exp(Px{a(x)})",
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

      % y' + y( 
      %   <a> 
      % )
      % = <b>

      \answer{\eqref{eq:<tag> answer}}

      General solution
      \begin{tcolorbox}
        \begin{gather*}
          <y>
          = \frac{c_0}{\varphi(<x>)}
          + \frac{1  }{\varphi(<x>)}
          \,\prim_x{\left(
            <b>\,\varphi(<x>)
          \right)}
          %
          %
          %
          = \mathText{using 
            \eqref{eq:<tag> phi_x}
            \eqref{eq:<tag> prim}
          }
          = \frac{c_0}{\varphi(<x>)}
          + \frac{1  }{\varphi(<x>)}
          \,\prim_<x>{\left( <b>\,\varphi(<x>) \right)}
          %
          \yesnumber\label{eq:<tag> answer}
        \end{gather*}
      \end{tcolorbox}

      Finding \(\varphi(x)\)
      \begin{tcolorbox}
        \begin{gather*}
          \varphi(<x>) 
          = \exp{\left(
            \prim_<x>{\left(
              <a>
            \right)}
          \right)}
          = \exp{\left(
            \prim_<x>{\left(
              <a>
            \right)}
          \right)}
          %
          \yesnumber\label{eq:<tag> phi_x}
        \end{gather*}
      \end{tcolorbox}

      Integrating
      \begin{tcolorbox}
        \begin{gather*}
          \prim_x{\left(
            <b>\,\varphi(<x>)
          \right)}
          = \mathText{using \eqref{eq:<tag> phi_x}}
          = \prim_x{\left(
            <b>
            \,\varphi(<x>)
          \right)}
          %
          \yesnumber\label{eq:<tag> prim}
        \end{gather*}
      \end{tcolorbox}
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

      % y' + y(
      %   <a>
      % )
      % = y^{<k>} (
      %   <b>
      % )

      % \answer{\eqref{eq:<tag> answer}}

      General solution
      \begin{tcolorbox}
        \begin{gather*}
          y 
          = z^{1/(1-(<k>))}
          %
          \yesnumber\label{eq:<tag> y->>z}
          %
          = \\
          = \left(
            \frac{c_0}{\varphi(x)}
            + \frac{1}{\varphi(x)}
            \,\prim_x{(
              (1-(<k>))
              \,<b>
              \,\varphi(x)
            )}
          \right)^{1/(1-(<k>))}
          = \mathText{using
            \eqref{eq:<tag> phi_x}
            \eqref{eq:<tag> prim}
          }
          = \left(
            \frac{c_0}{\varphi(x)}
            + \frac{1}{\varphi(x)}
            \,\prim_x{(
              (1-(<k>))
              \,<b>
              \,\varphi(x)
            )}
          \right)^{1/(1-(<k>))}
          %
          \yesnumber\label{eq:<tag> answer}
        \end{gather*}
      \end{tcolorbox}

      Bernoulli's substitution
      \begin{tcolorbox}
        \begin{gather*}
          y' + <a>\,y = <b>\,y^{<k>}
          \implies \mathText{using \eqref{eq:<tag> y->>z}}
          \implies
          z' + (1-(<k>))<a>\,z = (1-(<k>))\,<b>
        \end{gather*}
      \end{tcolorbox}

      Finding \(\varphi(x)\)
      \begin{tcolorbox}
        \begin{gather*}
          \varphi(x)
          = \exp{\left(
            \prim_x{(
              (1-(<k>))
              \,<a>
            )}
          \right)}
          %
          \yesnumber\label{eq:<tag> phi_x}
        \end{gather*}
      \end{tcolorbox}

      Integrating
      \begin{tcolorbox}
        \begin{gather*}
          \prim_x{\left(
            (1-(<k>))
            \,<b>
            \,\varphi(x)
          \right)}
          = \mathText{using \eqref{eq:<tag> phi_x}}
          = \prim_x{\left(
            (1-(<k>))
            \,<b>
            \,\varphi(x)
          \right)}
          %
          \yesnumber\label{eq:<tag> prim}
        \end{gather*}
      \end{tcolorbox}
      ]],
      {
        tag_input = i(1, 'tag'),
        a_input   = i(2, "a(x)"),
        b_input   = i(3, "b(x)"),
        k_input   = i(4, "k"),
        tag = rep(1),
        a   = rep(2),
        b   = rep(3),
        k   = rep(4),
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

      % y' + y(
      %   <a>
      % )
      % = <b>
      % + y^2(
      %   <c>
      % )

      % \answer{\eqref{eq:<tag> answer}}

      General solution
      \begin{tcolorbox}
        \begin{gather*}
          y
          = <y_1> + z^{-1}
          %
          \yesnumber\label{eq:<tag> y->>z}
          %
          = \\
          = <y_1> + \left(
            \frac{c_0}{\varphi(x)}
            + \frac{1}{\varphi(x)}
            \,\prim_x{\left(
              -<c>
              \,\varphi(x)
            \right)}
          \right)^{-1}
          = \mathText{using
            \eqref{eq:<tag> phi_x}
            \eqref{eq:<tag> prim}
          }
          = <y_1> + \left(
            \frac{c_0}{\varphi(x)}
            + \frac{1}{\varphi(x)}
            \,\prim_x{\left(
              -<c>
              \,\varphi(x)
            \right)}
          \right)^{-1}
          %
          \yesnumber\label{eq:<tag> answer}
        \end{gather*}
      \end{tcolorbox}

      Riccati substitution
      \begin{tcolorbox}
        \begin{gather*}
          y' + <a>\,y = <b> + <c>\,y^2
          \implies \mathText{using \eqref{eq:<tag> y->>z}}
          \implies
          z' + (2\,<c>\,<y_1> - <a>)\,z 
          = -<c>
        \end{gather*}
      \end{tcolorbox}

      Finding \(\varphi(x)\)
      \begin{tcolorbox}
        \begin{gather*}
          \varphi(x)
          = \exp{\left(
            \prim_x{\left(
              (2\,<c>\,<y_1>-<a>)
            \right)}
          \right)}
          %
          \yesnumber\label{eq:<tag> phi_x}
        \end{gather*}
      \end{tcolorbox}
      
      Integrating
      \begin{tcolorbox}
        \begin{gather*}
          \prim_x{\left(
            -<c>
            \,\varphi(x)
          \right)}
          = \mathText{using \eqref{eq:<tag> phi_x}}
          = \prim_x{\left(
            -<c>
            \,\varphi(x)
          \right)}
          %
          \yesnumber\label{eq:<tag> prim}
        \end{gather*}
      \end{tcolorbox}
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
      % φ(x) = <phi_x_input>

      % y ( <P> ) = 0

      \answer{\eqref{eq:<tag> answer}}

      General Solution
      \begin{tcolorbox}
        \begin{gather*}
          y 
          = \varphi(x)\,\prim_x{(z)}
          = <phi_x>\,\prim_x{(z)}
          %
          \yesnumber\label{eq:<tag> y->>z}
          %
          = \mathText{using \eqref{eq:<tag> z}}
          = <phi_x>\,\prim_x{\left(
            z
          \right)}
          %
          \yesnumber\label{eq:<tag> answer}
        \end{gather*}
      \end{tcolorbox}

      Substitution \(y \to z\)
      \begin{tcolorbox}
        \begin{gather*}
          P(x)\,y 
          = \mathText{using \eqref{eq:<tag> y->>z}}
          = <P>
          \,(
            y
          )
          = \mathText{using 
            \eqref{eq:<tag> D1x(y)}
            \eqref{eq:<tag> D2x(y)}
          }
          = 0
          %
          \yesnumber\label{eq:<tag> eq z}
        \end{gather*}
      \end{tcolorbox}

      Finding \(
        \mdif{x}{y},
        \mdif[2]{x}{y}
      \)
      \begin{tcolorbox}
        \begin{gather*}
          \mdif{x}{y}
          = \mdif{x}{(
            <phi_x>\,\prim_x{(z)}
          )}
          = \mdif{x}{(
            <phi_x>\,\prim_x{(z)}
          )}
          %
          \yesnumber\label{eq:<tag> D1x(y)}
          %
          %
          %
          ;\\
          \mdif[2]{x}{y}
          = \mathText{using \eqref{eq:<tag> D1x(y)}}
          = \mdif{x}{\left(
            \mdif{x}{y}
          \right)}
          %
          \yesnumber\label{eq:<tag> D2x(y)}
          % %
          % %
          % %
          % ;\\
          % \mdif[3]{x}{y}
          % = \mathText{using \eqref{eq:<tag> D2x(y)}}
          % = \mdif{x}{\left(
          %   \mdif[2]{x}{y}
          % \right)}
          % %
          % \yesnumber\label{eq:<tag> D3x(y)}
        \end{gather*}
      \end{tcolorbox}

      Solving \eqref{eq:<tag> eq z}
      \begin{tcolorbox}
        \begin{gather*}
          z
          %
          \yesnumber\label{eq:<tag> z}
        \end{gather*}
      \end{tcolorbox}
      ]],
      {
        tag_input   = i(1,'tag'),
        P_input     = i(2,"P"),
        phi_x_input = i(3,"\\varphi(x)"),
        tag   = rep(1),
        P     = rep(2),
        phi_x = rep(3),
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
      \begin{tcolorbox}
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
      \end{tcolorbox}
      ]],
      {}
    )
  ),
  ms( -- Solucoes para metodo da variacao das constantes arb para eq lin de ord 1
    {
      common = {
        name = "Metodo da variacao das constantes arb para eq lin (1)",
        desc = "Soluções para equações lineares de ordem 1",
      },
      "\\formulas-AM3C-solve-linear-equation-ord-2-metodo-var-das-const-arb",
    },
    fmt(
      [[
      % tag  = <tag_input>
      % a(x) = <a_input>
      % b(x) = <b_input>


      \answer{\eqref{eq:<tag> answer}}

      General Solution
      \begin{tcolorbox}
        \begin{gather*}
          y
          = \frac{C(x)}{\varphi(x)}
          %
          \yesnumber\label{eq:<tag> y(x C(x))}
          %
          = \mathText{using
            \eqref{eq:<tag> C(x)}
            \eqref{eq:<tag> phi_x}
          }
          = \frac{
            C(x)
          }{
            \varphi(x)
          }
        \end{gather*}
      \end{tcolorbox}

      Finding \(C(x)\)
      \begin{tcolorbox}
        \begin{gather*}
          y' + <a>\,y 
          = \mathText{using \eqref{eq:<tag> phi_x}}
          = \mdif{x}{(
            \frac{C(x)}{
              \varphi(x)
            }
          )}
          + <a>
          \,\frac{C(x)}{
            \varphi(x)
          }
          = <b>
          %
          %
          %
          \implies
          C' 
          = \dots
          %
          %
          %
          \implies \\
          \implies
          C(x) 
          = \dots
          %
          \yesnumber\label{eq:<tag> C(x)}
        \end{gather*}
      \end{tcolorbox}

      Finding \(\varphi(x)\)
      \begin{tcolorbox}
        \begin{gather*}
          \varphi(x)
          = \exp{\left(
            \prim_x{\left(
              <a>
            \right)}
          \right)}
          = \exp{\left(
            \prim_x{\left(
              <a>
            \right)}
          \right)}
          %
          \yesnumber\label{eq:<tag> phi_x}
        \end{gather*}
      \end{tcolorbox}
      ]], {
        tag_input = i(1,"tag"),
        a_input   = i(2,"a(x)"),
        b_input   = i(3,"b(x)"),
        tag = rep(1),
        a   = rep(2),
        b   = rep(3),
      }
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

      %  y:
      %  \begin{pmatrix}
      %         <a_0>
      %    \\ + <a_1>\,\mdif[1]{x}
      %    \\ + <a_2>\,\mdif[2]{x}
      %  \end{pmatrix}
      %  \,y
      %  = <f>

      \answer{\eqref{eq:<tag> answer}}

      General solution
      \begin{tcolorbox}
        \begin{gather*}
          y
          = c_1(x)\,y_1(x)
          + c_2(x)\,y_2(x)
          = \mathText{using 
            \eqref{eq:<tag> c_1}
            \eqref{eq:<tag> c_2}
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
          %
          \yesnumber\label{eq:<tag> answer}
        \end{gather*}
      \end{tcolorbox}

      Finding \(y_1,y_2\)
      \begin{tcolorbox}
        \begin{gather*}
          \begin{cases}
            y_1 = <y_1>
            \\
            y_2 = <y_2>
          \end{cases}
          %
          \yesnumber\label{eq:<tag> y_1 y_2}
        \end{gather*}
      \end{tcolorbox}

      Finding \(c_1,c_2\)
      \begin{tcolorbox}
        \begin{gather*}
          c_1(x) 
          = \int{c_1'(x)\,\odif{x}}
          = \mathText{Using \eqref{eq:<tag> c_1'}}
          = \dots
          %
          \yesnumber\label{eq:<tag> c_1}
          %
          %
          ; \\[1ex]
          c_2(x) 
          = \int{c_2'(x)\,\odif{x}}
          = \mathText{Using \eqref{eq:<tag> c_2'}}
          = \dots
          %
          \yesnumber\label{eq:<tag> c_2}
        \end{gather*}
      \end{tcolorbox}

      \solving \(\mdif[1]{x}{(c_1,c_2)}\)
      \begin{tcolorbox}
        \begin{gather*}
          \mathText{Using \eqref{eq:<tag> eq_sytem}}
          c_1'(x)
          = \frac{1}{W(y_1,y_2)}
          \,\begin{vmatrix}
            0 
            &  \mdif[0]{x}y_2
            \\ \frac{<f>}{<a_2>}
            &  \mdif[1]{x}y_2
          \end{vmatrix}
          = \mathText{using 
            \eqref{eq:<tag> w}
            \eqref{eq:<tag> D_x(y_2)}
          }
          = \dots
          %
          \yesnumber\label{eq:<tag> c_1'}
          %
          %
          %
          ; \\[2ex]
          \mathText{Using \eqref{eq:<tag> eq_sytem}}
          c_2'(x)
          = \frac{1}{W(y_1,y_2)}
          \,\begin{vmatrix}
               \mdif[0]{x}y_1
            &  0 
            \\ \mdif[1]{x}y_1
            &  \frac{<f>}{<a_2>}
          \end{vmatrix}
          = \mathText{using 
            \eqref{eq:<tag> w}
            \eqref{eq:<tag> D_x(y_1)}
          }
          = \dots
          %
          \yesnumber\label{eq:<tag> c_2'}
        \end{gather*}
      \end{tcolorbox}

      Solving Wronskiano
      \begin{tcolorbox}
        \begin{gather*}
          W(y_1,y_2)
          = \det\begin{bmatrix}
               \mdif[0]{x}\,y_1
            &  \mdif[0]{x}\,y_2
            \\ \mdif[1]{x}\,y_1
            &  \mdif[1]{x}\,y_2
          \end{bmatrix}
          = \mathText{using 
            \eqref{eq:<tag> D_x(y_1)}
            \eqref{eq:<tag> D_x(y_2)}
          }
          = \det\begin{bmatrix}
               <y_1>
            &  <y_2>
            \\ \mdif[1]{x}\,y_1
            &  \mdif[1]{x}\,y_2
          \end{bmatrix}
          %
          \yesnumber\label{eq:<tag> w}
        \end{gather*}
      \end{tcolorbox}

      Crammers equation system
      \begin{tcolorbox}
        \begin{gather*}
          \begin{Bmatrix}
            {
                c_1'(x)\,\mdif[0]{x}\,y_1(x) 
              + c_2'(x)\,\mdif[0]{x}\,y_2(x)
            } &=& 0
            \\ {
                c_1'(x)\,\mdif[1]{x}\,y_1(x) 
              + c_2'(x)\,\mdif[1]{x}\,y_2(x)
            } &=& \frac{<f>}{<a_2>}
          \end{Bmatrix}
          %
          \yesnumber\label{eq:<tag> eq_sytem}
        \end{gather*}
      \end{tcolorbox}

      Solving \(\mdif[1]{x}{(y_1,y_2)}\)
      \begin{tcolorbox}
        \begin{gather*}
          \mdif[1]{x}\,y_1
          = \mdif[1]{x}\,<y_1>
          %
          \yesnumber\label{eq:<tag> D_x(y_1)}
          %
          %
          ; \\[1ex]
          \mdif[1]{x}\,y_2
          = \mdif[1]{x}\,<y_2>
          %
          \yesnumber\label{eq:<tag> D_x(y_2)}
        \end{gather*}
      \end{tcolorbox}
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

      % \begin{pmatrix}
      %     <a_0>
      %   \\ + <a_1>\,\mdif[1]{x}
      %   \\ + <a_2>\,\mdif[2]{x}
      %   \\ + <a_3>\,\mdif[3]{x}
      % \end{pmatrix}
      % \,y
      % = <f>

      General solution
      \begin{tcolorbox}
        \begin{gather*}
          y
          = y_1(x)\,c_1(x)
          + y_2(x)\,c_2(x)
          + y_3(x)\,c_3(x)
          = \mathText{using 
            \eqref{eq:<tag> y_1 y_2 y_3}
            \eqref{eq:<tag> c_1}
            \eqref{eq:<tag> c_2}
            \eqref{eq:<tag> c_3}
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
      \end{tcolorbox}

      Solving \(y_1,y_2,y_3\)
      \begin{tcolorbox}
        \begin{gather*}
          \begin{cases}
            y_1 = <y_1>
            \\
            y_2 = <y_2>
            \\
            y_3 = <y_3>
          \end{cases}
          %
          \yesnumber\label{eq:<tag> y_1 y_2 y_3}
        \end{gather*}
      \end{tcolorbox}

      Solving \(c_1,c_2,c_3\)
      \begin{tcolorbox}
        \begin{gather*}
          c_1(x) 
          = \int{c_1'(x)\,\odif{x}}
          = \mathText{Using \eqref{eq:<tag> c_1'}}
          = \dots
          %
          \yesnumber\label{eq:<tag> c_1}
          %
          %
          %
          ; \\[1ex]
          c_2(x) 
          = \int{c_2'(x)\,\odif{x}}
          = \mathText{Using \eqref{eq:<tag> c_2'}}
          = \dots
          %
          \yesnumber\label{eq:<tag> c_2}
          %
          %
          %
          ; \\[1ex]
          c_3(x) 
          = \int{c_3'(x)\,\odif{x}}
          = \mathText{Using \eqref{eq:<tag> c_3'}}
          = \dots
          %
          \yesnumber\label{eq:<tag> c_3}
        \end{gather*}
      \end{tcolorbox}

      Finding \(\mdif[1]{x}{(c_1,c_2,c_3)}\)
      \begin{tcolorbox}
        \begin{gather*}
          \mathText{Using \eqref{eq:<tag> eq_sytem}}
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
          = \mathText{Using
            \eqref{eq:<tag> w}
            \eqref{eq:<tag> D1_x(y_2)}
            \eqref{eq:<tag> D2_x(y_2)}
            \eqref{eq:<tag> D1_x(y_3)}
            \eqref{eq:<tag> D2_x(y_3)}
          }
          = \dots
          %
          \yesnumber\label{eq:<tag> c_1'}
          % 
          % 
          % 
          ; \\[3ex]
          \mathText{Using \eqref{eq:<tag> eq_sytem}}
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
          = \mathText{Using 
            \eqref{eq:<tag> w}
            \eqref{eq:<tag> D1_x(y_1)}
            \eqref{eq:<tag> D2_x(y_1)}
            \eqref{eq:<tag> D1_x(y_3)}
            \eqref{eq:<tag> D2_x(y_3)}
          }
          = \dots
          %
          \yesnumber\label{eq:<tag> c_2'}
          %
          %
          %
          \mathText{Using \eqref{eq:<tag> eq_sytem}}
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
          = \mathText{Using 
            \eqref{eq:<tag> w}
            \eqref{eq:<tag> D1_x(y_1)}
            \eqref{eq:<tag> D2_x(y_1)}
            \eqref{eq:<tag> D1_x(y_2)}
            \eqref{eq:<tag> D2_x(y_2)}
          }
          = \dots
          %
          \yesnumber\label{eq:<tag> c_3'}
        \end{gather*}
      \end{tcolorbox}

      Solving Wronskiano
      \begin{tcolorbox}
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
          = \mathText{using 
            \eqref{eq:<tag> D1_x(y_1)}
            \eqref{eq:<tag> D2_x(y_1)}
            \eqref{eq:<tag> D1_x(y_2)}
            \eqref{eq:<tag> D2_x(y_2)}
            \eqref{eq:<tag> D1_x(y_3)}
            \eqref{eq:<tag> D2_x(y_3)}
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
          %
          \yesnumber\label{eq:<tag> w}
        \end{gather*}
      \end{tcolorbox}

      Crammer's equation system
      \begin{tcolorbox}
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
          %
          \yesnumber\label{eq:<tag> eq_sytem}
        \end{gather*}
      \end{tcolorbox}

      Solving \((\mdif[1]{x},\mdif[2]{x})(y_1,y_2,y_3)\)
      \begin{tcolorbox}
        \begin{gather*}
          \mdif[1]{x}\,y_1
          = \mdif[1]{x}\,<y_1>
          \yesnumber\label{eq:<tag> D_x(y_1)}
          %
          %
          ; \\[1ex]
          \mdif[2]{x}\,y_1
          = \mdif{x}{
            \dots
          }
          \yesnumber\label{eq:<tag> D2_x(y_1)}
          %
          %
          %
          ; \\[1ex]
          \mdif[1]{x}\,y_2
          = \mdif[1]{x}\,<y_2>
          \yesnumber\label{eq:<tag> D_x(y_2)}
          %
          %
          ; \\[1ex]
          \mdif[2]{x}\,y_2
          = \mdif{x}{
            \dots
          }
          \yesnumber\label{eq:<tag> D2_x(y_2)}
          %
          %
          ; \\[1ex]
          \mdif[1]{x}\,y_3
          = \mdif[1]{x}\,<y_3>
          \yesnumber\label{eq:<tag> D_x(y_3)}
          %
          %
          ; \\[1ex]
          \mdif[2]{x}\,y_3
          = \mdif{x}{
            \dots
          }
          %
          \yesnumber\label{eq:<tag> D2_x(y_3)}
        \end{gather*}
      \end{tcolorbox}
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

      Crammer's rule solution system
      \begin{tcolorbox}
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
      \end{tcolorbox}
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
  ms( -- method of linear equation of constant coeficients yP = fi(x)
    {
      common = {
        name = "Method of linear equation of constant coefficients P y = ∑fᵢ(x)",
        desc = [[
          Solve: Pₓ y = ∑f(x)
          Case 1: fᵢ(x) = e^{α x} Pₖ(x) (polynom of order k)
          Case 2: fᵢ(x) = e^{α x} (a cos(w x) + b sin(w x))
        ]]
      },
      "AM3C-differential-equation-solution-Method-linear-equation-constant-coeff-Py=f(x)",
      "AM3C-diffeq-method-lineq-const",
      "AM3C-lineq-const-solve:Py=f"
    },
    fmt(
      [[
      % tag   = <tag_input>
      % P     = <P_input>

      \answer{\eqref{eq:<tag> answer}}

      General solution for \(y\)
      \begin{tcolorbox}
        \begin{gather*}
          y
          = y_h 
          + \bar{y}
          = \mathText{using 
            \eqref{eq:<tag> bar y}
            \eqref{eq:<tag> mapped roots for y_h}
          }
          = y_h 
          + \bar{y}
          %
          \yesnumber\label{eq:<tag> answer}
        \end{gather*}
      \end{tcolorbox}

      % solve bar y here

      Mapping roots of \eqref{eq:<tag> roots of y_h} to solution
      \begin{tcolorbox}
        \begin{gather*}
          \begin{cases}
            r_i = \alpha_i
            \implies
            e^{\alpha_i\,x}
            \,(c_0+c_1\,x+\dots)
            ;\\
            r_i = \alpha_i \pm i\,\beta_i
            \implies
            e^{r_i\,x}
            \begin{pmatrix}
              \cos(\beta_i\,x)
              \,(c_0+c_1\,x+\dots)
              \\
              \sin(\beta_i\,x)
              \,(c_2+c_3\,x+\dots)
            \end{pmatrix}
          \end{cases}
          %
          \yesnumber\label{eq:<tag> mapped roots for y_h}
        \end{gather*}
      \end{tcolorbox}

      Roots for characteristic equation for \(y_h\)
      \begin{tcolorbox}
        \begin{gather*}
          P
          = <P>
          \implies \mathText{\(\mdif[i]{x} \to r^i\)}
          \implies
          <P>
          = 0
          \implies
          \begin{cases}
            r_0 = \dots
          \end{cases}
          %
          \yesnumber\label{eq:<tag> roots of y_h}
        \end{gather*}
      \end{tcolorbox}
      ]], {
        tag_input = i(1,'tag'),
        P_input   = i(2,"P"),
        tag = rep(1),
        P   = rep(2),
      }
    )
  ),
  ms( -- auxiliar snippet for method of linear equation of constant coefficients fi(x)
    {
      common = {
        name = 'Auxiliar snip for method of lineq of constcoeff for yP = ∑fᵢ(x)',
        desc = [[
          solve y\,Pₓ = Pₖ(x) (polynom ord:k)
        ]]
      },
      "AM3C-diffeq-gensol-method-lineq-constcoeff-aux.1-yP=Pk"
    },
    fmt(
      [[
      % tag   = <tag_input>
      % i     = <i_input>
      % P     = <P_input>
      % alpha = <alpha_input>
      % Pk    = <Pk_input>
      % k     = <k_input>

      % y
      % (<P>)
      % = e^{<alpha> x}
      % ( <Pk> )
      
      Finding \(\bar{y}<i>\)
      \begin{tcolorbox}
        \begin{gather*}
          \bar{y}<i>
          = x^p
          \,e^{<alpha>\,x}
          \,Q_<k>(x)
          = x^p
          \,e^{<alpha>\,x}
          \,\sum_{i=0}^{<k>}{
            \rho_i\,x^i
          }
          = x^p
          \,e^{<alpha>\,x}
          \,(
              x^0\,\rho_0
            + x^1\,\rho_1
            + x^2\,\rho_2
            + x^3\,\rho_3
            + x^4\,\rho_4
          )
          %
          \yesnumber\label{eq:<tag> bar y<i> (const)}
          = \mathText{using \eqref{eq:<tag> const of bar y<i>}}
          = x^p
          \,e^{<alpha>\,x}
          \,(
              x^0\,\rho_0
            + x^1\,\rho_1
            + x^2\,\rho_2
            + x^3\,\rho_3
            + x^4\,\rho_4
          )
          %
          \yesnumber\label{eq:<tag> bar y<i>}
        \end{gather*}
      \end{tcolorbox}

      Finding constants of \eqref{eq:<tag> bar y<i> (const)}
      \begin{tcolorbox}
        \begin{gather*}
          \bar{y}<i>\,P
          = x^p
          \,\left(
              x^0\,\rho_0
            + x^1\,\rho_1
            + x^2\,\rho_2
            + x^3\,\rho_3
            + x^4\,\rho_4
          \right)
          \,\left(
            <P>
          \right)
          = \\
          = <Pk>
          \implies \\
          \begin{cases}
            %
            & \implies \rho_0 = 
            \\
            %
            & \implies \rho_1 = 
          \end{cases}
          %
          \yesnumber\label{eq:<tag> const of bar y<i>}
        \end{gather*}
      \end{tcolorbox}
      ]], {
        tag_input   = i(1,'tag'),
        i_input     = i(2,'_i'),
        P_input     = i(3,'P'),
        alpha_input = i(4,"\\alpha"),
        Pk_input    = i(5,"P_k(x)"),
        k_input     = i(6,'k'),
        tag   = rep(1),
        i     = rep(2),
        P     = rep(3),
        alpha = rep(4),
        Pk    = rep(5),
        k     = rep(6),
      }
    )
  ),
  ms( -- auxiliar snippet for method of linear equation of constant coefficients fi(x)
    {
      common = {
        name = 'Auxiliar snip for method of lineq of constcoeff for yP = e^{α x} (a cos(w x) + b sin(w x))',
        desc = [[
          solve y\,Pₓ = e^{α x} (a cos(w x) + b sin(w x))
        ]]
      },
      "AM3C-diffeq-gensol-method-lineq-constcoeff-aux.2-yP=acos(wx)+bsin(wx)"
    },
    fmt(
      [[
      % tag = <tag_input>
      % i = <i_input>
      % P = <P_input>
      % alpha = <alpha_input>
      % a = <a_input> 
      % b = <b_input>
      % w = <w_input>

      % y (<P>)
      % = e^{<alpha> x}(
      %   <a> cos(<w> x)
      % + <b> sin(<w> x)
      % )
      
      Finding \(\bar{y}<i>\)
      \begin{tcolorbox}
        \begin{gather*}
          \bar{y}<i>
          = x^p
          \,e^{<alpha>\,x}
          \,(
            a_0\,\cos(<w>\,x)
            + b_0\,\sin(<w>\,x)
          )
          %
          \yesnumber\label{eq:<tag> bar y<i> (const)}
          = \mathText{using \eqref{eq:<tag> const of bar y<i>}}
          = x^p
          \,e^{<alpha>\,x}
          \,(
            a_0\,\cos(<w>\,x)
            + b_0\,\sin(<w>\,x)
          )
          %
          \yesnumber\label{eq:<tag> bar y<i>}
        \end{gather*}
      \end{tcolorbox}

      Finding constants of \eqref{eq:<tag> bar y<i> (const)}
      \begin{tcolorbox}
        \begin{gather*}
          \bar{y}<i>\,P
          = x^p
          \,(
            a_0\,\cos(<w>\,x)
            + b_0\,\sin(<w>\,x)
          )
          \,P
          = x^p
          \,(
            a_0\,\cos(<w>\,x)
            + b_0\,\sin(<w>\,x)
          )
          \,\left(
            <P>
          \right)
          = \\
          = <a>\,\cos(<w>\,x)
          + <b>\,\sin(<w>\,x)
          \implies \\
          \begin{cases}
            %
            & \implies a_0 = 
            \\
            %
            & \implies b_0 = 
          \end{cases}
          %
          \yesnumber\label{eq:<tag> const of bar y<i>}
        \end{gather*}
      \end{tcolorbox}
      ]], {
        tag_input   = i(1,'tag'),
        i_input     = i(2,'_i'),
        P_input     = i(3,'P'),
        alpha_input = i(4,"\\alpha"),
        a_input     = i(5,'a'),
        b_input     = i(6,'b'),
        w_input     = i(7,'w'),
        tag   = rep(1),
        i     = rep(2),
        P     = rep(3),
        alpha = rep(4),
        a     = rep(5),
        b     = rep(6),
        w     = rep(7),
      }
    )
  ),
  ms( -- Eulers equation
    {
      common = {
        name = "Diffeq solution using Eulers equation",
        desc = [[
          Using x -> e^t
          ∑aᵢxⁱDⁱx(y) = P*y = f(x)
          becomes
          ∑bᵢDⁱt(y) = f(e^t)
          Which can be solved using lineq of constcoeff method
        ]]
      },
      "AM3C-diffeq-Eulers-equation-n"
    },
    fmt(
      [[
      % Solve using method of lineq constcoeff
      % remember to substitute x->>t s/x/t/gc

      % General solution of \eqref{eq:<tag> eulers eq}

      % tag = <tag_input>
      % P = <P_input>
      % f(x) = <f_input>

      % y ( <P> )
      % = <f>

      \answer{\eqref{eq<tag> answer}}

      Finding linear equation of constant coefficients using euler's equation
      \begin{tcolorbox}
        \begin{gather*}
          <P>
          = \mathText{using
            \eqref{eq:<tag> D123x(y)}
            , \(x \to e^t\)
          }
          = <P>
          %
          \yesnumber\label{eq:<tag> eulers eq}
        \end{gather*}
      \end{tcolorbox}

      Finding \(
        \mdif[1]{x}{y},
        \mdif[2]{x}{y},
        \mdif[3]{x}{y}
      \)
      \begin{tcolorbox}
        \begin{gather*}
          \begin{cases}
            \mdif[1]{x}{y}
            = \frac{1}{x}\mdif[1]{t}{y}
            ; \\
            \mdif[2]{x}{y}
            = \mdif[1]{x}{\left(
                \frac{1}{x}\mdif[1]{t}{y}
            \right)}
            =
            - \frac{1}{x^2}\mdif[1]{t}{y}
            + \frac{1}{x}\mdif[2]{t}{y}\mdif[1]{x}{t}
            =
            \frac{1}{x^2}(
              - \mdif[1]{t}{y}
              + \mdif[2]{t}{y}
            )
            ; \\
            \mdif[3]{x}{y}
            = \mdif[1]{x}{\left(
              \frac{1}{x^2}(
                - \mdif[1]{t}{y}
                + \mdif[2]{t}{y}
              )
            \right)}
            = \\
            =
            - \frac{2}{x^3}\left(
              - \mdif[1]{t}{y}
              + \mdif[2]{t}{y}
            \right)
            + \frac{1}{x^2}\left(
              - \mdif[2]{t}{y}\mdif[1]{x}{t}
              + \mdif[3]{t}{y}\mdif[1]{x}{t}
            \right)
            = \\
            = \frac{1}{x^3}\left(
              + 2\,\mdif[1]{t}{y}
              - 3\,\mdif[2]{t}{y}
              + \mdif[3]{t}{y}
            \right)
          \end{cases}
          %
          \yesnumber\label{eq:<tag> D123x(y)}
        \end{gather*}
      \end{tcolorbox}
      ]],{
        tag_input = i(1,"tag"),
        P_input   = i(2,"P"),
        f_input   = i(3,"f(x)"),
        tag = rep(1),
        P   = rep(2),
        f   = rep(3)
      }
    )
  ),
  ms( -- Potential function of an Exact differential equation
    {
      common = {
        name = "Potential function of an exact diff equation",
        desc = [[
          u(x,y) dx + v(x,y) dy = 0
          f(x) = Px(u) = Py(v)
        ]]
      },
      "AM3C-potfun-exactdiffeq",
      "AM3C-potential-function-of-exact-differential-equation"
    },
    fmt(
      [[
      % tag = <tag_input>
      % u = <u_input>
      % v = <v_input>

      \answer{\eqref{eq:<tag> answer}}

      Finding potential function \(f(x)\)
      \begin{tcolorbox}
        \begin{gather*}
          f(x) 
          = \prim_x(u)
          = \prim_y(v)
          = \mathText{using
            \eqref{eq:<tag> Px(u)}
            \eqref{eq:<tag> Py(v)}
          }
          = \dots
          %
          \yesnumber\label{eq:<tag> answer}
        \end{gather*}
      \end{tcolorbox}

      Solving \(\prim_x{u},\prim_y{v}\)
      \begin{tcolorbox}
        \begin{gather*}
          \prim_x{u}
          = \prim_x{\left(
            <u>
          \right)}
          = 
          %
          \yesnumber\label{eq:<tag> Px(u) const}
          %
          = \mathText{using 
            \eqref{eq:<tag> const ci of Px(u)}
            \eqref{eq:<tag> const cj of Px(u)}
          }
          = \dots
          %
          \yesnumber\label{eq:<tag> Px(u)}
          %
          %
          %
          ; \\
          \prim_y{v}
          = \prim_y{\left(
            <v>
          \right)}
          = 
          %
          \yesnumber\label{eq:<tag> Py(v) const}
          %
          = \mathText{using 
            \eqref{eq:<tag> const ci of Py(v)}
            \eqref{eq:<tag> const cj of Py(v)}
          }
          = \dots
          %
          \yesnumber\label{eq:<tag> Py(v)}
        \end{gather*}
      \end{tcolorbox}

      Finding constants in
      \eqref{eq:<tag> Px(u) const}
      \eqref{eq:<tag> Py(v) const}
      \begin{tcolorbox}
        \begin{gather*}
          u
          = <u>
          = \pdv{}{x}{\prim_y{v}}
          = \mathText{using \eqref{eq:<tag> Py(v) const}}
          = \dots
          %
          \yesnumber\label{eq:<tag> const ci of Px(u)}
          %
          %
          ; \\
          v
          = <v>
          = \pdv{}{y}{\prim_x{u}}
          = \mathText{using \eqref{eq:<tag> Px(u) const}}
          = 
          %
          \yesnumber\label{eq:<tag> const ci of Py(v)}
          %
          %
          ; \\
          f(x)
          = \prim_x{u}
          = \mathText{using
            \eqref{eq:<tag> Px(u) const}
            \eqref{eq:<tag> const ci of Px(u)}
          }
          = \dots
          %
          %
          = \prim_y{v}
          = \mathText{using
            \eqref{eq:<tag> Py(v) const}
            \eqref{eq:<tag> const ci of Py(v)}
          }
          = \dots
          \implies \\
          \implies
          \dots
          %
          \yesnumber\label{eq:<tag> const cj of Px(u)}
        \end{gather*}
      \end{tcolorbox}
      ]],{
        tag_input = i(1,'tag'),
        u_input   = i(2,'u(x,y)'),
        v_input   = i(3,'v(x,y)'),
        tag = rep(1),
        u   = rep(2),
        v   = rep(3),
      }
    )
  ),
  ms( -- checking if differential equation is exact
    {
      common = {
        name = "exact differential equation check" ,
        desc = [[
          checks if diffeq is exact
          ∂∂x(u) == ∂∂y(v)
        ]]
      },
      "AM3C-check-if-is-exact-diffeq",
    },
    fmt(
      [[
      % tag = <tag_input>
      % u = <u_input>
      % v = <v_input>

      Checking if \eqref{eq:<tag> eqdiff} is exact
      \begin{tcolorbox}
        \begin{gather*}
          \pdv{u}{y}
          = \pdv{}{y}{\left(
            <u>
          \right)}
          = \dots
          = \\
          = \pdv{v}{x}
          = \pdv{}{x}{\left(
            <v>
          \right)}
          = \dots
        \end{gather*}
        \eqref{eq:<tag> eqdiff} is/is not exact
      \end{tcolorbox}
      ]],{
        tag_input = i(1,'tag'),
        u_input   = i(2,'u(x,y)'),
        v_input   = i(3,'v(x,y)'),
        tag = rep(1),
        u   = rep(2),
        v   = rep(3),
      }
    )
  ),
  ms( -- finding integrating factor for non exact diffeq
    {
      common = {
        name = "Integrating factor for non-exact differential equation",
        desc = [[
          ϕ(x,y): ∂∂x(ϕ*u) = ∂∂y(ϕ*v)
        ]]
      },
      "AM3C-integrating-factor-for-non-exact-diffeq",
      "AM3C-intfactor-nexact-diffeq"
    },
    fmt(
      [[
      % tag = <tag_input>
      % u = <u_input>
      % v = <v_input>

      %   dx ( <u> )
      % + dy ( <v> )
      % = 0

      \answer{\eqref{eq:<tag> phii}}

      Finding integrating factor \(\phi_i(x,y)\)
      \begin{tcolorbox}
        \begin{gather*}
          \phi_1(x,y)
          = \exp{\left(
            \prim_x{\left(
              \frac{
                \pdv{v}{x}
                -\pdv{u}{y}
              }{
                u
              }
            \right)}
          \right)}
          = \mathText{using 
            \eqref{eq:<tag> ddx(v)}
            \eqref{eq:<tag> ddy(u)}
          }
          = \exp{\left(
            \prim_x{\left(
              \frac{
                \pdv{v}{x}
                -
                \pdv{u}{y}
              }{
                <u>
              }
            \right)}
          \right)}
          = \dots
          % 
          \yesnumber\label{eq:<tag> phi1}
          % 
          % 
          ; \\
          \phi_2(x,y)
          = \exp{\left(
            \prim_y{\left(
              \frac{
                \pdv{u}{y}
                -\pdv{v}{x}
              }{
                v
              }
            \right)}
          \right)}
          = \mathText{using 
            \eqref{eq:<tag> ddx(v)}
            \eqref{eq:<tag> ddy(u)}
          }
          = \exp{\left(
            \prim_y{\left(
              \frac{
                \pdv{u}{y}
                -\pdv{v}{x}
              }{
                <v>
              }
            \right)}
          \right)}
          %
          \yesnumber\label{eq:<tag> phi2}
        \end{gather*}
      \end{tcolorbox}

      Solving \(\pdv{u}{y},\pdv{v}{x}\)
      \begin{tcolorbox}
        \begin{gather*}
          \pdv{u}{y}
          = \pdv{}{y}{\left(
            <u>
          \right)}
          = \dots
          %
          \yesnumber\label{eq:<tag> ddy(u)}
          %
          %
          ;\\
          \pdv{v}{x}
          = \pdv{}{x}{\left(
            <v>
          \right)}
          = \dots
          %
          \yesnumber\label{eq:<tag> ddx(v)}
        \end{gather*}
      \end{tcolorbox}
      ]], {
        tag_input = i(1,'tag'),
        u_input   = i(2,'u(x,y)'),
        v_input   = i(3,'v(x,y)'),
        tag = rep(1),
        u   = rep(2),
        v   = rep(3),
      }
    )
  ),
  ms( -- general solution for exact equations with separable variables
    {
      common = {
        name = "General solution for exactdiffeq with separable variables",
        desc = [[
          u(x) dx + v(y) dy = 0
          Px(u(x)) + Py(v(y)) = const
          ∂∂y(u) = ∂∂x(v) = 0
        ]]
      },
      "AM3C-gensol-for-exactdiffeq-w-sepvar",
      "AM3C-general-solution-for-exact-differential-equations-with-separable-variables"
    },
    fmt(
      [[
      % tag = <tag_input>
      % u = <u_input>
      % v = <v_input>

      \answer{\eqref{eq:<tag> f}}

      Finding general solution \(f(x)\)
      \begin{tcolorbox}
        \begin{gather*}
          f(x)
          = \prim_x{u(x)}
          + \prim_y{v(y)}
          = \prim_x{\left(
            <u>
          \right)}
          + \prim_y{\left(
            <v>
          \right)}
          = \prim_x{\left(
            <u>
          \right)}
          + \prim_y{\left(
            <v>
          \right)}
          = dots
          %
          \yesnumber\label{eq:<tag> f}
        \end{gather*}
      \end{tcolorbox}
      ]],
      {
        tag_input = i(1,'tag'),
        u_input   = i(2,'u(x,y)'),
        v_input   = i(3,'v(x,y)'),
        tag = rep(1),
        u   = rep(2),
        v   = rep(3),
      }
    )
  ),
  ms( -- laplace's equation solution
    {
      common = {
        name = "Laplace's equation solution",
        desc = [[
          y = x α(y') + β(y')
          y'=p
        ]]
      },
      "AM3C-laplaces-equation-solution"
    },
    fmt(
      [[
      % tag = <tag_input>
      % alpha = <alpha_input>
      % beta  = <beta_input>

      % y = x\,(<alpha>) + <beta>

      \answer{\eqref{eq:<tag> answer}}

      General and singular solutions for \(y\)
      \begin{tcolorbox}
        \begin{gather*}
          y = x\,\left(
            <alpha>
          \right)
          (y')
          + \left(
            <beta>
          \right)
          (y')
          = \mathText{\(y'=p\)}
          = x\,\left(
            <alpha>
          \right)
          (p)
          + \left(
            <beta>
          \right)
          (p)
          %
          \yesnumber\label{eq:<tag> y to p}
          %
          = \mathText{using 
            \eqref{eq:<tag> solutions for x}
          }
          = 
        \end{gather*}
      \end{tcolorbox}

      % solve general solution for x here
      General solution for \eqref{eq:<tag> x diffeq}
      \begin{tcolorbox}
        % \begin{gather*}
        % \end{gather*}
      \end{tcolorbox}

      Solving \(y'\)
      \begin{tcolorbox}
        \begin{gather*}
          y' = p
          = \mathText{using \eqref{eq:<tag> y to p}}
          = \mdif{x}{\left(
            x\,\left(
              <alpha>
            \right)
            (p)
            + \left(
              <beta>
            \right)
            (p)
          \right)}
          \implies
          p
          = x\,\left(
            <alpha>
          \right)
          (p)
          + \left(
            <beta>
          \right)
          (p)
          \implies \\
          \implies
          x'
          - x\,\left(
            \frac{
              \mdif{x}{
                \left(
                  <alpha>
                \right)(p)
              }
            }{
              p
              -
              \left(
                <alpha>
              \right)(p)
            }
          \right)
          = \frac{
            \mdif{x}{
              \left(
                <beta>
              \right)(p)
            }
          }{
            p
            - 
            \left(
              <alpha>
            \right)(p)
          }
          %
          \yesnumber\label{eq:<tag> x diffeq}
        \end{gather*}
      \end{tcolorbox}
      ]],{
        tag_input   = i(1,"tag"),
        alpha_input = i(2,"α"),
        beta_input  = i(3,"β"),
        tag   = rep(1),
        alpha = rep(2),
        beta  = rep(3)
      }
    )
  ),
  ms( -- Clairut's equation solution
    {
      common = {
        name = "Clairut's equation solution",
        desc = [[
          y = x y' + β(y')
          y' = p
        ]]
      },
      "AM3C-Clairuts-equation-solution"
    },
    fmt(
      [[
      % tag = <tag_input>
      % beta = <beta_input>

      \answer{\eqref{<tag> answer}}

      General and singular solutions for \(y\)
      \begin{tcolorbox}
        \begin{gather*}
          y 
          = x\,y' 
          + \left(
            <beta>
          \right)(y')
          = \mathText{\(y'=p\)}
          = x\,p
          + \left(
            <beta>
          \right)(p)
          %
          \yesnumber\label{eq:<tag> y to p}
          %
          \implies \mathText{using \eqref{eq:<tag> solutions for y}}
          \implies
          \begin{cases}
            y = x\,c 
            + \left(
              <beta>
            \right)(c)
            % \text{General solution}
            \\
            \begin{cases}
              x = -(<beta>)'(p)
              \\
              y 
              = - \mdif{x}{(
                <beta>
              })(p)
              \,p
              + (
                <beta>
              )(p)
            \end{cases}
            & \text{singular solutions parametric}
            \\
            y 
            = x\,(
              - \mdif{x}{(
                <beta>
              })(p)
            )
            + (
              <beta>
            )(p)
          \end{cases}
        \end{gather*}
      \end{tcolorbox}

      Solving \(y'\)
      \begin{tcolorbox}
        \begin{gather*}
          y' = p
          = \mathText{using \eqref{eq:<tag> y to p}}
          = x\,p
          + \left(
            <beta>
          \right)(p)
          \implies
          x\,p'
          + \mdif{x}{\left(
            <beta>
          \right)(p)}
          \implies \\
          \implies
          \begin{cases}
            p'= 0
            \\
            x
            = -\mdif{x}{\left(
              <beta>
            \right)(p)}
          \end{cases}
          %
          \yesnumber\label{eq:<tag> solutions for y}
        \end{gather*}
      \end{tcolorbox}
      ]],{
        tag_input  = i(1,"tag"),
        beta_input = i(2,"β"),
        tag  = rep(1),
        beta = rep(2)
      }
    )
  ),
  ms( -- Heaviside function conversion
    {
      common = {
        name = "Heaviside function conversion",
        common = "f{ f(x), a<t<b }"
      },
      "AM3C-heaviside-function-conversion"
    },
    fmt(
      [[
      % <f_input>, <a_input> << t << <b_input>
      <f>(\Heavi(t-<a>)-\Heavi(t-<b>))
      ]],{
        f_input = i(1,'f(t)'),
        a_input = i(2,"a"),
        b_input = i(3,"b"),
        f = rep(1),
        a = rep(2),
        b = rep(3)
      }
    )
  )
}
