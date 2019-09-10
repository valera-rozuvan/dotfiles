" Disable mouse interaction if mouse is available.
" Easier to copy & paste with the mouse when working in a
" terminal emulator.
if has('mouse')
  set mouse-=a
endif

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Display line numbers on the left
set number

" Copy directly to X clipboard.
set clipboard=unnamedplus
