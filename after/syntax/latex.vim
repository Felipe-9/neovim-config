syntax match texCmdSpacing "\\[,:;!]"
syntax match texCmdSpacing "\\q{1,2}uad"

function! MyHighlights() abort
  highlight def link texCmdSpacing texMathDelim
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

call MyHighlights()
autosmd BufWritePost $MYVIMRC nested source $MYVIMRC
