if exists("g:loaded_vivify")
    finish
endif
let g:loaded_vivify = 1

function s:init()
    augroup vivify_sync
        autocmd!
        autocmd CursorHold,CursorHoldI *
            \ if &filetype == 'markdown' | call vivify#sync_content() | endif
        autocmd CursorMoved,CursorMovedI *
            \ if &filetype == 'markdown' | call vivify#sync_cursor() | endif
    augroup END
endfunction

augroup vivify_init
    autocmd!
    autocmd BufEnter,FileType * if &filetype == 'markdown' | call s:init() | endif
augroup END
