return {
  --   -- event = { "BufRead" },
  --   dependencies = {
  --     "ibhagwan/fzf-lua",
  --     "L3MON4D3/LuaSnip",
  --   },
  config = function()
    local fzf = require("fzf-lua")
    local ls = require("luasnip")

    local function search_snippets()
      -- Get available snippets
      local snippets = ls.available()

      -- Flatten the snippets table and prepare entries for fzf-lua
      local entries = {}
      for category, snippet_list in pairs(snippets) do
        if type(snippet_list) == "table" then
          for _, snippet in ipairs(snippet_list) do
            local description = snippet.description[1] or "" -- Extract the first description if available
            local entry = string.format("%s - %s (%s) : %s", snippet.trigger, snippet.name, category, description)
            table.insert(entries, entry)
          end
        end
      end

      -- Use fzf-lua to search through snippets
      fzf.fzf_exec(entries, {
        prompt = "Select Snippet> ",
        actions = {
          ["default"] = function(selected)
            if #selected > 0 then
              -- Extract the trigger from the selected entry
              local trigger = selected[1]:match("^(.-)%s+-")

              -- Insert the trigger into the current buffer and go into insert mode
              vim.api.nvim_put({ trigger }, "c", true, true)
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>i", true, true, true), "n", true)
            end
          end,
        },
      })
    end

    vim.keymap.set("n", "<leader>fl", search_snippets, { desc = "snippets" })
  end,
}
