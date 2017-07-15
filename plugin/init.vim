if !has('python3')
    echo "Error: Required vim compiled with +python3"
    finish
endif

com! -nargs=* Titansi py3 TitansiClient.__init__(<f-args>)

py3file TitansiClient.py

au BufReadPre *.ans call <SID>init()
au BufReadPost *.ans call <SID>deinit()
au BufReadPre *.nfo call <SID>init()
au BufReadPost *.nfo call <SID>deinit()
au BufReadPre *.asc call <SID>init()
au BufReadPost *.asc call <SID>deinit()
au BufReadPre *.xbin call <SID>init()
au BufReadPost *.xbin call <SID>deinit()

function! SetupMovementDetection()
    autocmd CursorMovedI * :call MultiUserCursorMoved()
    autocmd CursorMoved * :call MultiUserCursorMoved()
endfunction
