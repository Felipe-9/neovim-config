return {
  'mrjones2014/legendary.nvim',
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = false,
  -- sqlite is only needed if you want to use frecency sorting
  dependencies = { 'kkharji/sqlite.lua' },
  keys = {
    { "<leader>fpp", ":Legendary<CR>", desc = "palette" },
    { "<leader>fpc", ":Legendary commands<CR>", desc = "palette commands" },
    { "<leader>fpk", ":Legendary keymaps<CR>", desc = "palette keymaps" },
    { "<leader>fpf", ":Legendary functions<CR>", desc = "palette functions" },
    { "<leader>fpa", ":Legendary autocmds<CR>", desc = "palette autocmds" },
  },
}
