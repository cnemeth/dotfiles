# Settings for the bash shell.
#
# This file is called when making a new login (interactive) shell.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# ---------------------
# General Configuration
# ---------------------

# Custom (colored) prompt with time of command
# 
# Example (in green):
# 
#   MyMachine:~ (22:56) ben$ 
# 
export PS1="\[\e[1;32m\]\h:\W (\$(date +"%H:%M")) \u\$\[\e[0;39m\] "

# Keep a big history so I never lose a command
# HISTCONTROL=ignorespace # ignore commands issued that start with spaces
# FIXME I don't think these work quite right
export HISTFILESIZE=9000000000
export HISTSIZE=1000000

# # Log the date in the bash history (since it's so long)
# # Gets ignored automatically when presing up, etc. because it's a comment
# # FIXME This doesn't work too reliably across sessions.  Maybe zsh would be a better fit?
# echo "# login: `date`" >> "$HOME/.bash_history"

# -------------------
# Input configuration
# -------------------

# See also: ~/.inputrc

# Allow a key-press to clear the screen.  Typically, this is ^L in emacs mode.
bind -x '"\C-l":clear' # FIXME this doesn't seem to work in OS X's GNU screen

# ------------------
# Path Configuration
# ------------------

# Please **DON'T** do this:  export PATH=".:$PATH"
# 
# See also: http://www.faqs.org/faqs/unix-faq/faq/part2/section-13.html

# Allow me to run user-specific programs
export PATH=$HOME/bin:$PATH

# Allow me to use gem executables installed to my home directory
export PATH="$HOME/.gem/ruby/1.8/bin:$PATH"

# MATLAB didn't install nicely elsewhere
export PATH=$HOME/bin/matlab/bin:$PATH

# Path changes for Ruby gem utilities (such as `cheat`)
export PATH=/var/lib/gems/1.8/bin:$PATH

# Path changes for Git on (at least) OS X 10.5
export PATH=/usr/local/git/bin:$PATH

# Path changes for MySQL on (at least) OS X 10.5
export PATH=/usr/local/mysql/bin/:$PATH
export MANPATH=/usr/local/mysql/man:$MANPATH

# Path changes for SML/NJ on (at least) OS X 10.5
export PATH=/usr/local/smlnj-110.68/bin:$PATH
 
# Path changes for MacPorts on OS X 10.5
export PATH=/opt/local/bin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH

# For PostgreSQL installed on Mac OS X via the one-click installer (http://www.enterprisedb.com/products/pgdownload.do#osx)
export PATH=/Library/PostgreSQL/8.4/bin/:$PATH

# Path changes for custom programs
export PATH=/usr/local/bin:$PATH
export MANPATH=/usr/local/man/:$MANPATH

# Path changes for custom LaTeX styles
# 
# IMPORTANT:
# 
# * The trailing colon indicates the standard search path should be appended to the user specified
# * A double trailing slash indicates this directory is to be searched recursively
# 
export TEXINPUTS=".:$HOME/.latex//:"
export BIBINPUTS=".:$HOME/.bibtex//:"
export BSTINPUTS=".:$HOME/.bibtex//:"

# ------------------------------
# Machine-Specific Configuration
# ------------------------------

if [ `hostname` == "galactus" ]; then # a.k.a. benjaminoakes.com
  # Allow bzr to find the paramiko library that wasn't installed (needed for SFTP access)
  export PYTHONPATH="$HOME/lib/python:$PYTHONPATH"
fi

# ---------------------
# Command Configuration
# ---------------------

# Use color versions of commands (ls, etc.)
export CLICOLOR=1
# Set vim to be my editor of choice
export EDITOR="/usr/bin/vim"
export VISUAL=$EDITOR

# Use vim as the pager as well (used for man, etc)
# FIXME doesn't work for all commands that use a pager (such as apropos)
# export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#   vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#   -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#   -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# Default parameters that are passed to grep -- any additional ones provided at the command line are tacked on at the end.  This makes it act more like a diff, in Brian's words. 
# 
# I almost always don't want results from some directories -- you can always `cd` in there if you want to get results.
# 
# FIXME Unfortunately, setting this environment variable can give more results than you want if you use `grep` in scripts.
# FIXME --perl-regex' is not supported on OS X.  Maybe ack is a better option?
export GREP_OPTIONS='--line-number --context=2 --color=auto --exclude=log/**/* --exclude=working/**/* --exclude=doc/**/* --exclude=vendor/**/*'

# Customize less to act a little nicer
export LESS="--long-prompt --RAW-CONTROL-CHARS --quiet"

# ----------------------
# Database Configuration
# ----------------------

# MSSQL
# -----

# # Use MSSQL from the command line
# alias mssql='tsql -U $database $password -S development'

# MySQL
# -----

# Make the mysql prompt more similar to the local prompt
export MYSQL_PS1="\h:\d \u> "
# Don't allow me to do stupid things (like "delete from users" without a "where")
alias mysql="mysql --safe-updates"

# -------
# Aliases
# -------

# It's awfully annoying that it's `mvim` on OS X/Darwin but `gvim` everywhere else.
if [ "Darwin" == `uname` ]; then
  alias gvim="mvim"
fi

# Stop "ps" from chopping off its output to fit the display
alias ps="ps -w"

# Write a slash (`/') after each filename if that file is a directory. 
if [ "Linux" == `uname` ]; then
  # I've found that Linux doesn't always respect the CLICOLOR option, so you have to help it out a little: 
  alias ls="ls --color=auto -p"

  # gnome-open is about the equivalent to open in OS X.  Unfortunately, this doesn't get respected by all programs.  (I've run into trouble with the `vim` command line, for example.)
  alias open="gnome-open"
else
  alias ls="ls -p"
fi

# # Log to a local file so I can view it in Console.app
# alias monitor='touch /tmp/error.log && open -a /Applications/Utilities/Console.app/ /tmp/error.log && ssh some_server.com "tail --follow /var/log/error.log" >> /tmp/error.log'

# ---------
# Functions
# ---------

# For inclusion in the bash prompt
# 
# I found this someplace -- I didn't write it.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Note to self:  pushd and popd replace functionality that was previously done by bash functions here.

# ---------------------
# Logging Configuration
# ---------------------

# # Log console output to ~/typescripts/ so I can find stuff I *just* saw a second ago (but can't find anymore)
# # FIXME It doesn't work when resizing the window, and some other weird cirumstances
# # FIXME It can also take a lot of disk space, depending on usage.  Maybe rotate the logs?
# tty_name=`tty | ruby -e "puts STDIN.read.match(/\/dev\/(.*?)\n/)[1].gsub('/', '')"`
# tty_start_time=`date +"%Y-%m-%d-%H-%M-%S"`
# typescript_file="$HOME/typescripts/$tty_start_time-$tty_name.typescript"
# mkdir -p "$HOME/typescripts"
# script -q $typescript_file && exit

