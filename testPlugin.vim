fun! Scratch(cmd)
    vnew
    setlocal nobuflisted buftype=nofile bufhidden=delete

    let output = systemlist(a:cmd)
    call append(0, l:output)
endfun
