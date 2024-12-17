--
local ls = require("luasnip")

-- local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
local d = ls.dynamic_node -- functions

local extras = require("luasnip.extras")
local rep = extras.rep -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  --
  ms( -- polinomio de lagrange
    {
      common = {
        name = "lagrange polynomn",
        desc = {
          "        ⎛ k=1  x  -x_i ⎞⎛  n     x  -x_i ⎞",
          "L_k(x) =⎜  ∏   ------- ⎟⎜  ∏     ------- ⎟",
          "        ⎝ i=0  x_k-x_i ⎠⎝ i=k+1  x_k-x_i ⎠"
        }
      },
      -- trig
      "\\formula-CNA-polinomio-lagrange",
      "\\formula-CNA-lagrange-polynomn",
    },
    fmt(
      [[
      % tag: <tag_input>
      % n:   <n_input>
      % x:   <x_input>

      % polynom
      \begin{gather*}
        p_{<n>}(x)
        = \sum_{i=0}^{<n>}{ y_i\,l_{i}(x) }
        % 
        % 
        % 
        % \usingeq{eq:<tag>-l_1}
        % = 
      \end{gather*}

      % l_{1,2,3,...}
      \begin{gather*}
        \usingeq{eq:<tag>-l_i}
        l_1
        = 
        % 
        \tagthis{eq:<tag>-l_1}
        % 
        % 
        % 
        ; \\[3ex]
        \usingeq{eq:<tag>-l_i}
        l_2
        = 
        % 
        \tagthis{eq:<tag>-l_2}
        % 
        % 
        % 
        ; \\[3ex]
        \usingeq{eq:<tag>-l_i}
        l_3
        = 
        % 
        \tagthis{eq:<tag>-l_3}
      \end{gather*}

      % l_i
      \begin{gather*}
        l_i(x)
        =\prod_{j=0}^{i-1}{\frac{x-x_j}{x_i-x_j}}
        \,\prod_{j=i+1}^{<n>}{\frac{x-x_j}{x_i-x_j}}
        % 
        \tagthis{eq:<tag>-l_i}
      \end{gather*}

      ]],
      {
        tag_input = i(1,'tag'),
        n_input = i(2,"n"),
        x_input = t("x"),
        tag = rep(1),
        n = rep(2),
      }
    )
  ),
  ms( -- polinómio de newton com diferenças divididas
    {
      common = {
        name = { "polinómio de newton com diferenças divididas" },
      },
      -- trig
      "\\formula-CNA-polinomio-newton-com-diff-div",
    },
    fmt(
      [[
      % n: <n_input>

      % polynom
      \begin{gather*}
        p_{<n>\,(x)}
        = f(x_0)
        + \sum_{i=0}^{<n>-1}{
          \left(\prod_{j=0}^{i}{x-x_j}\right)
          \,f\myrange{x_0,\dots,x_{i+1}}
        }
      \end{gather*}
      ]],
      {
        n_input = i(1,"n"),
        n = rep(1)
      }
    )
  ),
  ms( -- erro de interpolação
    {
      common = {
        desc = { "erro de interpolação" },
      },
      -- trig
      "\\formula-CNA-erro-interpolacao",
    },
    fmt(
      [[
      % interp error
      \begin{gather*}
        f_{x^*}-p_{n\,(x^*)}
        = \frac{f^{x+1}_{(\xi)}}{(n+1)!}
        \,\prod_{i=0}^{n}{x^*-x_i}
        %
        %
        %
        \\[1ex]
        \xi\in\myrange*{
          \min(x_0,x_1,\dots,x_n),
          \max(x_0,x_1,\dots,x_n)
        }
      \begin{gather*}
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
      "\\formula-CNA-interp-spline-poli-cubico",
    },
    fmt(
      [[
      % tag: <tag_input>

      % cubic interp spline
      \begin{gather*}
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
        = \mathText{Using \eqref{eq:<tag>-h_i}\eqref{eq:<tag>-m_i}}
        = 
      \end{gather*}

      % h_i
      \begin{gather*}
        h_i=x_{i+1}-x_i
        ,\quad i=0,1,\dots,n-1
        \implies\\\implies
        h_i = 
        % 
        \tagthis{eq:<tag>-h_i}
      \end{gather*}

      % m_i
      \begin{gather*}
        m_i
        =\odv[order=2]{s_{(x_i)}}{x}
        ,\quad i=0,1,\dots,n
        \implies\\\implies
        m_i = 
        % 
        \tagthis{eq:<tag>-m_i}
      \end{gather*}
      ]],
      {
        tag_input = i(1,'tag'),
        tag = rep(1),
      }
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
      "\\formula-CNA-sistema-eq-spline-cubico-interp",
    },
    fmt(
      [[
      % tag: <tag_input>

      % f_{1,2,...}
      \begin{gather*}
        \mathText{Using \eqref{eq:<tag>-f_i}}
        f_1
        = 
        %
        \tagthis{eq:<tag>-f_1}
        % 
        % 
        % 
        ; \\[3ex]
        \mathText{Using \eqref{eq:<tag>-f_i}}
        f_2
        = 
        %
        \tagthis{eq:<tag>-f_2}
      \end{gather*}

      % f_i
      \begin{gather*}
        h_{i-1}\,m_{i-1}
        + 2\,(h_{i-1}+h_i)\,m_i
        + h_i\,m_{i+1}
        = 6\left(
          \frac{f_{i+1}-f_{i}}{h_i}
          -\frac{f_{i}-f_{i-1}}{h_{i-1}}
        \right)
        ,\quad i\in\myrange{1,n-1}
        % 
        \tagthis{eq:<tag>-f_i}
      \end{gather*}
      ]],
      {
        tag_input = i(1,'tag'),
        tag = rep(1),
      }
    )
  ),
  ms( -- sistema de equações para determinação do spline cúbico completo
    {
      common = {
        name = "eqs para spline cubico completo",
        desc = { "adicionar às equações [e] as equações" },
      },
      -- trig
      "\\formula-CNA-sistema-eq-spline-cubico-completo",
    },
    fmt(
      [[
      % tag: <tag_input>

      % f_1
      \begin{gather*}
        \mathText{Using \eqref{eq:<tag>-f_i}}
        f_1
        = 
        %
        \tagthis{eq:<tag>-f_1}
        % 
        % 
        % 
        ; \\[1ex]
        \mathText{Using \eqref{eq:<tag>-f_i}}
        f_2
        = 
        %
        \tagthis{eq:<tag>-f_2}
      \end{gather*}

      % f_i
      \begin{gather*}
        2\,h_0\,m_0 + h_0\,m_1
        = 6\,\left(
          \frac{f_1-f_0}{h_0}-f'_{0}
        \right)
        % 
        % 
        % 
        \\[3ex]
        h_{n-1}\,m_{n-1} + 2\,h_{n-1}\,m_n
        = 6\,\left(
          f'_{0}-\frac{f_n-f_{n-1}}{h_{n-1}}
        \right)
        = 
        \mathText{Using \eqref{eq:<tag>-f'_0}}
        = 
        %
        \tagthis{eq:<tag>-f_i}
      \end{gather*}

      % f'_0
      \begin{gather*}
        f'_0
        = 
        \tagthis{eq:<tag>-f'_0}
      \end{gather*}
      ]],
      {
        tag_input = i(1,'tag'),
        tag = rep(1),
      }
    )
  ),
  ms( -- sistema de equações para determinação do spline cúbico natural
    {
      common = {
        desc = { "adicionar às equações [e] as equações" },
      },
      -- trig
      "\\formula-CNA-sistema-eq-spline-cubico-natural",
    },
    fmt(
      [[
      % tag: <tag_input>

      % f_1
      \begin{gather*}
        \mathText{Using \eqref{eq:<tag>-f_i}}
        f_1
        = 
        %
        \tagthis{eq:<tag>-f_1}
        % 
        % 
        % 
        ; \\[1ex]
        \mathText{Using \eqref{eq:<tag>-f_i}}
        f_2
        = 
        %
        \tagthis{eq:<tag>-f_2}
      \end{gather*}

      % f_i
      \begin{gather*}
        2\,h_0\,m_0 + h_0\,m_1
        = \mathText{Using \eqref{eq:<tag>-m_n}}
        = 0
        = 6\,\left(
          \frac{f_1-f_0}{h_0}-f'_{0}
        \right)
        % 
        % 
        % 
        \\[3ex]
        h_{n-1}\,m_{n-1} + 2\,h_{n-1}\,m_n
        = \mathText{Using \eqref{eq:<tag>-m_n}}
        = 0
        = 6\,\left(
          f'_{0}-\frac{f_n-f_{n-1}}{h_{n-1}}
        \right)
        = 
        \mathText{Using \eqref{eq:<tag>-f'_0}
        = 
        %
        \tagthis{eq:<tag>-f_i}
      \end{gather*}

      % f'_0
      \begin{gather*}
        f'_0
        = 
        % 
        \tagthis{eq:<tag>-f'_0}
      \end{gather*}

      % m_n
      \begin{gather*}
        m_0=m_n=0,\quad\forall\,n
        \tagthis{eq:<tag>-m_n}
      \end{gather*}
      ]], {
        tag_input = i(1,'tag'),
        tag = rep(1),
      })
  ),
  ms( -- metodo dos mínimos quadrados
    {
      common = {
        name = "metodo dos minimos quadrados",
        desc = {
          "função polinomial que melhor aproxima",
          "os dados {(x_0,y_0),...,(x_n,y_n)}",
          "em relacao à base {1,x,...,x^m}",
        },
      },
      "\\formula-CNA-metodo-minimos-quadrados",
    },
    fmt(
      [[
      % polynom
      \begin{gather*}
        p_{(x)} 
        = \sum_{i=0}^{m}{\alpha_i\,x^i}
        % 
        % 
        % 
        = \mathText{Using 
          \eqref{eq:<tag>-alpha0}
        }
        = 
      \end{gather*}

      % α_{0,1,2,...}
      \begin{gather*}
        \mathText{Using \eqref{eq:<tag>-eqs}}
        \alpha_0
        = 
        % 
        \tagthis{eq:<tag>-alpha0}
      \end{gather*}

      % eqs
      \begin{gather*}
        \begin{cases}
            \sum_{i=0}^{m}{\left(
                \alpha_i\,\sum_{j=0}^{n}{x_{j}^{i+k}}
            \right)}
            = \sum_{i=0}^{n}{x_i^k\,y_i}
            \\
            k\in\myrange{0,m}
        \end{cases}
        %
        \tagthis{eq:<tag>-eqs}
      \end{gather*}
      ]],
      {
        tag_input = i(1,'tag'),
        tag = rep(1)
      }
    )
  ),
  -- numerical integration
  ms( -- formulas de newton-cotes (fechadas) 0
    {
      common = {
        name = 'newton-cotes (0) for numerical integration',
        desc = { "regra do ponto médio" },
      },
      -- trig
      "\\formula-CNA-newton-cotes-0-regra-ponto-medio",
    },
    fmt(
      [[
      % integration
      \begin{gather*}
        \int_{a=x_0}^{b=x_1}{f_{(x)}\,\odif{x}}
        \approx h\,f_{\left(\frac{x_0+x_1}{2}\right)}
      \end{gather*}

      % erro de quadratura
      \begin{gather*}
        \frac{h^3}{24}\,\odv[order=2]{f_{(\xi)}}{x}
        ;\quad\xi\in\myrange*{x_0,x_1}
      \end{gather*}
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
      "\\formula-CNA-newton-cotes-1-regra-trapezios",
    },
    fmt(
      [[
      % integration
      \begin{gather*}
        \int_{a=x_0}^{b=x_1}{f_{(x)}\,\odif{x}}
        \approx \frac{h}{2}\,(f_0+f_1)
        &\\[3ex]&
      \end{gather*}

      % erro de quadratura
      \begin{gather*}
        -\frac{h^3}{12}\,\odv[order=2]{f_{(\xi)}}{x}
        ;\quad\xi\in\myrange*{x_0,x_1}
      \end{gather*}
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
      "\\formula-CNA-newton-cotes-2-regra-simpson-simples",
      "\\formula-CNA-regra-simpson-simples",
    },
    fmt(
      [[
      % integração
      \begin{gather*}
        \int_{a=x_0}^{b=x_2}{f_{(x)}\,\odif{x}}
        =i
        \approx \hat{i}
        =\frac{h}{3}\,(f_0+4\,f_1+f_2)
      \end{gather*}

      % erro de quadratura
      \begin{gather*}
        \varepsilon_i
        =i-\hat{i}_s
        = -\frac{h^5}{90}\,f^{(4)}(\xi)
        ;\quad\xi\in\myrange*{x_0,x_2}
      \end{gather*}
      ]],
      {}
    )
  ),
  ms( -- regra de simpson composta
    {
      common = {
        name = 'regra de simpson composta',
        desc = {
          "grau de precisão: 3",
          "σ ∈ ]a,b[",
          "h = (b-a)/2n",
        },
      },
      -- trig
      "\\formula-CNA-regra-simpson-composta",
    },
    fmt(
      [[
      % integração
      \begin{gather*}
        \int_{a=x_0}^{b=x_2}{f_{(x)}\,\odif{x}}
        =i
        \approx \hat{i}
        = \frac{h}{3}\left(
          f(x_0)
          + 4\,\sum_{j=1}^{n  }{f(x_{(2\,j-1)})}
          + 2\,\sum_{j=1}^{n-1}{f(x_{(2\,j  )})}
          + f(x_{2\,n})
        \right)
      \end{gather*}

      % erro de quadratura
      \begin{gather*}
        \varepsilon_i
        = i-\hat{i}_s
        = -n\,\frac{h^5}{90}\,f^{(4)}(\sigma)
        ;\quad\sigma\in\myrange*{x_0,x_2}
      \end{gather*}
      ]],
      {}
    )
  ),
  ms( -- método de integração de gauss
    {
      common = {
        name = { "método de integração de gaussu" },
      },
      -- trig
      "\\formula-CNA-metodo-integracao-gauss",
    },
    fmt(
      [[
      \begin{gather*}
        \int_a^b{f_{(x)}\,\odif{x}}
        = \frac{b-a}{2}
        \,\int_{-1}^{1}{f_{\left(
          \frac{b-a}{2}\,y
          + \frac{b+a}{2}
        \right)}\,\odif{y}}
        \\[3ex]
        f\in c^{(2\,n)}_{(\myrange{-1,1})}
        \implies \\
        \implies
        i-\hat{i}
        = \frac{
          2^{2\,n+1}\,(n!)^4
        }{
          (2\,n+1)\,((2\,n)!)^3
        }
        \,\odv[order={2\,n}]{f_{(\theta)}}{x}
        ,\quad\theta\in\myrange{-1,1}
      \end{gather*}
      ]],
      {}
    )
  ),
  ms( -- cn a convergencia
    {
      common = {
        name = "convergencia de uma sucessão",
        desc = { "x_i=f(x_(i-1)) a partir de um x_0 para α" },
      },
      -- trig
      "\\formula-CNA-convergencia-sucessao",
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
}
