local ls = require("luasnip")

-- local s = ls.snippet -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
local t = ls.text_node -- insert text
-- local i = ls.insert_node -- user input
-- local r = ls.restore_node -- restore from variable

local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  ms( -- Main Template
    {
      common = {
        desc = "Main Template",
      },
      "\\latex-template-main",
    },
    fmt(
      [[
      % !TEX root = ./<main_file>.tex
      % \documentclass{article}
      \documentclass[
        class=article,
        multi={minipage},
        border={3mm},
      ]{standalone}
      % -------------------------------------------------------- %
      %                          Colors                          %
      % -------------------------------------------------------- %
      \usepackage[hyperref]{xcolor} % Options: gray - dark and light
      \usepackage{mypallete}
      \colorlet{foreground}{light}
      \colorlet{background}{dark}
      % \usepackage{myGraphPallete} % Graph, GraphXY, GraphSplitX, GraphSplitCX
      % ================== Palette Secondaries ================= %
      \colorlet{Emph}       {DarkGreen!70!foreground}
      \colorlet{Link}      {LightGreen!25!foreground}
      \colorlet{Comment}   {foreground!60!background}
      \colorlet{Background}{foreground!27!background}
      % ======================= setcolor ======================= %
      \pagecolor{background}
      \color    {foreground}
      % -------------------------------------------------------- %
      %                        Essentials                        %
      % -------------------------------------------------------- %
      \usepackage{luacode}
      \usepackage{xparse} % xparse - multiple optional arguments
      \usepackage{calc}
      % % -------------------------------------------------------- %
      % %                         Geometry                         %
      % % -------------------------------------------------------- %
      \setlength\textwidth{160mm}
      % \usepackage{geometry}
      % \geometry{
      %   % papersize = {300mm, 400mm}, % ( 4:3 ) SVGA x 0.5
      %   % papersize = {240mm, 320mm}, % ( 4:3 ) SVGA x 0.4
      %   % papersize = {120mm, 640mm}, % ( 2*4:3/2 )
      %   % papersize = {180mm, 240mm}, % ( 4:3 ) SVGA x 0.3
      %   % papersize = {229mm, 305mm}, % ( 4:3 ) ArchA/Arch1
      %   % papersize = {320mm, 512mm}, % (16:10)
      %   % papersize = {280mm, 448mm}, % (16:10)
      %   % papersize = {240mm, 384mm}, % (16:10)
      %   % a4paper,  % {210mm, 297mm}, % (√2:1 ) A4
      %   papersize = {180mm, 1m}, % LONG ( 4:3 ) SVGA x 0.3
      %   top       = 21mm,
      %   bottom    = 21mm,
      %   left      = .06\paperwidth,
      %   right     = .06\paperwidth,
      %   portrait  = true,
      % }
      % -------------------------------------------------------- %
      %                           Fonts                          %
      % -------------------------------------------------------- %
      \usepackage[fontsize=12pt]{fontsize}
      \usepackage[T1]{fontenc}
      \usepackage{fontspec}
      % \usepackage[sfdefault, ultralight]{FiraSans}
      % \renewcommand{\familydefault}{\sfdefault} % set sans serif as defalt
      % Redeclare emph
      \let\emph\relax
      \DeclareTextFontCommand{\emph}{\bfseries\color{Emph}}
      % % ==================== Set font family =================== %
      \setmainfont[
        Ligatures = TeX,
        UprightFont    = *-Light,
        ItalicFont     = *-LightIt,
        SmallCapsFont  = *SmText-Light,
        BoldFont       = *-Regular,
        BoldItalicFont = *-It
      ]{
        % ==================== Serif fonts =================== %
        SourceSerif4
        % ================= Handwritten fonts ================ %
        % DancingScript
        % Apple Chancery
        % Luminari
        % PetitFormalScript
        % Merienda
        % LaBelleAurore
        % Handlee
          % BadScript
          % Calligraffitti
      }
      % % ======================= Monofont ======================= %
      % \setmonofont[Contextuals = {ligatures}]{FiraCode}
      % \makeatletter
      % \def\verbatim@nolig@list{}
      % \makeatother
      % -------------------------------------------------------- %
      %                         Linguagem                        %
      % -------------------------------------------------------- %
      \usepackage[portuguese]{babel} % Babel
      %\usepackage{polyglossia}      % Polyglossia
      %\setdefaultlanguage[variant=brazilian]{portuguese}
      % % -------------------------------------------------------- %
      % %                         Graphics                         %
      % % -------------------------------------------------------- %
      % \usepackage[draft, final]{graphics, graphicx}
      % \usepackage{graphicx}
      % \graphicspath{{./.build/figures}}
      % -------------------------------------------------------- %
      %                tocloft - Table of contents               %
      % -------------------------------------------------------- %
      \usepackage{tocloft}
      \setcounter{tocdepth}{1}    % remove subsubsection from toc
      % ========================= part ========================= %
      \renewcommand\cftpartfont{\bfseries}
      %\renewcommand\cftpartafterpnum{\vspace{0mm}}
      \setlength\cftbeforepartskip{1ex}
      % ========================== sec ========================= %
      \renewcommand\cftsecfont{} % Font
      \renewcommand\cftsecpagefont{} % page number font
      \renewcommand\cftsecleader{\cftdotfill{\cftdotsep}} % Dots
      \setlength\cftbeforesecskip{0.5ex}
      \setlength\cftsecindent{0mm}
      %\setlength{\cftsecnumwidth}{25mm} % Fix section width
      % ======================== subsec ======================== %
      \setlength\cftsubsecindent{0mm}
      %\setlength{\cftsubsecnumwidth}{15mm}
      % ====================== tab (table) ===================== %
      \setlength\cfttabindent{0mm}
      % % -------------------------------------------------------- %
      % %                       filecontents                       %
      % % -------------------------------------------------------- %
      %\usepackage{scontents}     % the better filecontents
      %\usepackage{filecontents}  % Create files
      % % -------------------------------------------------------- %
      % %                         Multicols                        %
      % % -------------------------------------------------------- %
      \usepackage{multicol}
      \setlength{\columnsep}{.05\textwidth}
      \multicoltolerance = 200
      % \renewenvironment{multicols}[1]{}{\relax} % toggle multicols  on/off
      % -------------------------------------------------------- %
      %                         enumitem                         %
      % -------------------------------------------------------- %
      \usepackage{enumitem}  % modify enumerate index
      \setlist[description]{
        format={\color{Emph}}
      }
      % -------------------------------------------------------- %
      %                         titlesec                         %
      % -------------------------------------------------------- %
      \usepackage{titlesec}
      % ================= Reset section on part ================ %
      \counterwithin*{section}{part}
      % ======================== Spacing ======================= %
      % \titlespacing*{<<left>>}{<<before>>}{<<after>>}[<<right>>]
      \titlespacing*{\part}      {0pt}{ 0pt}{0pt}
      \titlespacing*{\section}   {0pt}{10mm}{0pt}
      \titlespacing*{\subsection}{0pt}{ 5mm}{0pt}
      % ================== Part customization ================== %
      \titleclass\part{straight}
      \titleformat\part
      [block] % shape
      {%
        \begin{minipage}{\textwidth}%
        \centering\Large\bfseries\color{Emph}%
        {\titlerule[1pt]}\vspace{3pt}%
      } % format
      {%
        \thepart\hspace{.5em}{--}
      } % label
      % {\thepart} % label without --
      {.5em} % sep
      {} % before-code
      [\vspace{2pt}{\titlerule[1pt]}\end{minipage}] % after  code
      % % ================= Chapter customization ================ %
      % \titleclass{\chapter}{straight}
      % \titleformat{\chapter}
      %    [block]                         % shape
      %    {\huge\bfseries\color{Emph}}    % format
      %    {\thepart\hspace{5mm}{\(|\)}}   % label
      %    {5mm}                           % sep
      %    {\huge\bfseries}                % before-code
      %    [\vspace{0.5mm}]                % after-code
      % % -------------------------------------------------------- %
      % %                         Appendix                         %
      % % -------------------------------------------------------- %
      % \usepackage{appendix}
      % % -------------------------------------------------------- %
      % %                     siunix: SI units                     %
      % % -------------------------------------------------------- %
      % \usepackage{siunitx,mysiunitx}
      \sisetup{
        % input / scientific / engineering / false / fixed
        exponent-mode={input},
        exponent-to-prefix={false}, % 1000 g ->> 1 kg
        % exponent-product={*}, % x * 10^y
        round-mode={places}, % figures/places/none
        round-precision={3},
        exponent-product={\,},
        exponent-base={\mathrm{E}},
        % Ranges
        range-phrase={\,\to\,},
        range-units={bracket},
        range-exponents={combine-bracket},
      }
      % % -------------------------------------------------------- %
      % %                           Maths                          %
      % % -------------------------------------------------------- %
      \usepackage{amsmath, amssymb, bm}
      \usepackage{mleftright}\mleftright % better left-right
      % \usepackage{derivative} % Derivative
      % \DeclareDifferential{\gdif}{\nabla} % Gradient
      % \usepackage{mathrsfs}   % more symbols \mathscr{} (Hamiltonian)
      % % ====================== Math fonts ====================== %
      % \usepackage[math-style=ISO]{unicode-math} % change math font
      % \usepackage{firamath-otf}
      % % ======================================================== %
      \usepackage{mathtools}
      % \DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
      % \DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
      % % ======================================================== %
      % % ============== MathOperators Declarations ============== %
      % \newcommand\E[1]{\,\mathrm{E}^{#1}}
      % \newcommand\e[1]{\,\mathrm{e}^{#1}}
      % % ========= Missing trigonometric math operators ========= %
      % \DeclareMathOperator\sech   {sech}
      % \DeclareMathOperator\csch   {csch}
      % \DeclareMathOperator\arcsec {arcsec}
      % \DeclareMathOperator\arccot {arccot}
      % \DeclareMathOperator\arccsc {arccsc}
      % \DeclareMathOperator\arccosh{arccosh}
      % \DeclareMathOperator\arcsinh{arcsinh}
      % % ================== Calculus operators ================== %
      % \DeclareMathOperator\fronteira {fr}
      % \DeclareMathOperator\interior  {int}
      % \DeclareMathOperator\exterior  {ext}
      % \DeclareMathOperator\grafico   {Graf}
      % \DeclareMathOperator\dominio   {D}
      % \DeclareMathOperator\visinhanca{\mathcal{V}}
      % % =================== Algebra operators ================== %
      % \DeclareMathOperator\adj{adj}
      % \DeclareMathOperator\id{id}
      % \DeclareMathOperator\Img{Im}
      % \DeclareMathOperator\Nuc{Nuc}
      % \DeclareMathOperator\Ker{Ker}
      % % ================== Statistics Operator ================= %
      % \DeclareMathOperator\esperanca{E}
      % \DeclareMathOperator\variancia{V}
      % \DeclareMathOperator\bernoulli{Ber}
      % \DeclareMathOperator\hiperbolica{H}
      % \DeclareMathOperator\binomial{Bin}
      % \DeclareMathOperator\poisson{P}
      % \DeclareMathOperator\normal{N}
      % % ======================================================== %
      % % ======================================================== %
      % =================== My math functions ================== %
      \makeatletter
      \newcommand*\yesnumber{\incr@eqnum\tag{\theequation}}
      \makeatother
      \usepackage{mathBM}
      \usepackage{myLogicOperators}
      % \lxor, \lnand
      % \ldiv
      % [<<*>>line break]
      % [<<l>>left column]
      % [<<r>>right column]
      % [<<division>>]
      % [<<space>>]
      % [<<beforecolumn>>]
      \usepackage{mathEnclosings}
      % \myvert[*scale]{<<content>>}
      % \myVert[*scale]{<<content>>}
      % \myrange[<<*>>invert all][<<l>>invert left][<<r>>invert right]{<<content>>}
      % % -------------------------------------------------------- %
      % %                          Vectors                         %
      % % -------------------------------------------------------- %
      % \usepackage{esvect}      % Vector over-arrow
      % \NewCommandCopy\vec\vv
      % % -------------------------------------------------------- %
      % %                           Tikz                           %
      % % -------------------------------------------------------- %
      % \usepackage{tikz}\usetikzlibrary{babel}
      % \usetikzlibrary{
      %     % perspective,
      %     % 3d,
      % }
      % % ===================== External lib ===================== %
      % \usepackage{tikz-external-setup}
      % \tikzexternalize[
      %     up to date check={simple}, % faster check
      %     figure list={true}, % generate list of figures file
      %     prefix={./.build/figures/graphics/}
      % ] % turn externalization on/off
      % % Fix background
      % \NewCommandCopy\oldtikzpicture\tikzpicture
      % \RenewDocumentCommand\tikzpicture{O{}}{\oldtikzpicture[#1]\nopagecolor}
      % % ==================== Other packages ==================== %
      % \usepackage{myTikzGraphs} % For graphs
      % \usepackage{varwidth}   % List inside TikzPicture
      % % -------------------------------------------------------- %
      % %                            pgf                           %
      % % -------------------------------------------------------- %
      % \usepackage{pgf,pgfmath,pgfplots}
      % \usepackage{pgfplotstable}
      % \usepgfplotslibrary{fillbetween}
      % % ========================= Setup ======================== %
      % % 1e4 too much
      % % 1e3 fancy
      % % 1e2 simple
      % % 1e1 draft
      % \newcommand\mysampledensityDouble{2}
      % \newcommand\mysampledensitySimple{1e1}
      % \newcommand\mysampledensityFancy{1e2}
      % \usepackage{myPGFSetup}
      % % -------------------------------------------------------- %
      % %                          Tables                          %
      % % -------------------------------------------------------- %
      % \setlength\tabcolsep{6mm}        % width
      % \renewcommand\arraystretch{1.25} % height
      % \usepackage{colortbl} % Colored Cells
      % % ==================== Color commands ==================== %
      % \newcommand\cellT[1]{\cellcolor{green!70!grey!20!background}{#1}}
      % \newcommand\cellF[1]{\cellcolor{red!70!grey!20!background}{#1}}
      % \newcommand\cellemph[1]{\cellcolor{Emph!20!background}{#1}}
      % \usepackage{multirow}
      % \usepackage{longtable}
      % \usepackage{float}\restylefloat{table}  % table position H(ere)
      % % ======================= booktabs ======================= %
      % \usepackage{booktabs}
      % \setlength\heavyrulewidth{.75pt} % Top and bottom rule
      % \setlength\lightrulewidth{.30pt} % Middle rule
      % % ======================= Mathtable ====================== %
      % \usepackage{array} % for \newcolumntype macro
      % \newcolumntype{C}{>>{$}c<<{$}} % math-mode version of c column type
      % \newcolumntype{L}{>>{$}l<<{$}} % math-mode version of l column type
      % \newcolumntype{R}{>>{$}r<<{$}} % math-mode version of r column type
      % % ===================== Table Caption ==================== %
      % \newcounter{tablecounter}
      % % \newcommand\thetable{Tabela \arabic{tablecounter}:}
      % \NewDocumentCommand\tablecaption{o m}{
      %   \stepcounter{table}
      %   Tabela \thetable{}: #2
      %   \ifblank{#2}{}{\label{table:#1}}
      %   \addcontentsline{lot}{table}{Tabela \thetable{}: #2}
      % }
      % % -------------------------------------------------------- %
      % %                           Chem                           %
      % % -------------------------------------------------------- %
      % \usepackage{chemformula} % formulas quimicas
      % \usepackage{chemfig}     % Estruturas quimicas
      % \usepackage{modiagram}   % Molecular orbital diagram
      % % ======================= modiagram ====================== %
      % \setmodiagram {
      %   names,           % Display names
      %   labels,          % Display labels
      %   labels-fs=\tiny, % label font
      % }
      % \newlength\AtomVScale    \setlength\AtomVScale{1cm}
      % \newlength\MoleculeVScale\setlength\MoleculeVScale{1cm}
      % % ====================== chemmacros ====================== %
      % \usepackage{chemmacros}
      % \chemsetup[phases]{pos=sub}
      % \newcommand{\mol}[1]{ \unit{\mole\of{\ch{ #1 }}} } % mol
      % % -------------------------------------------------------- %
      % %                          Biology                         %
      % % -------------------------------------------------------- %
      % \usepackage{mydnaseq}
      % % -------------------------------------------------------- %
      % %                           Code                           %
      % % -------------------------------------------------------- %
      % % Run on terminal: lualatex --shell-escape \[file\[.tex\]\]
      % \usepackage{shellesc, minted}
      % \setminted {
      %   linenos,     % line number
      %   autogobble,  % line trim
      %   tabsize = 4, % tab size
      %   obeytabs,    % tab alignment
      %   breaklines,  % break lines
      %   % python3,     % Python lexer or idk
      % }
      % \usemintedstyle{stata-dark}
      % % \usemintedstyle{fruity}
      % % \usemintedstyle{paraiso}
      % % \usemintedstyle{rainbow_dash}
      % % \usemintedstyle{solarized-dark}
      % % \usemintedstyle{native}
      % % -------------------------------------------------------- %
      % %                         tcolorbox                        %
      % % -------------------------------------------------------- %
      \usepackage{mytcolorbox}
      \tcbuselibrary{
        breakable,                % allow page break
        % minted, xparse, listings, % code minted
      }
      % % -------------------------------------------------------- %
      % %                         Metadata                         %
      % % -------------------------------------------------------- %
      \newcommand\mytitle   {{title here}}
      % \newcommand\myauthor  {{Felipe B. Pinto 61387 -- EQB}}
      \newcommand\myauthor  {{Felipe B. Pinto 71951 -- EQB}}
      \newcommand\mycreator {{Felipe B. Pinto}}
      \newcommand\mysubject {{subject here}}
      \newcommand\mykeywords{{{Keywords}}}
      % ================ title, author and date ================ %
      \title{\huge\bfseries\color{Emph}\mytitle}
      \author{\Large\myauthor}
      \date{\Large\today}
      % % -------------------------------------------------------- %
      % %                         fancyhdr                         %
      % % -------------------------------------------------------- %
      % \usepackage{fancyhdr}
      % \pagestyle{fancy}
      % \fancyhf{} % Clear
      % \fancyhead[R]{\normalsize\thepart}
      % \fancyfoot[L]{\normalsize\myauthor}
      % \fancyfoot[R]{\thepage}
      % \renewcommand\footrulewidth{.5pt}
      % % Marks
      % % \renewcommand{\partmark}[1]{\markboth{}{\thepart#1}}
      % % -------------------------------------------------------- %
      % %                         Subfiles                         %
      % % -------------------------------------------------------- %
      \usepackage{subfiles}
      % % -------------------------------------------------------- %
      % %                        My packages                       %
      % % -------------------------------------------------------- %
      % ======================== Setups ======================== %
      \usepackage{myhyperref}
      % ========================= Boxes ======================== %
      \usepackage{sections}
      % \usepackage{questions}
      % \usepackage{answers}
      % \usepackage{examples}
      % \usepackage{definitions}
      % ================= My title and subfile ================= %
      \usepackage{mytitle}    % \mymaketitle
      \usepackage{mysubfile}  % \mymakesubfile
      % % -------------------------------------------------------- %
      % %                  Divisions customization                 %
      % % -------------------------------------------------------- %
      \renewcommand\thesubsubsection{(\roman{subsubsection})}
      % \renewcommand\thepart{Part \arabic{part}}
      % 88                                    88
      % 88                                    \"\"
      % 88
      % 88,dPPYba,    ,adPPYba,   ,adPPYb,d8  88  8b,dPPYba,
      % 88P'    \"8a  a8P_____88  a8\"    `Y88  88  88P'   `\"8a
      % 88       d8  8PP\"\"\"\"\"\"\"  8b       88  88  88       88
      % 88b,   ,a8\"  \"8b,   ,aa  \"8a,   ,d88  88  88       88
      % 8Y\"Ybbd8\"'    `\"Ybbd8\"'   `\"YbbdP\"Y8  88  88       88
      %                           aa,    ,88
      %                            \"Y8bbdP\"
      \begin{document}
      \mymaketitle
      % print files
      \begin{luacode*}
        -- Files Directory
        dir = "./"
        -- Prefix and sufix
        prefix = "<main_file>."
        sufix  = ""
        -- Print file range
        firstFile = 1 -- first file number
        lastFile  = 1 -- last  file number
        -- Print specific files by number
        index = {1}
        -- % ---------------------------------------------------- %
        -- %                         Loop                         %
        -- % ---------------------------------------------------- %
        -- for i=firstFile,lastFile,1 -- Print range
        -- for v,i in ipairs(index)   -- Print specific
        for i=firstFile,lastFile,1 -- Print range
        do
          tex.print(string.split(table.concat{
          \[\[
            \subfile{\]\], dir, prefix, string.format("%d", i), sufix, \[\[}\newpage
          \]\]
          },"\n"))
        end
        -- % ==================================================== %
      \end{luacode*},
      \end{document}
      ]],
      { main_file = t(vim.fn.expand("%:t:r")) }
    )
  ),
}
