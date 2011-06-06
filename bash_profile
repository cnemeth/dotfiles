#!/usr/bin/env bash
# Settings for the bash shell.
#
# This file is called when making a new login (interactive) shell.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# General Configuration
# =====================

# Example (in green):
# 
#   MyMachine:~ (22:56) ben$ 
export PS1="\[\e[1;32m\]\h:\W (\$(date +"%H:%M")) \u\$\[\e[0;39m\] "

# Input configuration
# ===================

# See also: ~/.inputrc

# Allow a key-press to clear the screen.  Typically, this is ^L in emacs mode.
bind -x '"\C-l":clear' # FIXME this doesn't seem to work in OS X's GNU screen

# Path Configuration
# ==================

# Please **DON'T** do this:  export PATH=".:$PATH"
# 
# See also: http://www.faqs.org/faqs/unix-faq/faq/part2/section-13.html

# For Homebrew (...I think)
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Allow me to run user-specific programs
export PATH=$HOME/Projects/bin:$PATH
export PATH=$HOME/Projects/utilities:$PATH

if [ "Darwin" == `uname` ]; then
  export PATH=$HOME/Projects/bin/osx:$PATH
  export PATH=$HOME/Projects/utilities/osx:$PATH
fi

if [ "Linux" == `uname` ]; then
  export PATH=$HOME/Projects/bin/linux:$PATH
  export PATH=$HOME/Projects/utilities/linux:$PATH
fi

# Allow me to use gem executables installed to my home directory
export PATH="$HOME/.gem/ruby/1.8/bin:$PATH"

# Path changes for Ruby gem utilities (such as `cheat`, `rake`, `rdebug`, etc.)
export PATH=/var/lib/gems/1.8/bin:$PATH

# Path changes for Git on (at least) OS X 10.5
export PATH=/usr/local/git/bin:$PATH

# Path changes for MySQL on (at least) OS X 10.5
export PATH=/usr/local/mysql/bin/:$PATH
export MANPATH=/usr/local/mysql/man:$MANPATH

# Path changes for SML/NJ on (at least) OS X 10.5
export PATH=/usr/local/smlnj-110.68/bin:$PATH
 
# Path changes for custom programs
export PATH=/usr/local/bin:$PATH
export MANPATH=/usr/local/man/:$MANPATH

# Path changes for custom LaTeX styles
# 
# IMPORTANT:
# 
# * The trailing colon indicates the standard search path should be appended to the user specified
# * A double trailing slash indicates this directory is to be searched recursively
export TEXINPUTS=".:$HOME/.latex//:"
export BIBINPUTS=".:$HOME/.bibtex//:"
export BSTINPUTS=".:$HOME/.bibtex//:"

# Command Configuration
# =====================

# Use color versions of commands (ls, etc.)
export CLICOLOR=1
# Set vim to be my editor of choice
export EDITOR="/usr/bin/vim"
export VISUAL=$EDITOR

# Aliases
# =======

# I almost always don't want results from some directories -- you can always `cd` in there if you want to get results.
# FIXME --perl-regex' is not supported on OS X.  Maybe ack is a better option?
alias grep='grep --line-number --context=2 --color=auto --exclude=log/**/* --exclude=working/**/* --exclude=doc/**/* --exclude=vendor/**/*'

# Customize less to act a little nicer
alias less="less --long-prompt --RAW-CONTROL-CHARS --quiet"

# Write a slash (`/') after each filename if that file is a directory. 
if [ "Linux" == `uname` ]; then
  # I've found that Linux doesn't always respect the CLICOLOR option, so you have to help it out a little: 
  alias ls="ls --color=auto -p"

  # gnome-open is about the equivalent to open in OS X, but is a little annoying to type
  alias open="gnome-open"
else
  alias ls="ls -p"
fi

# # Use MSSQL from the command line
# alias mssql='tsql -U $database $password -S development'

# Make the mysql prompt more similar to the local prompt
export MYSQL_PS1="\h:\d \u> "
# Don't allow me to do stupid things (like "delete from users" without a "where")
alias mysql="mysql --safe-updates"

# Functions
# =========

# For inclusion in the bash prompt
# 
# I found this someplace -- I didn't write it.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Note to self:  pushd and popd replace functionality that was previously done by bash functions here.

[[ -s "/Users/benoakes/.rvm/scripts/rvm" ]] && source "/Users/benoakes/.rvm/scripts/rvm"  # This loads RVM into a shell session.
