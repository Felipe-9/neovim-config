return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  event = "InsertEnter",
  dependencies = {
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  config = function()
    local ls = require("luasnip")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})

    vim.keymap.set({ "i", "s" }, "<C-n>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)
  end
}