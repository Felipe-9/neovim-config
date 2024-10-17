return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  event = "InsertEnter",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",     -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    -- "ibhagwan/fzf-lua",
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

    require("luasnip.loaders.from_vscode").lazy_load()
    -- require("luasnip.loaders.from_lua").load({ path = "~/.config/nvim/lua/snippets" })
    require("snippets.init")

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

    -- local fzf = require("fzf-lua")
    -- local function search_snippets()
    --   -- Get available snippets
    --   local snippets = ls.available()
    --
    --   -- Flatten the snippets table and prepare entries for fzf-lua
    --   local entries = {}
    --   for category, snippet_list in pairs(snippets) do
    --     if type(snippet_list) == "table" then
    --       for _, snippet in ipairs(snippet_list) do
    --         local description = snippet.description[1] or "" -- Extract the first description if available
    --         local entry = string.format("%s - %s (%s) : %s", snippet.trigger, snippet.name, category, description)
    --         table.insert(entries, entry)
    --       end
    --     end
    --   end
    --
    --   -- Use fzf-lua to search through snippets
    --   fzf.fzf_exec(entries, {
    --     prompt = "Select Snippet> ",
    --     actions = {
    --       ["default"] = function(selected)
    --         if #selected > 0 then
    --           -- Extract the trigger from the selected entry
    --           local trigger = selected[1]:match("^(.-)%s+-")
    --
    --           -- Insert the trigger into the current buffer and go into insert mode
    --           vim.api.nvim_put({ trigger }, "c", true, true)
    --           vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>i", true, true, true), "n", true)
    --         end
    --       end,
    --     },
    --   })
    -- end
    --
    -- vim.keymap.set('n','<leader>fl', search_snippets, {desc = "snippets"})
  end,
}
