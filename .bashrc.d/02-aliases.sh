# Start Emacs in daemon mode.
alias start_e='emacs --daemon'

# Edit a file using Emacs client (make sure to start Emacs in daemon mode first).
# To use, simply run like so: `e ./some/file` - this will open the file for you to edit.
alias e='function _e(){ emacsclient --create-frame --quiet --no-wait "${1}" ; };_e'

# I always pass these flags to `ls`, so make it permanent.
alias ls='ls -ahl --color=auto'

# Simplify invocation of `diceware`.
# To use, simply run like so: `rnd_words 6` - this will produce 6 random words.
alias rnd_words='diceware -d " " --no-caps -w en_eff'
