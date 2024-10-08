function! MyHighlights() abort
  highlight def link texCmdSpacing texMathDelim
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
