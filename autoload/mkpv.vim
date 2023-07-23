let s:mkpv_url = 'http://localhost:' . ($MKPV_PORT == '' ? '31622' : $MKPV_PORT)

function mkpv#sync()
    call job_start([
        \ 'curl', '-X', 'POST', '-H', 'Content-type: application/json',
        \ '--data', json_encode({ 'content': join(getline(1, '$'), "\n") }),
        \ s:mkpv_url . '/viewer' . expand('%:p')
    \])
endfunction

