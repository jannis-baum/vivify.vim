let s:mkpv_url = 'http://localhost:' . ($MKPV_PORT == '' ? '31622' : $MKPV_PORT)

function s:post(data)
    call job_start([
        \ 'curl', '-X', 'POST', '-H', 'Content-type: application/json',
        \ '--data', json_encode(a:data),
        \ s:mkpv_url . '/viewer' . expand('%:p')
    \])
endfunction

function mkpv#sync_content()
    call s:post({ 'content': join(getline(1, '$'), "\n") })
endfunction

function mkpv#sync_cursor()
    call s:post({ 'cursor': getpos('.')[1] })
endfunction
