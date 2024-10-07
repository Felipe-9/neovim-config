<details> <summary>

### 1.1.2. requiring snippets from `lua/snippets/data/latex/*`
</summary>
<details> <summary>

    `lua/snippets/tex.lua`
</summary>

```lua
local ls = require("luasnip")

ls.add_snippets(
  "tex",
  require("snippets.data.latex.mysnippets")
)
```
</details> <details> <summary> `lua/snippets/data/latex/mysnippets.lua` </summary>

```lua
local ls = require("luasnip")

local s = ls.snippet -- build snippets
local t = ls.text_node -- insert text
local i = ls.insert_node -- user input
local c = ls.choice_node -- multiple options

local extras = require("luasnip.extras")
-- local rep = extras.rep -- repeat for multiple cursors
local ne = extras.nonempty
local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

return
  --
  s(
    {
      desc = "my desc",
      trig = "\\my-trig",
    },
    fmt(
      [[
      a^2 + b^2 = c^2
    ]], {})
  )
```
</details> <details> <summary> photo </summary>

Test
`ls.log.open()`
Error
</details>
</details>
