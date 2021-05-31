. ~/.profile.d/01-ssh-agent.sh

# For local modifications - put other `.profile` related configs in `99-other.sh` file.
# The file `99-other.sh` is not tracked by git.
if [ -f ~/.profile.d/99-other.sh ]; then
    . ~/.profile.d/99-other.sh
fi
