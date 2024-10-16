return {
  'tikhomirov/vim-glsl',
  config = function ()
    vim.api.nvim_create_autocmd({"BufNewFile","BufRead"},{
      pattern = {"*.vs","*.fs","*.vert","*.frag"},
      callback = function() vim.o.ft = "glsl" end,
    })
  end
}
