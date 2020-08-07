# Set architecture flags
export ARCHFLAGS="-arch x86_64"
export LC_CTYPE=en_US.UTF-8
export RAILS_ENV=development
export CC_BUILD_ARTIFACTS=~/tmp/build_artifacts
export DEVELOPER=csaba
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PGDATA=/usr/local/var/postgres

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
# Load .profile if it exists
test -f ~/.profile && source ~/.profile

export PATH=/usr/local/bin:$PATH

# Add syntax highlighting for less
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS='-R'

# Homebrew bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Aliases for starting and stopping Postresql server
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres -m fast stop'

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# http://ianlunn.co.uk/articles/quickly-showhide-hidden-files-mac-os-x-mavericks/
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# alias for kubectl
alias k='kubectl'

# vi edit mode for commandline
set -o vi

parse_git_branch()
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

proml ()
{
    local BLUE="\[\033[0;34m\]";
    local RED="\[\033[0;31m\]";
    local LIGHT_RED="\[\033[1;31m\]";
    local GREEN="\\[\\033[0;32m\\]";
    local LIGHT_GREEN="\[\033[0;32m\]";
    local WHITE="\[\033[0;37m\]";
    local LIGHT_GRAY="\[\033[0;37m\]";
    local YELLOW="\[\033[0;33m\]";
    local BG_BLUE="\[\033[44m\]";
    case $TERM in
        xterm*)
            TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
        *)
            TITLEBAR=""
        ;;
    esac;
        PS1="$YELLOW\h$RED\w$BG_BLUE\$(parse_git_branch)$LIGHT_GREEN \t \$ $WHITE";
    PS2='> ';
    PS4='+ '
}

proml

# Chabge title of iTerm tabs
# http://superuser.com/questions/419775/with-bash-iterm2-how-to-name-tabs
function title {
  echo -ne "\033]0;"$*"\007"
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

p4 set P4PORT=perforce.corp.ooma.com:6666
p4 set P4HOST=chubbz-rmbp
p4 set P4USER=csaba.nemeth

# bundler editor to vim
export BUNDLER_EDITOR=vim

# load Carrum stuff
source ~/.carrum_bashrc

eval "$(rbenv init -)"

export HOMEBREW_GITHUB_API_TOKEN=45fe0b681a50b2fc3e336db6b8e139e0d4dc747e
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
