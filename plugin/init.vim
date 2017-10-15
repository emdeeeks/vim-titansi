if !has('python3')
    echo "Error: Required vim compiled with +python3"
    finish
endif

py3file TitansiClient.py

function! SetupMovementDetection()
    autocmd CursorMovedI * :call MultiUserCursorMoved()
    autocmd CursorMoved * :call MultiUserCursorMoved()
endfunction
