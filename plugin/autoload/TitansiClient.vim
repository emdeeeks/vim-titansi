if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

com! -nargs=* Titansi py Titansi.command(<f-args>)

python3 << EOF

import vim
import os
import json
import termios
import sys
import tty

del vim.current.buffer[:]

with open(sys.argv[1], 'rb') as file:

output.encode('cp437')

EOF
