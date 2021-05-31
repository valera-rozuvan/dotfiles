#!/bin/bash

rm -rf ~/.bash*
rm -rf ~/.profile*
rm -rf ~/.nano*
rm -rf ~/.Xdefaults*
rm -rf ~/.xsessionrc*

WD=$(pwd)

ln -s ~/.bashrc.d    $WD/.bashrc.d
cp -s ~/.profile.d   $WD/.profile.d
ln -s ~/.bash_logout $WD/.bash_logout
ln -s ~/.bashrc      $WD/.bashrc
ln -s ~/.nanorc      $WD/.nanorc
ln -s ~/.profile     $WD/.profile
ln -s ~/.Xdefaults   $WD/.Xdefaults
ln -s ~/.xsessionrc  $WD/.xsessionrc

echo "Done!"
exit 0
