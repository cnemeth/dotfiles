#!/bin/sh
# See show_usage()
# 
# I commonly use multiple computers, most of which are Unix-y.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>
set -o errexit

show_usage() {
  cat <<EOF
Usage: $0 [--help | --limited]

Set up my working environment on a Unix-based OS.

Requires ruby and git to be installed, unless you use the --limited option.
EOF
  exit 1
}

if [ "--help" == "$1" ]; then
  show_usage
fi

if [ "--limited" == "$1" ]; then
  full_install=false 
else
  full_install=true
fi

if $full_install; then
  if which ruby && which git; then
    echo "INFO: git and ruby are installed"
  else
    echo "ERROR: You need to install git and ruby to continue"
    echo ''
    echo 'Run with the --limited option to set up a limited environment'
    exit 1 
  fi
fi

cd "$HOME"

for directory in Downloads Inbox Outbox Pending Projects Pending Reference; do
  echo mkdir -p "$directory"
  mkdir -p "$directory"
done

if $full_install; then
  cd "$HOME/Projects/"
  
  for repository in bin dotfiles snippets templates utilities; do
    echo git clone "git@github.com:benjaminoakes/bin.git"
    git clone "git@github.com:benjaminoakes/$repository.git"
  done
  
  if [ -f "$HOME/.bashrc" ]; then rm -i "$HOME/.bashrc"; fi # Sometimes there (e.g., Ubuntu)
  cd $HOME/Projects/dotfiles
  $HOME/Projects/dotfiles/install
  if [ -d "$HOME/Templates" ]; then mv -i $HOME/Templates/ $HOME/.Trash; fi # Sometimes there (e.g., Ubuntu)
  ln -s $HOME/Projects/templates/ $HOME/Templates
else
  base_download_url="http://github.com/benjaminoakes/dotfiles/raw/master"
  
  echo wget "$base_download_url/profile"
  wget "$base_download_url/profile"
  echo mv profile $HOME/.profile
  mv profile $HOME/.profile
fi
