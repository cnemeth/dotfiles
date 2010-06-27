# #!/usr/bin/env bash
# # Set up my home directory and settings.  (I commonly use multiple computers, most of which are unix-y.)
# # 
# # Author: Benjamin Oakes <hello@benjaminoakes.com>
# set -o errexit
# 
# if [ "" == `which ruby` ] || [ "" == `which git` ]; then
#   echo "NOTE: You need to install git and ruby to continue";
#   exit -1
# fi
# 
# cd "$HOME"
# 
# mkdir -pv Downloads
# mkdir -pv Inbox
# mkdir -pv Outbox
# mkdir -pv Pending
# mkdir -pv Projects
# mkdir -pv Pending
# 
# cd "$HOME/Projects/"
# 
# git clone git@github.com:benjaminoakes/bin.git
# git clone git@github.com:benjaminoakes/dotfiles.git
# git clone git@github.com:benjaminoakes/snippets.git
# git clone git@github.com:benjaminoakes/templates.git
# git clone git@github.com:benjaminoakes/utilities.git
# 
# rm -i $HOME/.bashrc
# $HOME/Projects/dotfiles/install
# mv -i $HOME/Templates/ $HOME/.Trash
# ln -s $HOME/Projects/templates/ ~/Templates
# 
