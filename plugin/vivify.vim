if exists("g:loaded_vivify")
    finish
endif
let g:loaded_vivify = 1

let s:filetype_match_str = 'markdown'

function! s:is_vivify_filetype(filetype)
	return match(a:filetype, s:filetype_match_str) != -1
endfunction

function! s:init()
    augroup vivify_sync
        autocmd!
        autocmd CursorHold,CursorHoldI *
            \ if s:is_vivify_filetype(&filetype) | call vivify#sync_content() | endif
        autocmd CursorMoved,CursorMovedI *
            \ if s:is_vivify_filetype(&filetype) | call vivify#sync_cursor() | endif
    augroup END
endfunction

augroup vivify_init
    autocmd!
    autocmd BufEnter,FileType * if s:is_vivify_filetype(&filetype) | call s:init() | endif
augroup END

command! Vivify call vivify#open()
