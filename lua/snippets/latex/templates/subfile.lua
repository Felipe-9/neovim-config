local ls = require("luasnip")

-- local s = ls.snippet      -- build snippets
local ms = ls.multi_snippet -- build snippets with multiple triggers
local t = ls.text_node -- insert text
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
        -- desc = ""
      },
      "\\latex-template-subfile",
      "latex-template-subfile"
    },
    fmt(
      [[
        % !TEX root = ./<subfile>.tex
        \documentclass["<mainfile>.tex"]{subfiles}

        % \tikzset{external/force remake=true} % - remake all

        \begin{document}

        % \graphicspath{{\subfix{./.build/figures/<subfile>}}}
        % \tikzsetexternalprefix{./.build/figures/<subfile>/graphics/}

        \mymakesubfile{<part_counter>}<di_g><group><do_g>
        {<title_sub>} % Subfile Title
        {<title_main>} % Part Title

        <body>

        \end{document}
      ]],
      {
        -- subfile = i(1, "subfile.tex"),
        subfile = t(vim.fn.expand("%:t:r")),
        mainfile = i(1,vim.fn.expand("%:t:r:r")),
        part_counter = i(2, "part counter"),
        group = i(3, "group"),
        di_g = ne(3, "["),
        do_g = ne(3, "]"),
        title_sub = i(4, "subfile title"),
        title_main = i(5, "mainfile title"),
        body = i(0, "body"),
      }
    )
  ),
}
