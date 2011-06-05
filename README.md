Dotfiles
========

Author: Benjamin Oakes <hello@benjaminoakes.com>

These are (most) of the dotfiles I typically use on a *nix (Linux, Mac OS X, Haiku, etc.) machine.

Installing
----------

    git clone git@github.com:benjaminoakes/dotfiles.git # or your fork
    cd dotfiles
    ./install              # Requires Ruby.  You might want to review what this does before running it.

Later, when you've made changes:

    git push origin master # on the machine that has the changes
    git pull               # on the machine you want to update

Please do *NOT* remove the repository directory.  If you do, the symlinks will point to files that aren't there.  Personally, I keep my dotfiles in `~/Projects/dotfiles/` and do all the version control stuff from that directory.  You can edit them from wherever, though.  Do `vim ~/.vimrc` just like normal.

The way I see it, there are two main benefits to keeping these on GitHub:

1. I can easily keep my accounts/machines in sync so that I don't make my muscle-memory go berserk.
2. Others (like you!) can use pieces they like from my dotfiles.  (Another good place is dotfiles.org, but it isn't quite back to the state it was before _why disappeared.)  Please share alike.
