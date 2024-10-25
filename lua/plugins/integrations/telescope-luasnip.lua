return {
  "benfowler/telescope-luasnip.nvim",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "nvim-telescope/telescope.nvim",
  },
  module = "telescope._extensions.luasnip", -- if you wish to lazy-load
  config = function()
    require("telescope").load_extension("luasnip")
    vim.keymap.set("n", "<leader>fl", "<cmd>Telescope luasnip<cr>", {
      noremap = true,
      desc = "Snippets",
    })
  end,
}
