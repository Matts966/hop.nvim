if !has('nvim')
  echohl Error
  echom 'This plugin only works with Neovim'
  echohl clear
  finish
endif

" The jump-to-word command.
command! HopWord lua require'hop'.hint_words()
command! HopWordVisual lua require'hop'.hint_words({ extend_visual = true })

" The jump-to-pattern command.
command! HopPattern lua require'hop'.hint_patterns()
command! HopPatternVisual lua require'hop'.hint_patterns({ extend_visual = true })

" The jump-to-char-1 command.
command! HopChar1 lua require'hop'.hint_char1()
command! HopChar1Visual lua require'hop'.hint_char1({ extend_visual = true })

" The jump-to-char-2 command.
command! HopChar2 lua require'hop'.hint_char2()
command! HopChar2Visual lua require'hop'.hint_char2({ extend_visual = true })

" The jump-to-line command.
command! HopLine lua require'hop'.hint_lines()
command! HopLineVisual lua require'hop'.hint_lines({ extend_visual = true })

" Reset highlighting after loading a new color scheme
function! hop#highlight_init()
    " Highlight used for the mono-sequence keys (i.e. sequence of 1).
    highlight default HopNextKey  guifg=#ff007c gui=bold,underline

    " Highlight used for the first key in a sequence.
    highlight default HopNextKey1 guifg=#00dfff gui=bold,underline

    " Highlight used for the second and remaining keys in a sequence.
    highlight default HopNextKey2 guifg=#2b8db3

    " Highlight used for the unmatched part of the buffer.
    highlight default HopUnmatched guifg=#666666
endfunction
augroup HopInitHighlight
    autocmd!
    autocmd ColorScheme * call hop#highlight_init()
augroup end
call hop#highlight_init()
