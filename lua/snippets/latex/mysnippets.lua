local ls = require("luasnip")

-- local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
local c = ls.choice_node -- multiple options

local extras = require("luasnip.extras")
local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  -- Tables
  ms( -- table/multirow
    {
      common = {
        name = "table/multirow",
        desc = "\\multirow[⟨vpos⟩]{⟨nrows⟩}[⟨bigstruts⟩]{⟨width⟩}[⟨vmove⟩]{⟨text⟩}",
      },
      -- trig
      "\\multirow",
    },
    fmt(
      [[ \multirow[<vpos>]{<nrows>}{<width>}{<text>} ]],
      {
        vpos = i(1, "vpos"),
        nrows = i(2, "nrows"),
        width = i(3, "*"),
        text = i(0, "text"),
      }
    )
  ),
  ms( -- table setup
    {
      common = {
        name = "table setup",
        desc = "Setup table width and lenght",
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
        name = { "Minipage environment" },
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
      {
        width = i(1, "1"),
        content = i(0, "content")
      }
    )
  ),
  -- Biology
  ms( -- DNAblock
    {
      common = {
        name = "DNAblock",
        desc = "renew command \\DNAblock from mydnaseq",
      },
      -- trig
      "\\DNAblock",
    },
    fmt(
      [[ \renewcommand\DNAblock{<count>} ]],
      { count = i(1, "5") }
    )
  ),
  -- Graphics and images
  ms( -- Figure Environment
    {
      common = { name = "Figure Template" },
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
        name = "includegraphics",
        desc = "Include a simple graphic centered",
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
        name = "geometry: default settings",
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
      common = { name = "Sisetup: set default settings" },
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
        % round-minimum={0.01}, % << x =>> 0
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
        name = "subsection",
        desc = "shortcut for Section 2",
      },
      -- trig
      "\\ssection",
    },
    fmt(
      [[ \subsection{<>} ]],
      { i(1) }
    )
  ),
  ms( -- Section shortcut 3
    {
      common = {
        name = "subsubsection",
        desc = "shortcut for Section 3",
      },
      -- trig
      "\\sssection",
    },
    fmt(
      [[ \subsubsection{<>} ]],
      { i(1) }
    )
  ),
  ms( -- Question shortcut 1
    {
      common = {
        name = "subquestion",
        desc = "shortcut for question 2",
      },
      -- trig
      "\\squestion",
    },
    fmt(
      [[ \subquestion{<>} ]],
      { i(1) }
    )
  ),
  ms( -- Question shortcut 3
    {
      common = {
        name = "sbusubquestion",
        desc = "shortcut for question 3",
      },
      -- trig
      "\\ssquestion",
    },
    fmt(
      [[ \subsubquestion{<>} ]],
      { i(1) }
    )
  ),
  ms( -- Example shortcut 1
    {
      common = {
        name = "subexample",
        desc = "shortcut for example 2",
      },
      -- trig
      "\\sexample",
    },
    fmt(
      [[ \subexample{<>} ]],
      { i(1) }
    )
  ),
  ms( -- Example shortcut 3
    {
      common = {
        name = "subsubexample",
        desc = "shortcut for example 3",
      },
      -- trig
      "\\ssexample",
    },
    fmt(
      [[ \subsubexample{<>} ]],
      { i(1) }
    )
  ),
  --
  -- Lists
  --
  ms( -- description environment
    {
      common = {
        name = "description",
        desc = "environment",
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
        desc = i(0, "desc"),
      }
    )
  ),
  ms( -- enumerate environment
    {
      common = {
        name ="enumerate",
        desc = "environment",
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
        body = i(0, "body"),
        d1 = ne(1, "["),
        d2 = ne(1, "]"),
      }
    )
  ),
  ms( -- itemize environment
    {
      common = {
        name = "itemize",
        desc = "environment",
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
      { i(0) }
    )
  ),
  ms( -- multicols environment
    {
      common = {
        name = "multicols",
        desc = "environment",
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
        body = i(0, "body"),
      }
    )
  ),
  ms( -- Table environment
    {
      common = {
        name = "table",
        desc = "environment",
      },
      -- trig
      "\\BTBL",
      "\\table",
      "\\begin{table}",
      "\\tabular",
    },
    fmt(
      [[
      \begin{center}
        \vspace{1ex}
        \begin{tabular}{<col>}
          \toprule

            \multicolumn{1}{c}{<title>}

          \\\midrule

          \\\bottomrule
        \end{tabular}
        \vspace{2ex}
      \end{center}
      ]],
      {
        col = i(1, "columns"),
        title = i(0, "title"),
      }
    )
  ),
  --
  -- Code
  --
  ms( -- indexer
    {
      common = {
        name = "indexer",
        desc = "input some files using luacode",
      },
      -- trig
      "\\indexer",
    },
    fmt(
      [[
      % print files
      \begin{luacode*}
        -- Files Directory
        dir = "."
        -- Prefix and sufix
        prefix = "<mainfile>."
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
          },"\n"))
        end
      \end{luacode*}
      ]],
      {mainfile = t(vim.fn.expand("%:t:r"))}
    )
  ),
  ms( -- Minted environment
    {
      common = {
        name = "minted",
        desc = "Minted environment for code",
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

        <body>

        \end{minted}
        \end{tcolorbox}
        \caption{hello world}
      \end{listing}
      ]],
      {
        lang = i(1, "python"),
        body = i(0, "print(\"Hello, World!\")")
      }
    )
  ),
}
