--
local ls = require("luasnip")

local s = ls.snippet -- build snippets
-- local t = ls.text_node -- insert text
-- local i = ls.insert_node -- user input

-- local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return
--
    s( -- polinomio de lagrange
      {
        desc = "lagrange polynomn",
        trig = "\\formula-CNA-polinomio-lagrange",
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
    s( -- polinómio de newton com diferenças divididas
      {
        desc = "polinómio de newton com diferenças divididas",
        trig = "\\formula-polinomio-newton-com-diff-div",
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
    s( -- erro de interpolação
      {
        desc = "erro de interpolação",
        trig = "\\formula-erro-interpolacao",
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
    s( -- interpolação por splines polinomiais cúbicos
      {
        desc = {
          "expressão de spline polinomial cúbico",
          "interpolador de f em x_0,x_1,...,x_n",
          "no intervalo [x_i,x_{i+1}]",
        },
        trig = "\\formula-interp-spline-poli-cubico",
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
    s( -- sistema de equações para det spline cubico interpolador de f
      {
        desc = {
          "sistema de equações para determinação de um spline cúbico",
          "interpolador de f",
          "nos pontos x_0,x_1,...,x_n",
        },
        trig = "\\formula-sistema-eq-spline-cubico-interp",
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
    s( -- sistema de equações para determinação do spline cúbico completo
      {
        desc = "adicionar às equações [e] as equações",
        trig = "\\formula-sistema-eq-spline-cubico-completo",
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
    s( -- sistema de equações para determinação do spline cúbico natural
      {
        desc = "adicionar às equações [e] as equações",
        trig = "\\formula-sistema-eq-spline-cubico-natural",
      },
      fmt("m_0=m_n=0", {})
    ),
    s( -- metodo dos mínimos quadrados
      {
        desc = {
          "função polinomial que melhor aproxima",
          "os dados {(x_0,y_0),...,(x_n,y_n)}",
          "em relacao à base {1,x,...,x^m}",
        },
        trig = "\\formula-metodo-minimos-quadrados",
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
    s( -- formulas de newton-cotes (fechadas) 0
      {
        desc = "regra do ponto médio",
        trig = "\\formula-newton-cotes-0-regra-ponto-medio",
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
    s( -- formulas de newton-cotes (fechadas) 1
      {
        desc = "regra dos trapézios",
        trig = "\\formula-newton-cotes-1-regra-trapezios",
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
    s( -- formulas de newton-cotes (fechadas) 2
      {
        desc = "regra de simpson simples",

        trig = {
          "\\formula-newton-cotes-2-regra-simpson-simples",
          "\\formula-regra-simpson-simples",
        },
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
    s( -- regra de simpson composta
      {
        desc = {
          "regra de simpson composta",
          "grau de precisão: 3",
          "σ ∈ ]a,b[",
          "h = (b-a)/2n",
        },
        trig = "\\formula-regra-simpson-composta",
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
    s( -- método de integração de gauss
      {
        desc = "método de integração de gaussu",
        trig = "\\formula-metodo-integracao-gauss",
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
    s( -- cn a convergencia
      {
        desc = "convergencia de uma sucessão x_i=f(x_(i-1)) a partir de um x_0 para α",
        trig = "\\formula-cna-convergencia-sucessao",
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
    )
