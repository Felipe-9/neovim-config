I feel like my last reply was a bit confusing so im going to try to break down a bit better the situation overall...

Here is the different configurations i tried so far:


1. No `lua/snippets` directory, everything is inside `lua/plugins/luasnip.lua`
- 1.1. using `ls.add_snippets('tex',{...})`
- 1.2. using `lua-loader`
2. Multiple files in `lua/snippets/latex/*` imported using `lua-loader`
3. Single file `lua/snippets/tex.lua`

- 3.1. using `ls.add_snippets('tex',{...})`
  - 3.1.1. using only locally defined snippets
  - 3.1.2. requiring snippets from `lua/snippets/data/latex/*`
- 3.2. using `lua-loader`
  - 3.2.1. using only locally defined snippets
  - 3.2.2. requiring snippets from `lua/snippets/data/latex/*`

- 3.1 using `ls.add_snippets("tex",{...})`
- 3.2 using `lua-loader`

<!-- `lua/snippets/data/latex/example.lua` -->
<details>
    <summary>
        
        `lua/snippets/data/latex/example.lua`
        for 1.1.2, 1.2.2 and 2.
    </summary>
    These are common for every configuration, difeering only on **2.** on which they have a different path (`lua/snippets/latex/*`) without subdirectories

    ```lua
    local ls = require("luasnip")

    local s = ls.snippet -- build snippets
    local t = ls.text_node -- insert text
    local i = ls.insert_node -- user input
    local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

    return
      --
      s( -- first snippet
      {
        desc = "description",
        trig = "\\my-trigger",
      },
      fmt(
        [[
        \odif{g}
        = v\,\odif{p}
        -s\,\odif{t}
        ]],
        {}
      )
    ),
    s(...),
    s(...),
    ...
    ```
</details>
<!-- Error -->
<details>
    <summary>
        Error tracing
    </summary>

    to check where error could appear or which files are being read im introducing an error check where whenever in a config i describe a snippet with `s({...},fmt([[...]],{...})) i substitute it for `s()` (empty), so that it raises an error that stacktree can show
</details>

<!-- 1. -->
<!-- 2. -->
<!-- 3. -->
