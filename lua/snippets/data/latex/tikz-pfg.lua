local ls = require("luasnip")

local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
-- local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
-- local r = ls.restore_node -- restore from variable

local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  --
  -- Tikz
  --
  ms( -- tikz/external/remake next
    {
      common = {
        desc = {
          "tikz/external/remake next",
          "a variant of force remake which applies only to the next image.",
        },
      },
      -- Trig
      "\\tikz/external/remake next",
    },
    fmt(
      [[
      \tikzset{external/remake next=<cond>}
      ]],
      { cond = i(1, "true") }
    )
  ),
  ms( -- tikz/external/force remake
    {
      common = {
        desc = {
          "tikz/external/force remake",
          "automatic regeneration of every following figure",
        },
      },
      -- Trig
      "\\tikz/external/force remake",
    },
    fmt(
      [[
      \tikzset{external/force remake=<cond>}
      ]],
      { cond = i(1, "true") }
    )
  ),
  ms( -- tikz sci graph
    {
      common = {
        desc = {
          "tikz sci graph",
          "draw a scientific graph",
        },
      },
      -- Trig
      "\\tikz-sci-graph",
    },
    fmt(
      [[
      % \tikzset{external/remake next=true}
      % {\large\bfseries{solução 1}}\par\medskip
      \begin{tikzpicture}
      \begin{axis}
      [
        xmajorgrids=true,
        ymajorgrids=true,
        minor tick num=3,
        xminorgrids=true,
        yminorgrids=true,
        % legend pos={north west},
        % axis on top,
        % ylabel={},
        % xlabel={},
      ]

        % % legends
        % \addlegendimage{empty legend}
        % \addlegendentry[graph]{}
        % ================= interpolation ================ %
        % \addplot[
        %     no marks,
        %     dashed,
        %     samples=2,
        % ] expression [
        %     domain=0:4000
        % ] {
        %     -3.5953e-4*x+0.0013
        % };
        % ==================== points ==================== %
        \addplot[
          mark=*,
          only marks,
        ] coordinates {
          (   0,  0)
          (1000, -0.35667494393873245)
          (2000, -0.717289485881545)
          (3000, -1.0777309126157544)
          (4000, -1.437104913523651)
        };

      \end{axis}
      \end{tikzpicture}
      ]],
      {}
    )
  ),
  ms( -- tikzpicture
    {
      common = {
        desc = { "tikzpicture, draw a tikzpicture" },
      },
      -- Trig
      "\\begin{tikzpicture}",
      "\\btikzpicture",
    },
    fmt(
      [[
      \begin{tikzpicture}

        \draw[->>, thick, blue!60!]
        ( 0,  0)--node[anchor=south west]{\( a \)}
        (-1,0.5);

        \draw[->>, thick, blue!60!]
        ( 0,0  )--
        (-1,0.5)--node[anchor=south west]{\( 2\,a \)}
        (-2,1  );

        \draw[->>, thick, red!60!]
        (0,0)--node[anchor=south]{\( b \)}
        (1,0);

        \draw[->>, thick, red!60!]
        (-2,1)--node[anchor=south]{\( -3\,b \)}
        +(-3,0);

        \draw[->>, thick, green!60!]
        ( 0,0)--
        (-5,1) node[anchor=south east]{\( 2\,a - 3\,b \)};

      \end{tikzpicture}
      ]],
      {}
    )
  ),
  ms( -- graphEdge
    {
      common = {
        desc = { "graphEdge function" },
      },
      -- Trig
      "\\graphEdge",
    },
    fmt(
      [[
      \graphEdge<mod><di_p><opts_p><do_p><di_d><opts_d><do_d>{<labels>}{<nodes>}
      ]],
      {
        mod = i(1, "*"),
        opts_p = i(2, "placement opts"),
        opts_d = i(3, "drawing opts"),
        labels = i(4, "labels"),
        nodes = i(5, "nodes"),
        di_p = ne(2, "["),
        do_p = ne(2, "]"),
        di_d = ne(2, "["),
        do_d = ne(2, "]"),
      }
    )
  ),
  ms( -- tikzgraphs
    {
      common = {
        desc = {
          "tikzgraphs",
          "Simple graphs template",
        },
      },
      -- Trig
      "\\tikzgraphs",
    },
    fmt(
      [[
      \tikzset{external/remake next=true} % remake next
      \begin{center}
      \begin{tikzpicture}[myGraphsStyle]

        % ===================== Vertices ===================== %

        % 1,2,3
        \pic (1) at (0, 0) {graphVertice={1/0/0/below/3mm}};
        \pic (2) at (1, 1) {graphVertice={2/0/0/below/3mm}};
        \pic (3) at (1,-1) {graphVertice={3/0/0/below/3mm}};

        % ======================= Edges ====================== %

        % 1 ->> {2,3}
        \draw[->>] (1-x) -- (2-x);
        \draw[->>,dashed] (1-x) -- (3-x);

        % ==================================================== %

      \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- tikz 3d cube
    {
      common = {
        desc = {
          "tikz 3d cube",
          "Cube inside a tikzpicture",
        },
      },
      -- Trig
      "\\tikz-3d-cube",
    },
    fmt(
      [[
      % Cube
      \draw[-]
         (0,0,0)
      -- (1,0,0)
      -- (1,1,0)
      -- (0,1,0)
      -- (0,0,0)
         (0,0,1)
      -- (1,0,1)
      -- (1,1,1)
      -- (0,1,1)
      -- (0,0,1)
      (0,0,0) -- (0,0,1)
      (0,1,0) -- (0,1,1)
      (1,1,0) -- (1,1,1)
      (1,0,0) -- (1,0,1);
      ]],
      {}
    )
  ),
  ms( -- tikz 3d guide
    {
      common = {
        desc = {
          "tikz 3d guide",
          "guides to help with drawing",
        },
      },
      -- Trig
      "\\tikz-3d-guide",
    },
    fmt(
      [[
      % Guide
      \draw[-] (0,0,0) circle (.2);
      \draw[-, red  ] (1,0,0) circle (.2);
      \draw[-, green] (0,1,0) circle (.2);
      \draw[-, blue ] (0,0,1) circle (.2);
      ]],
      {}
    )
  ),
  --
  -- PGF
  --
  ms( -- PGF data
    {
      common = {
        desc = {
          "PGF data",
          "2D plot of fitted data with regression",
        },
      },
      -- Trig
      "\\pgfplot-data",
    },
    fmt(
      [[
      \begin{center}
      \tikzset{external/remake next=true}
      % \pgfplotsset{height=7cm, width= .6\textwidth}
      \begin{tikzpicture}
      \begin{axis}
        [
          set layers, mark layer={axis tick labels}, % regression on top
          % xmajorgrids = true,
          % legend pos  = north west
          % domain=0:4,
          xlabel={\(x\)},
          ylabel={\(y\)},
        ]
        % % Legends
        % \addlegendimage{empty legend}
        % \addlegendentry[Graph]{\(y=\num{a}\,x+\num{b}\)}
        % \addlegendimage{empty legend}
        % \addlegendentry[Graph]{\(R^2=\num{}\)}

        % Plot from file
        \addplot[mark=*,draw=none]
        table{graph.dat};

        % line regression
        \addplot[
          draw=GraphC,thick,
          domain={0:0.3},
        ]{a*x+b};

      \end{axis}
      \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- PGF 2D Axes
    {
      common = {
        desc = {
          "PGF 2D Axes",
          "2D Axes for pgf plots",
        },
      },
      -- Trig
      "\\pgf-axes-2d",
    },
    fmt(
      [[
      % Axes 2D
      \draw[-\stealth] (-0.5,0) -- (1,0) node[pos=1.1]{\(x\)};
      \draw[-\stealth] (0,-0.5) -- (0,1) node[pos=1.1]{\(y\)};
      ]],
      {}
    )
  ),
  ms( -- PGF 3D Axes
    {
      common = {
        desc = {
          "PGF 3D Axes",
          "Simple 3D Axes for pgf plots",
        },
      },
      -- Trig
      "\\pgf-axes-3d",
    },
    fmt(
      [[
      % Axes 3D
      \draw[-\stealth] (-0.5,0,0) -- (1,0,0) node[pos=1.1]{\(x\)};
      \draw[-\stealth] (0,-0.5,0) -- (0,1,0) node[pos=1.1]{\(y\)};
      \draw[-\stealth] (0,0,-0.5) -- (0,0,1) node[pos=1.1]{\(z\)};
      ]],
      {}
    )
  ),
  ms( -- PGFplot math 2D
    {
      common = {
        desc = {
          "PGFplot math 2D",
          "Plot 2D graph for math (with fillbetween)",
        },
      },
      -- Trig
      "\\pgfplot-math-2d",
    },
    fmt(
      [[
      \begin{center}
        \tikzset{external/remake next=true}
        % \pgfplotsset{height=7cm, width= .6\textwidth}
        \begin{tikzpicture}
        \begin{axis}
          [
            % xmajorgrids = true,
            legend pos={south east},
            % domain=0:4,
            % xlabel={},
            % ylabel={},
            axis lines={center}, % left|right|center|box,
          ]
          % Legends
          % \addlegendimage{empty legend}
          % \addlegendentry[Graph]{\(
          %   {\color{Graph}x}
          %   {\color{GraphC}x^2}
          % \)}

          % Plot from equation
          \addplot[
            name path={A},
            smooth,
            thick,
            Graph,
            domain  = 0:1.1,
            samples = \mysampledensitySimple,
          ]{ x };
          % Plot from equation
          \addplot[
            name path={B},
            smooth,
            thick,
            GraphC,
            domain  = 0:1.1,
            samples = \\mysampledensitySimple,
          ]{ x^2 };

          % ================ fillbetween =============== %
          \addplot [
            fill opacity=0.1,
            foreground
          ] fill between [
            of={A and B},
            soft clip={domain={0:1}}
          ];

        \end{axis}
        \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- PGFplot 2D simple
    {
      common = {
        desc = {
          "PGFplot 2D simple",
          "Plot 2D graph (Simple settings)",
        },
      },
      -- Trig

      "\\pgfplot-2d-simple",
      "\\BPGFPlot2D-simple",
    },
    fmt(
      [[
      \begin{center}
        \tikzset{external/remake next=true}
        % \pgfplotsset{height=7cm, width= .6\textwidth}
        \begin{tikzpicture}
        \begin{axis}
          [
            % xmajorgrids = true,
            % legend pos  = north west
            % domain=0:4,
            % xlabel={},
            % ylabel={},
          ]
          % Legends
          % \addlegendimage{empty legend}
          % \addlegendentry[Red]{\( x \)}

          % % Plot from csv file
          % \addplot[smooth, thick, mark=*] % mesh for colormap
          % table[
          %   col sep=comma,  % csv: comma,
          %   header=true,
          %   x index=3,      % x column on file
          %   y index=4,      % y column on file
          %   point meta=x,   % value to colormap
          % ]{  file.csv };

          % % Plot from equation
          % \addplot[
          %   smooth,
          %   thick,
          %   % Graph,
          %   domain  = -2:2,
          %   samples = \mysampledensityDouble,
          % ]{ x };

        \end{axis}
        \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- PGFplot 2D full
    {
      common = {
        desc = {
          "PGFplot 2D full",
          "Plot 2D graph (Full settings)",
        },
      },
      -- Trig

      "\\pgfplot-2d-full",
      "\\BPGFPlot2D-full",
    },
    fmt(
      [[
      \begin{center}
        %\pgfplotsset{height=7cm, width= .6\textwidth}
        \begin{tikzpicture}
        \begin{axis}
          [
            % extra x ticks= { 0.5 },
            % extra y ticks= { 0.236798 },
            % Number formating
            x tick label style={
              /pgf/number format/.cd,
                fixed,
                fixed zerofill,
                precision=3,
              /tikz/.cd
            },
            y tick label style={
              /pgf/number format/.cd,
                fixed,
                fixed zerofill,
                precision=3,
              /tikz/.cd
            },
            % Label titles
            xlabel= {X\textsubscript{Cu}},
            ylabel= {Absorvância corrigida},
            % MIN/MAX
            % xmin= 250,    xmax= 1100,
            % ymin= 0,        ymax= ,
            % Ticks
            % minor x tick num= 3,
            minor x tick num= 1,
            % Grids Major
            xmajorgrids= true,
            ymajorgrids= false,
            % Grids Minor
            % xminorgrids= false,
            % yminorgrids= false,
          ]

          % Legends
          % \addlegendimage{empty legend}
          % \addlegendentry[LegendColor\Light]{  }

          % % Plot from csv file
          % \addplot[smooth, thick, mark=*] % mesh for colormap
          % table[
          %   col sep=comma,  % csv: comma,
          %   header=true,
          %   x index=3,      % x column on file
          %   y index=4,      % y column on file
          %   point meta=x,   % value to colormap
          % ]{  file.csv };

          % % Plot from equation
          % \addplot[
          %   smooth,
          %   thick,
          %   % Red,
          %   domain  = -2:2,
          %   samples = 0.4*\mysampledensity,
          % ]{  x };

        \end{axis}
        \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
  ms( -- PGFplot 3D
    {
      common = {
        desc = {
          "PGFplot 3D",
          "Plot 3D graph (Simple settings)",
        },
      },
      -- Trig

      "\\pgfplot-3d-simple",
      "\\BPGFPlot3D-simple",
    },
    fmt(
      [[
      \begin{center}
        % \pgfplotsset{height=0.3\pageheight, width= .95\textwidth}

        % \tikzset{external/remake next=true}
        \begin{tikzpicture}
          \begin{axis}
          [
            z buffer = {sort}, % default|none|auto|sort|reverse x seq|reverse y seq|reverse xy seq
            % xlabel={\(x\)}, ylabel={\(y\)}, zlabel={\(z\)}
            % xmajorgrids = true,
            % legend pos  = north west,
            % 3d view,
            % perspective,
            % view = {10}{10}, % rot/elevation
            hide axis,
            % axis lines = {center}, % 3D center/box/left/right
            % axis on top,
            % ticks = {none} % minor/major/both/none,
          ]
            % Legends
            % \addlegendimage{empty legend}
            % \addlegendentry[Red]{\( x \)}

            % Conical surface
            \addplot3 [
              % Aparence
              surf,
              opacity      = 0.5,
              fill opacity = 1,
              faceted color = White,
              shader = faceted interp,
              % Scope
              data cs = cart, % cart/polar/polarrad
              samples = \mysampledensitySimple,
              % Variable
              % variable   = z,
              % variable y = z,
              % domain   = -1:1,
              % domain y = -1:1,
            ]{
              sqrt(x^2+y^2)
            };

          \end{axis}
        \end{tikzpicture}
      \end{center}
      ]],
      {}
    )
  ),
}
