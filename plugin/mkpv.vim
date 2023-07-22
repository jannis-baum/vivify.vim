if exists("g:loaded_mkpv")
    finish
endif
let g:loaded_mkpv = 1

function s:init()
    augroup mkpv_sync
        autocmd!
        autocmd CursorHold * if &filetype == 'markdown' | call mkpv#sync() | endif
    augroup END
endfunction

augroup mkpv_init
    autocmd!
    autocmd BufEnter,FileType * if &filetype == 'markdown' | call s:init() | endif
augroup END
