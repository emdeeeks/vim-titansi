if !has('python')
    com! -nargs=* CoVim echoerr "Error: Titansi requires vim compiled with +python"
    finish
endif
