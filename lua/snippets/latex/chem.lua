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
  -- chem
  ms(
    {
      common = {
        name = "BChem",
        desc = "Display chemical equations bold, large and centering",
      },
      "\\BChem",
    },
    fmt(
      [[
      \begin{center}\Large\bfseries
        \ch{<>}
      \end{center}
      ]],
      {i(0)}
    )
  ),
    -- chemfig
  ms( -- chemfig shortcut
    {
      common = {
        name = "chemfig",
        desc = "shortcut for centered chemfig",
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
        body = i(0, "body"),
      }
    )
  ),
  ms( -- Chemfig-butano
    {
      common = {
        name = "Chemfig-butano",
        desc = "cadeia de 4 carbonos",
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
        name = "Chemfig-tert-butano",
        desc = "tetraedro de 5 carbonos",
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
        name = "modiagram",
        desc = "Molecular orbital diagram (CO)",
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
        name = "chem reaction table",
        desc = "Table for a chemical reaction",
      },
      -- trig
      "\\Chemtable",
    },
    fmt(
      [[
      \begin{table}\[H\]\centering
        \begin{tabular}{C *{4}{L}}

          \toprule

          & \multicolumn{1}{c @{\,+}      }{\ch{HA}}
          & \multicolumn{1}{c @{\,\ch{<<>>}}}{\ch{OH^-}}
          & \multicolumn{1}{c @{\,+}      }{\ch{A^-}}
          & \multicolumn{1}{c             }{\ch{H2O}}

          \\\midrule

            t0
          & \ch{[HA]}_{t0}
          & x
          & 0
          & -

          \\

            t1
          & \ch{[HA]}_{t0}-x
          & 0
          & x
          & -

          \\\toprule

          & \multicolumn{1}{c @{\,+}      }{\ch{HA}}
          & \multicolumn{1}{c @{\,\ch{<<>>}}}{\ch{H2O}}
          & \multicolumn{1}{c @{\,+}      }{\ch{A^-}}
          & \multicolumn{1}{c             }{\ch{H3O^+}}

          \\\midrule

            t1
          & \ch{\[HA\]}_{t1}
          & -
          & \ch{\[A^-\]}_{t1}
          & 0

          \\

            t2
          & \ch{\[HA\]}_{t1}-y
          & -
          & \ch{\[A^-\]}_{t1}+y
          & y

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
