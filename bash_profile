# Most of the time you donÃÂÃÂ¢ÃÂÃÂÃÂÃÂt want to maintain two separate 
# config files for login and non-login shells ÃÂÃÂ¢ÃÂÃÂÃÂÃÂ when you set a PATH,
# you want it to apply to both. You can fix this by sourcing .bashrc
# from your .bash_profile file, then putting PATH and common settings in .bashrc.
# if [ -f ~/.bashrc ]; then
#    source ~/.bashrc
# fi

if [ -f ~/.profile ]; then
   source ~/.profile
fi

# This is to fix problem with MySQL 5.5.x and mysql gem -v 2.8.1
# see http://lightyearsoftware.com/2011/02/mysql-5-5-on-mac-os-x 
DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

#   MyMachine:~ (22:56) csaba$ 
# export PS1="\[\e[1;32m\]\h:\W (\$(date +"%H:%M")) \u\$\[\e[0;39m\] "
# export PS1="\[\033[01;31m\]\h\[\033[01;34m\]::\[\033[01;32m\]\u \[\033[01;35m\]{ \w }\[\033[00;36m\] [\$(date +"%H:%M")]\[\033[01;32m\]\$ \[\033[01;37m\]"

# This loads RVM into a shell session.
[[ -s "/Users/csaba/.rvm/scripts/rvm" ]] && source "/Users/csaba/.rvm/scripts/rvm"  

# EOF - This marks the end of the .bashrc file

export PATH=/Applications/SenchaSDKTools-1.2.3:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3/command:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3/jsbuilder:$PATH

export PATH=/Applications/SenchaSDKTools-1.2.3/appbuilder:$PATH

alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres -m fast stop'
