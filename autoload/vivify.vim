let s:viv_url = 'http://localhost:' . ($VIV_PORT == '' ? '31622' : $VIV_PORT)

function! s:post(data)
    call job_start([
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
    call job_start(
        \ ['viv', expand('%:p')],
        \ {"in_io": "null", "out_io": "null", "err_io": "null"}
    \)
endfunction
