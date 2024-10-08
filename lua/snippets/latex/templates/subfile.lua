local ls = require("luasnip")

-- local s = ls.snippet      -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
-- local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
-- local r = ls.restore_node -- restore from variable

local extras = require("luasnip.extras")
local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return {
  ms( -- Subfile Template
    {
      common = {
        name = "Subfile Template",
        desc = ""
      },
      "\\latex-template-subfile",
    },
    fmt(
      [[
        % !TEX root = ./<subfile>.tex
        \documentclass[<mainfile>.tex]{subfiles}

        % \tikzset{external/force remake=true} % - remake all

        \begin{document}

        % \graphicspath{{\subfix{./.build/figures/<subfile_r>}}}
        % \tikzsetexternalprefix{./.build/figures/<subfile_r>/graphics/}

        \mymakesubfile{<part_counter>}<di_g><group><do_g>
        {<title_sub>} % Subfile Title
        {<title_main>} % Part Title

        <body>

        \end{document}
      ]],
      {
        subfile = i(1, "subfile.tex"),
        subfile_r = rep(1),
        mainfile = i(2, "mainfile.tex"),
        part_counter = i(3, "part counter"),
        group = i(4, "group"),
        di_g = ne(4, "["),
        do_g = ne(4, "]"),
        title_sub = i(5, "subfile title"),
        title_main = i(6, "mainfile title"),
        body = i(0, "body"),
      }
    )
  ),
}