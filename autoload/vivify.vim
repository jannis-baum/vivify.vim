let s:viv_url = 'http://localhost:' . ($VIV_PORT == '' ? '31622' : $VIV_PORT)

" Note: nvim's jobstart isn't exactly a drop-in replacement for vim's job_start
" See here: https://stackoverflow.com/questions/74999614/difference-between-vims-job-start-function-and-neovims-jobstart-functi
if has("nvim")
    let s:job_start = function("jobstart")
else
    let s:job_start = function("job_start")
endif

function! s:post(data)
    call s:job_start([
        \ 'curl', '-X', 'POST', '-H', 'Content-type: application/json',
        \ '--data', json_encode(a:data),
        \ s:viv_url . '/viewer' . expand('%:p')
    \])
endfunction

function! vivify#sync_content()
    call s:post({ 'content': join(getline(1, '$'), "\n") })
endfunction

function! vivify#sync_cursor()
    call s:post({ 'cursor': getpos('.')[1] })
endfunction

function! vivify#open()
    " Note: nvim's jobstart doesn't use these opt keys
    call s:job_start(
        \ ['viv', expand('%:p')],
        \ {"in_io": "null", "out_io": "null", "err_io": "null"}
    \)
endfunction
