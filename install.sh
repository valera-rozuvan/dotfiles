#!/bin/bash

WD=$(pwd)

chmod u+x $WD/.profile.d/01-ssh-agent.sh

rm -rf ~/.bash*
rm -rf ~/.profile*
rm -rf ~/.nano*
rm -rf ~/.Xdefaults*
rm -rf ~/.xsession*

ln -s $WD/.bashrc.d    ~/.bashrc.d
ln -s $WD/.profile.d   ~/.profile.d
ln -s $WD/.bash_logout ~/.bash_logout
ln -s $WD/.bashrc      ~/.bashrc
ln -s $WD/.nanorc      ~/.nanorc
ln -s $WD/.profile     ~/.profile
ln -s $WD/.Xdefaults   ~/.Xdefaults
ln -s $WD/.xsessionrc  ~/.xsessionrc

echo "Done!"
exit 0
