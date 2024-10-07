return {
  "AckslD/nvim-neoclip.lua",
  require = {
    {'kkharji/sqlite.lua', module = 'sqlite'},
    {'nvim-telescope/telescope.nvim'},
    {'ibhagwan/fzf-lua'},
  },
  config = function()
    require('neoclip').setup({
      enable_persistent_history = true, -- use sqlite to save history between sessions
    })
  end,
}
