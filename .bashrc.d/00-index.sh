. ~/.bashrc.d/01-exports.sh
. ~/.bashrc.d/02-aliases.sh

~/.profile.d/01-ssh-agent.sh
source 

# For local modifications - put other `.bashrc` related configs in `99-other.sh` file.
# The file `99-other.sh` is not tracked by git.
if [ -f ~/.bashrc.d/99-other.sh ]; then
    . ~/.bashrc.d/99-other.sh
fi
