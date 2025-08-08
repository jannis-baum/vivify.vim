if exists("g:loaded_vivify")
    finish
endif
let g:loaded_vivify = 1

let s:vivify_instant_refresh = get(g:, "vivify_instant_refresh", 1)
let s:vivify_auto_scroll = get(g:, "vivify_auto_scroll", 1)

let s:filetype_match_str = 'markdown'
if exists("g:vivify_filetypes")
    call add(g:vivify_filetypes, s:filetype_match_str)
    let s:filetype_match_str = join(g:vivify_filetypes, '\|')
endif

function! s:is_vivify_filetype(filetype)
	return match(a:filetype, s:filetype_match_str) != -1
endfunction

function! s:init()
    augroup vivify_sync
        autocmd!
        if s:vivify_instant_refresh
            autocmd TextChanged,TextChangedI *
                \ if s:is_vivify_filetype(&filetype) | call vivify#sync_content() | endif
        else
            autocmd CursorHold,CursorHoldI *
                \ if s:is_vivify_filetype(&filetype) | call vivify#sync_content() | endif
        endif
        if s:vivify_auto_scroll
            autocmd CursorMoved,CursorMovedI *
                \ if s:is_vivify_filetype(&filetype) | call vivify#sync_cursor() | endif
        endif
    augroup END
endfunction

augroup vivify_init
    autocmd!
    autocmd BufEnter,FileType * if s:is_vivify_filetype(&filetype) | call s:init() | endif
augroup END

command! Vivify call vivify#open()
