if exists("g:loaded_mkpv")
    finish
endif
let g:loaded_mkpv = 1

function s:init()
    augroup mkpv_sync
        autocmd!
        autocmd CursorHold,CursorHoldI *
            \ if &filetype == 'markdown' | call mkpv#sync_content() | endif
        autocmd CursorMoved,CursorMovedI *
            \ if &filetype == 'markdown' | call mkpv#sync_cursor() | endif
    augroup END
endfunction

augroup mkpv_init
    autocmd!
    autocmd BufEnter,FileType * if &filetype == 'markdown' | call s:init() | endif
augroup END
