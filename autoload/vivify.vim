let s:viv_url = 'http://localhost:' . ($VIV_PORT == '' ? '31622' : $VIV_PORT)

" Note: nvim's jobstart isn't exactly a drop-in replacement for vim's job_start
" See here: https://stackoverflow.com/questions/74999614/difference-between-vims-job-start-function-and-neovims-jobstart-functi
if has("nvim")
    let s:job_start = function("jobstart")

    " job is job_id as returned from jobstart()
    function! s:stdin_send_and_close(job, data)
        call chansend(a:job, a:data)
        call chanclose(a:job, 'stdin')
    endfunction
else
    " job is job object as returned from job_start()
    function! s:stdin_send_and_close(job, data)
        let l:channel = job_getchannel(a:job)
        call ch_sendraw(l:channel, a:data)
        call ch_close_in(l:channel)
    endfunction

    let s:job_start = function("job_start")
endif

function! s:post(data)
    let l:job = s:job_start([
        \ 'curl',
        \ '-X', 'POST',
        \ '-H', 'Content-type: application/json',
        \ '--data', '@-',
        \ s:viv_url . '/viewer' . expand('%:p')
    \])
    call s:stdin_send_and_close(l:job, json_encode(a:data))
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
        \ ['viv', expand('%:p')->substitute(':', '\\:', 'g') . ':' . getpos('.')[1]],
        \ {"in_io": "null", "out_io": "null", "err_io": "null"}
    \)
endfunction
