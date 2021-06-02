#!/bin/bash

set -o errexit
set -o pipefail

function hndl_SIGHUP() {
  echo "Unfortunately, the script received SIGHUP..."
  exit 1
}
function hndl_SIGINT() {
  echo "Unfortunately, the script received SIGINT..."
  exit 1
}
function hndl_SIGQUIT() {
  echo "Unfortunately, the script received SIGQUIT..."
  exit 1
}
function hndl_SIGABRT() {
  echo "Unfortunately, the script received SIGABRT..."
  exit 1
}
function hndl_SIGTERM() {
  echo "Unfortunately, the script received SIGTERM..."
  exit 1
}

trap hndl_SIGHUP  SIGHUP
trap hndl_SIGINT  SIGINT
trap hndl_SIGQUIT SIGQUIT
trap hndl_SIGABRT SIGABRT
trap hndl_SIGTERM SIGTERM

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

echo -e "\nDone, without errors ;)"
exit 0
