alias e='function _e(){ emacsclient --create-frame --quiet --no-wait "${1}" ; };_e'
alias f='function _f(){ find . -name "${1}" ; };_f'
alias g='function _g(){ grep -ir "${1}" . ; };_g'
alias mc='EDITOR=run-emacsclient mc'
alias ls='ls -ahl --color=auto'

alias git-clean='rm -rf * && git reset --hard && git checkout master && git reset --hard origin/master && git pull origin master'

PATH=$PATH:~/bin/node-v10.16.0-linux-x64/bin
# PATH=$PATH:~/bin/node-v12.5.0-linux-x64/bin
