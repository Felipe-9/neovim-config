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
  ms( -- Question Box environment
    {
      common = {
        name = "questionBox",
        desc = "environment"
      },
      -- trig
      "\\questionBox",
      "\\begin{questionBox}",
      "\\BQB",
    },
    fmt(
      [[
      \begin{questionBox}<opts>{<title>} % Q<index>
        <body>
      \end{questionBox}
      ]],
      {
        opts = i(1, "opts"),
        index = i(2, "index"),
        title = i(3, "question"),
        body = i(0, "body"),
      }
    )
  ),
  ms( -- Proposition Box environment
    {
      common = {
        name = "propositionBox",
        desc = "environment"
      },
      "\\propositionBox",
      "\\begin{propositionBox}",
      "\\BPB",
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
        body = i(0, "body"),
      }
    )
  ),
  ms( -- Answer Box environment
    {
      common = {
        name = "answerBox",
        desc = "environment",
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
        body = i(0, "body"),
      }
    )
  ),
  ms( -- Definition Box environment
    {
      common = {
        name = "definitionBox",
        desc = "environment",
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
        body = i(0, "body"),
      }
    )
  ),
  ms( -- Example Box environment
    {
      common = {
        name = "exampleBox",
        desc = "environment",
      },
      -- trig
      "\\exampleBox",
      "\\begin{exampleBox}",
      "\\BEB",
    },
    fmt(
      [[
      \begin{exampleBox}<opts>{<title>} % E<index>
        <body>
      \end{exampleBox}
      ]],
      {
        opts = i(1, "opts"),
        index = i(2, "index"),
        title = i(3, "question"),
        body = i(0, "body"),
      }
    )
  ),
  ms( -- sectionBox environment
    {
      common = {
        name = "sectionBox",
        desc = "environment",
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
        opts= i(1, "opts"),
        index= i(2, "index"),
        title = i(3, "section"),
        body= i(0, "body"),
      }
    )
  ),
}
