" Disable mouse interaction if mouse is available. Easier to copy & paste with the mouse when working in a terminal emulator.
if has('mouse')
  set mouse-=a
endif

" Display the cursor position on the last line of the screen or in the status line of a window.
set ruler

" Display line numbers on the left.
set number

" Copy directly to X clipboard.
set clipboard=unnamedplus

" Highlighting search matches.
set hlsearch

" Remove all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Set up a virtual ruler to show 120 max line length.
:set colorcolumn=120

" Define custom keys.
:map <F1> :tabe<space>
:map <F2> :tabp<CR>
:map <F3> :tabn<CR>
:map <F4> :tabnew<CR>

:map <F5> :edit!<CR>
:map <F6> :w<CR>
:map <C-F6> :wq<CR>

:map <F9> zt
:map <F10> zz
:map <F11> zb

:map <F12> :q!<CR>

