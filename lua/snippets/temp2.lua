local ls = require("luasnip")

local function merge_tables(destination, source)
  for _, value in ipairs(source) do
    table.insert(destination, value)
  end
end

local snippets = {}

-- merge_tables(snippets, require("snippets.data.latex.constants"))
-- merge_tables(snippets, require("snippets.data.latex.math"))
-- merge_tables(snippets, require("snippets.data.latex.mysnippets"))
-- merge_tables(snippets, require("snippets.data.latex.tikz-pfg"))
-- -- FCT
-- merge_tables(snippets, require("snippets.data.latex.FCT.AM2C"))
-- merge_tables(snippets, require("snippets.data.latex.FCT.AM3C"))
-- merge_tables(snippets, require("snippets.data.latex.FCT.CMA"))
-- merge_tables(snippets, require("snippets.data.latex.FCT.CNA"))
-- -- require("snippets.data.latex.FCT.EB"),
-- merge_tables(snippets, require("snippets.data.latex.FCT.FTII"))
-- merge_tables(snippets, require("snippets.data.latex.FCT.OSF"))
-- merge_tables(snippets, require("snippets.data.latex.FCT.QF"))
-- merge_tables(snippets, require("snippets.data.latex.FCT.QFA"))
-- merge_tables(snippets, require("snippets.data.latex.FCT.TEQB"))
-- Templates
merge_tables(snippets, require("snippets.data.latex.templates.mainfile"))
merge_tables(snippets, require("snippets.data.latex.templates.subfile"))

for _, snip in require("snippets.data.latex.templates.mainfile") do
  print(snip)
end

ls.add_snippets("tex", snippets)
