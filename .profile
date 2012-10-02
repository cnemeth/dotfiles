export ARCHFLAGS="-arch x86_64"
export LC_CTYPE=en_US.UTF-8
#export RAILS_ENV=development
export CC_BUILD_ARTIFACTS=~/tmp/build_artifacts
export DEVELOPER=csaba

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
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

