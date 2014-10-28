test -f ~/.profile && source ~/.profile
test -f ~/.bashrc && source ~/.bashrc

# Add syntax highlighting for less
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS='-R'

# Bash completion
if [ -f /sw/etc/bash_completion ]; then
   . /sw/etc/bash_completion
fi

# Homebrew
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# vi edit mode for commandline
set -o vi

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# bundler editor to vim
export BUNDLER_EDITOR=vim

# EOF - This marks the end of the .bashrc file

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
