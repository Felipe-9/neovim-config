<details> <summary>
    
# 2. Multiple files in `lua/snippets/latex/*` imported using `lua-loader`
</summary>
<details> <summary>
    
    `lua/plugins/luasnip.lua`
</summary>

```lua
return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  -- version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  event = "InsertEnter",
  dependencies = {
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  config = function()
    local ls = require("luasnip")

    ls.setup({
      snip_env = {
        s = function (...)
          local snip = ls.s(...)
          table.insert(getfenv(2).ls_file_snippets, snip)
        end,
        parse = function (...)
          local snip = ls.parser.parse_snippet(...)
          table.insert(getfenv(2).ls_file_snippets, snip)
        end
      }
    })

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_lua").load({paths="~/.config/nvim/lua/snippets"})
    -- require("snippets.init")

    vim.keymap.set({ "i" }, "<C-K>", function()
      ls.expand()
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-n>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)
  end,
}
```
</details> <details> <summary> `lua/snippets/tex.lua` </summary>

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

return { --
  s(
    {
      desc = "my desc1",
      trig = "\\my-trig1",
    },
    fmt(
      [[
      a^2 + b^2 = c^2
      ]],
      {}
    )
  ),
}
```
</details> <details> <summary> `lua/snippets/latex/mysnippets.lua` </summary>

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

return { --
  s(
    {
      desc = "my desc2",
      trig = "\\my-trig2",
    },
    fmt(
      [[
      a^2 + b^2 = c^2 + d^2
      ]],
      {}
    )
  ),
}
```
</details> <details> <summary> Photos </summary>

Test
`ls.log_open()`
Error
I tried breaking sequentially `tex.lua` then `mysnippets.lua` but there was no achknowledgment of error on neovim
</details>
</details>
