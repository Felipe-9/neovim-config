local ls = require("luasnip")

-- local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
local c = ls.choice_node -- multiple options

local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
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
  s( -- Proposition Box environment
    {
      desc = { "propositionBox environment" },
      trig = {
        "\\propositionBox",
        "\\begin{propositionBox}",
        "\\BPB",
      },
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
          & \(\ch{[HA]}_{t0}\)
          & \(x\)
          & \(0\)
          & --

          \\

            \(t1\)
          & \(\ch{[HA]}_{t0}-x\)
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
}
