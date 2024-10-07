<details> <summary>

# 1.1. using `ls.add_snippets('tex',{...})`
</summary>
<details> <summary>
    
`lua/plugins/luasnip.lua`
</summary>

```lua
return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  event = "InsertEnter",
  dependencies = {
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  config = function()
    local ls = require("luasnip")

    ls.log.set_loglevel("info")

    -- -- for lua-loader
    -- ls.setup({
    --   snip_env = {
    --     s = function (...)
    --       local snip = ls.s(...)
    --       table.insert(getfenv(2).ls_file_snippets, snip)
    --     end,
    --     parse = function (...)
    --       local snip = ls.parser.parse_snippet(...)
    --       table.insert(getfenv(2).ls_file_snippets, snip)
    --     end
    --   }
    -- })

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    -- require("luasnip.loaders.from_lua").load({path="~/.config/nvim/lua/snippets"})
    -- require("snippets.init")

    local s = ls.snippet -- build snippets
    local t = ls.text_node -- insert text
    local i = ls.insert_node -- user input
    local c = ls.choice_node -- multiple options

    local extras = require("luasnip.extras")
    -- local rep = extras.rep -- repeat for multiple cursors
    local ne = extras.nonempty
    local fmt = require("luasnip.extras.fmt").fmta -- formatting with [[]] and delimiters=<>

    ls.add_snippets(
      "tex", --
      {
        s(
          {
            desc = "my desc",
            trig = "\\my-trig",
          },
          fmt(
            [[
          a^2 + b^2 = c^2
          ]],
            {}
          )
        ),
      }
    )

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
    end
  end,
}
```
</details> <details> <summary>

Photos
</summary>

Test
`ls.log.open()`
</details>
</details>
