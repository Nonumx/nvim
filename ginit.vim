if exists('g:fvim_loaded')
    " good old 'set guifont' compatibility with HiDPI hints...
    if g:fvim_os == 'windows' || g:fvim_render_scale > 1.0
      set guifont=iMWritingMono\ Nerd\ Font:h14
    else
      set guifont=iMWritingMono\ Nerd\ Font:h28
    endif
      
    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
    
    " Enable fancy scroll effects
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
endif