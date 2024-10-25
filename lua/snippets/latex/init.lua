local ls = require'luasnip'

local snippet_tables = {
  require("snippets.latex.constants"),
  require("snippets.latex.math"),
  require("snippets.latex.mysnippets"),
  require("snippets.latex.tikz-pfg"),
  require("snippets.latex.chem"),
  require("snippets.latex.boxes"),
  -- FCT
  -- require("snippets.latex.FCT.EB"),
  require("snippets.latex.FCT.AM2C"),
  require("snippets.latex.FCT.AM3C"),
  require("snippets.latex.FCT.CMA"),
  require("snippets.latex.FCT.CNA"),
  require("snippets.latex.FCT.FTII"),
  require("snippets.latex.FCT.OSF"),
  require("snippets.latex.FCT.QF"),
  require("snippets.latex.FCT.QFA"),
  require("snippets.latex.FCT.TEQB"),
  -- Templates
  require("snippets.latex.templates.mainfile"),
  require("snippets.latex.templates.subfile"),
}

local snippets = {}
for _,sniptable in ipairs(snippet_tables) do
  for _,snip in ipairs(sniptable) do
    table.insert(snippets,snip)
  end
end

ls.add_snippets('tex',snippets)
