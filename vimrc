" Settings for the vim text editor.
" 
" Paul Hinze (phinze on GitHub) gave me his ~/.vimrc as a base.  I added a lot of stuff that I found on dotfiles.org (before _why disappeared and the site went away).  This is pretty long, but there's a lot that has been copy-paste for me.  Thanks to everyone who shares this type of stuff.  :)
" 
" Author: Benjamin Oakes <hello@benjaminoakes.com>

" TODO find a way to ignore caps lock (or warn very visibly).  It's easy on OS X (via the Keyboard preference pane), but I'd like a general way

" ----------------
" General Settings
" ----------------

set nocompatible
  " set: don't emulate vi bugs (must be first; has side effects)
set enc=utf-8
  " ensure utf-8 is our encoding of choice
set exrc
  " enable per-directory .vimrc files
set secure
  " disable unsafe commands in local .vimrc files

" --------------------
" Environment Settings
" --------------------

let $PAGER=''
  " So we can use vim for viewing man pages
set mouse=a
  " Use the mouse from the terminal version of vim (not on OS X though, unless you use xterm or another terminal emulator)
setlocal makeprg=rake
set path=/usr/local/git/bin,/opt/local/bin,/opt/local/sbin,/usr/bin,/bin,/usr/sbin,/sbin,/usr/local/bin,/usr/X11/bin,/usr/local/git/bin/,~/bin,.
set history=1000
  " keep N lines of command line history

" ----------------
" Display Settings
" ----------------

set showcmd
  " For longer commands, show what I've typed in the status bar
" let g:syntastic_enable_signs=1
" set statusline+=%{StatuslineTabWarning()}
" set statusline+=%*
" set statusline+=%{StatuslineTrailingSpaceWarning()}
" set statusline+=%{StatuslineLongLineWarning()}
" set statusline+=%{SyntasticStatuslineFlag()}
  " FIXME Show syntax errors
set lazyredraw
  " Don't try to continuously update the screen during macros (makes things go faster)
" set scrolloff=5
"   " start scrolling when cursor is N lines from the top/bottom edge
set cursorline
  " Highlight the current line
set listchars=tab:>-,trail:.,extends:>
" set list!
  " Show invisible characters (whitespace)
set linebreak
  " set: don't break words in middle
set display+=lastline
  " show incomplete paragraphs even when they don't fit on screen (avoid @'s)
set ruler
  " set: always show ruler (shows percentage in status line, etc)
syntax on
  " set: turn on syntax hilighting
set number
  " set: turn on line numbering
colorscheme ir_black
  " TODO get misspelled words to be underlined instead of highlighted in red in the CLI version of vim

" --------------------
" Indentation and Tabs
" --------------------

set expandtab
  " Use spaces instead of tabs
set tabstop=2
  " set tabstop to 2 spaces
set shiftwidth=2
  " make >> and friends (<<, ^T, ^D)  shift 2, not 8
set shiftround
  " round to nearest n, don't just move n
set autoindent
set smartindent
  " turn on vim's magical indenting...
inoremap # X#
  " ...but don't move # lines to the beginning.  See :help smartindent

autocmd FileType make set noexpandtab
  " Use tabs instead of spaces, otherwise `make` will hate you

" ------------
" Highlighting
" ------------

" set hlsearch 
"   " highlight matches to a search
" set nohls
"   " set: don't highlight searches; it's annoying when the highlight sticks

" :highlight OverLength ctermbg=white ctermfg=red guibg=red guifg=white
" :match OverLength '\%81v.*'
"   " Highlight chars that go over the 80-column limit

" -------
" Folding
" -------

set foldmethod=indent
  " Indent based on how many tabstops there are
" set foldmethod=syntax
  " Indent based on language syntax

" -------------
" Abbreviations
" -------------

abbrev approx approximately
abbrev impt important
abbrev iirc if I remember correctly
" abbrev std standard

" Typos
abbrev teh the
abbrev yuo you
abbrev hte the
abbrev nad and
abbrev frmo from
abbrev buig bug
abbrev jsut just
abbrev tempalte template
abbrev teamplate template
abbrev flase false
abbrev ptus puts
abbrev TOOD TODO

" -----------
" Spell Check
" -----------

set dictionary=/usr/share/dict/words
  " Does a completion with dictionary
  " Ctrl+x Ctrl+k
set spell
  " Turn on spell checking
autocmd FileType diff set nospell
  " Turn off spell checking in diffs

" ---------------
" Code Completion
" ---------------

" setlocal omnifunc=syntaxcomplete#Complete
  " activate autocomplete (intellisense)
  " TODO how do you use this?

  " autocmd FileType python set omnifunc=pythoncomplete#Complete
  " autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  " autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  " autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  " autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  " autocmd FileType c set omnifunc=ccomplete#Complete

set wildmenu
  " Gives feedback when completing on the vim command line
set wildignore+=*.o,*.obj,*~,.lo,*.swp,*.pyc,*.class
  " File extensions to ignore in the wildmenu

" ----------------
" GNU Screen Stuff 
" ----------------

" au BufEnter * silent !screen -X title "vim: <afile>"
" au VimLeave * silent !screen -X title "bash"

" ------------------
" Backup File Tweaks
" ------------------

au BufWrite /private/tmp/crontab.* set nowritebackup
  " don't write backup file when called by "crontab -e"; it breaks
au BufWrite /private/etc/pw.* set nowritebackup
  " same for "chpass"; breaks if backups written
set backupdir=./.backup,.,$TEMP,$TMP,/tmp
  " Keep vim from littering with backup files all over the place

" -----------
" Keybindings
" -----------

" This is for working across multiple xterms and/or gvims
" Transfer/read and write one block of text between vim sessions (capture whole line):

" Write
nmap ;w :. w! ~/.xfer<CR>
" Read
nmap ;r :r ~/.xfer<CR>
" Append 
nmap ;a :. w! >>~/.xfer<CR>

" map : q:i
"   " FIXME Let me use vim keybindings on the vim command line
nmap ,s :source ~/.vimrc<CR>
nmap ,v :tabnew ~/.vimrc<CR>
  " Make it easier to reload and edit .vimrc (this file)
noremap - o<esc>
noremap _ O<esc>
  " Same as o, but doesn't leave you in insert.  Really nice for spacing code out.

noremap k gk
noremap j gj
noremap gk k
noremap gj j
  " Switch keybindings between moving by display and moving by physical
  " lines - that is, 'k' moves up by a display line, 'gk' by a physical line.
  " (This might be confusing if you're not used to it, but it's how most GUI apps behave.)

" imap <silent> <S-tab> <C-v><tab>
"   " Shift-tab to insert a hard tab
"   " FIXME

nnoremap gf :vsp<ESC>gf
  " Open files in a split

" nnoremap <C-]> :vsp<CR><C-]>
"   " FIXME Open tags in a split

" nnoremap K :!matlabdoc "<cword>" > /tmp/vimdoc<CR>:80 vsp /tmp/vimdoc<CR>
"   " Open documentation in a split TODO parameterize the keywordprg in the above, maybe write it someplace else

" TODO autocmd FileType eruby 
nmap ,/ I<!-- <esc>A --><esc>
  " Comment out the current line in HTML
nmap ,= I<%= <esc>A %><esc>
  " Surround the current line in <%= %>
nmap ,# I<%# <esc>A %><esc>
  " Surround the current line in <%# %>
nmap ,% I<% <esc>A %><esc>
  " Surround the current line in <% %>
nmap ,a AAuthor: Benjamin Oakes <hello@benjaminoakes.com><esc>
  " Insert my name
nmap ,b Yppkkwv$r-jjv$r-
  " Turn the comment on the current line into a banner
  " FIXME only works for single character comment markers

" nmap ,c
"   " TODO Convert the underscored word under the cursor to camel case

" autocmd FileType php nmap ,d odie('got in');<esc>
"   " Put a die() in the code to see if a region is getting executed
nmap ,d V!date '+\%Y-\%m-\%d'<cr>YpVr=--:w<cr>
  " Insert the current date as a header
nmap ,e Ypwceend<esc>O<tab><esc>
  " Make an \end declaration from the corresponding \begin in LaTeX
nmap ,' :.s/"/'/g
  " Replace double quotes with single quotes on the current line.
nmap ,u YPDA# See also: "+p
  " Take the clipboard contents and insert a "See also" comment.  Meant for URLs.

" TODO define this for more languages
autocmd FileType c nmap ,i ^"oy$Iprintf("<esc>A: %s\n", (<esc>pA));<esc>
  " Inspect the variable on the current line (in C).  NOTE: You'll need to specify the right format for printf();
autocmd FileType eruby nmap ,i ^"oy$I<%= "<esc>A: #{(<esc>"opA).inspect}" %><esc>
  " Inspect the variable on the current line (in embedded Ruby)
autocmd FileType php nmap ,i Iecho('<esc>l"oy$A: ' . print_r(<esc>"opA, true) . "\n");<esc>
  " Inspect the variable on the current line (in PHP)
autocmd FileType ruby nmap ,i ^"oy$Iputs "<esc>A: #{(<esc>"opA).inspect}"<esc>
  " Inspect the variable on the current line (in Ruby)

nmap ,I 0f#f(ld0$F)D
  " Reverse of ,i.  Depends on # as a marker

nmap ,l iLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<esc>
  " Standard text for testing layouts

nmap ,m o<esc>Dielse<cr>raise "Reached 'impossible' case in #{__FILE__}: #{__LINE__}"<esc>
  " Insert the standard 'impossible' warning

autocmd FileType latex nmap ,n I\begin{<esc>A}<esc>,e
  " Make an environment (i.e. \begin{environment} from the current line
  " NOTE This uses ,e (defined above)

nmap ,r "rY:r!ruby -e "puts r<bs>"<cr>
  " Execute the current line as Ruby, writing the result below
  
" TODO scope the above bindings to languages
 
" ------
" Search
" ------

" TODO PCRE searching would be *amazing*.  Vim's regex syntax messes me up quite often.

set ignorecase
  " Case-insensitive searches
set smartcase
  " This will have searches ignore case unless I use a capital letter
set incsearch
  " Start searching right away

" -------------
" Tags settings
" -------------

set tags=./tags;
  " From: http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks:
  " 
  "     This will look in the current directory for "tags", and work up the tree towards root until one is found. IOW, you can be anywhere in your source tree instead of just the root of it.

" -----------------
" Man page settings
" -----------------

autocmd FileType man set nospell
  " Ignore spelling in man pages (when viewed with vim)
" autocmd FileType man set nonumber
"   " No line numbers in man pages (when viewed with vim)

" -------------
" Ruby settings
" -------------

" TODO set all of these by FileType
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
let g:rubycomplete_rails = 1
  " TODO What does this do?
" set matchpairs+="do":"end"
  " FIXME Match do and end when using %
  " See http://www.vim.org/scripts/script.php?script_id=39

" -----------------
" Language-specific
" -----------------

" NOTE I (Ben) didn't write most of this.  I copied it from some amazing person on dotfiles.org.  I do tweak several languages quite often though, such as Ruby.

" Function keys:                                                           "[3]
"   <F4> - save and compile/check for errors, without running
"   <F5> - save, compile and run without parameters
"   <F6> - save, compile and run with parameters
"   <F7> - save, compile and debug without parameters
"   <F8> - save, compile and debug with parameters
"   Memory leaks:
"     <ESC><F5> - save, compile and look for memory leaks without parameters
"     <ESC><F6> - save, compile and look for memory leaks with parameters
" 
" Fixing errors:
"    <ESC>j, <ESC>k, <ESC>h, <ESC>l - :cnext, :cprevious, :colder, :cnewer
"
" There is no binding to run a makefile. I simply open the makefile and use
" either <F5> or <F6>.

" Java
augroup lang_java
    au!
    let java_highlight_all=1
    let java_highlight_functions="style"
    let java_allow_cpp_keywords=1

    autocmd FileType java map <F4> :w<CR>:!javac %<CR>
    autocmd FileType java map <F5> :w<CR>:!javac % && java %<<CR>
    autocmd FileType java map <F6> :w<CR>:!javac % && java %<<SPACE>
    autocmd FileType java map <F7> :w<CR>:!javac % && jdb %<<CR>
    autocmd FileType java map <F8> :w<CR>:!javac % && jdb %<<SPACE>
augroup END

" C
augroup lang_c
    au!
    " C compile
    autocmd BufEnter *.c map <F4> :w<CR>:!gcc -Wall -g -c % -o %< ; true<CR>
    " C compile and run (w/o, w/ parameters)
    autocmd BufEnter *.c map <F5> :w<CR>:!gcc -Wall -g % -o %< && ./%<<CR>
    autocmd BufEnter *.c map <F6> :w<CR>:!gcc -Wall -g % -o %< && ./%<<SPACE>
    " C debug (w/o, w/ parameters)
    autocmd BufEnter *.c map <F7> :w<CR>:!gcc -Wall -g % -o %< && cgdb %<<CR>
    autocmd BufEnter *.c map <F8> :w<CR>:!gcc -Wall -g % -o %< && cgdb %<<SPACE>
    " Memory leaks (w/o, w/ parameters)
    autocmd BufEnter *.c map <ESC><F5> :w<CR>:!gcc -Wall -g % -o %< && valgrind ./%<<CR>
    autocmd BufEnter *.c map <ESC><F6> :w<CR>:!gcc -Wall -g % -o %< && valgrind ./%<<SPACE>
    
    " C no spelling
    " autocmd BufRead *.c setlocal nospell

    " Automatic ctags
    " FIXME
    " au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &
augroup END

" Perl
augroup lang_perl
    au!
    autocmd BufEnter *.pl map <F4> :w<CR>:!perl -wc %<CR>
    autocmd BufEnter *.pl map <F5> :w<CR>:!perl %<CR>
    autocmd BufEnter *.pl map <F6> :w<CR>:!perl %<SPACE>
augroup END

" Python
augroup lang_python
    au!
    autocmd BufEnter *.py map <F4> :w<CR>:!python -c "import py_compile; py_compile.compile('%')"<CR>
    autocmd BufEnter *.py map <F5> :w<CR>:!python %<CR>
    autocmd BufEnter *.py map <F6> :w<CR>:!python %<SPACE>
augroup END

" Ruby
augroup lang_ruby
    au!
    " filetype plugin indent on
    "   " This will unindent "end" in Ruby, like TextMate
    autocmd FileType ruby map <F4> :w<CR>:!ruby -c %<CR>
    autocmd FileType ruby map <F5> :w<CR>:!ruby %<CR>
    autocmd FileType ruby map <F6> :w<CR>:!ruby %<SPACE>
    autocmd FileType ruby set keywordprg=ri\ --no-pager
      " Use 'K' to look up methods using ri

    " Automatic rtags
    " FIXME
    " au BufWritePost *.rb silent! !rtags -R > /dev/null
augroup END

" Javascript (Rhino)
augroup lang_javascript
    au!
    autocmd BufEnter *.js map <F5> :w<CR>:!js %<CR>
    autocmd BufEnter *.js map <F6> :w<CR>:!js %<SPACE>
augroup END

" INTERCAL
augroup lang_intercal
    au!
    autocmd FileType intercal map <F4> :w<CR>:!ick -m %<CR>
    autocmd FileType intercal map <F5> :w<CR>:!ick -m % && ./%<<CR>
augroup END

" Lisp
augroup lang_lisp
    au!
    autocmd FileType lisp map <F5> :w<CR>:!clisp %<CR>
    autocmd FileType lisp map <F6> :w<CR>:!clisp %<SPACE>
augroup END

" BC
augroup lang_bc
    au!
    autocmd FileType bc map <F5> :w<CR>:!bc -lq %<CR>
augroup END

" Bash
augroup lang_bash
    au!
    autocmd FileType sh map <F4> :w<CR>:!bash -n %<CR>
    autocmd FileType sh map <F5> :w<CR>:!bash %<CR>
    autocmd FileType sh map <F6> :w<CR>:!bash %<SPACE>
augroup END

" Vim
augroup lang_vim
    au!
    autocmd FileType vim map <F5> :w<CR>:source %<CR>:doautoall lang_vim<CR>
augroup END

" SQL (PostgreSQL)
augroup lang_sql
    au!
    set nospell " It complains about grammar a lot otherwise
    let g:sql_type_default = 'pgsql'
    " Requires installation of pgsql.vim in ~/.vim/syntax .
    autocmd FileType sql map <F5> :w<CR>:!psql -f %<CR>
    " This is very unsafe. Remove this unless you're sure you want this.
augroup END

augroup lang_php
  au!
  autocmd FileType php map <F4> :w<CR>:!php --syntax-check %<CR>
  autocmd FileType php map <F5> :w<CR>:!php %<CR>
  autocmd FileType php map <F6> :w<CR>:!php %
augroup END

" HTML
augroup lang_html
    au!
    autocmd FileType html map <F5> :w<CR>:silent !firefox %<CR>
augroup END

" LaTeX
augroup lang_latex
  au!
  autocmd FileType tex map <F4> :w<CR>:!latex %<CR>
  " Linux
  " autocmd FileType tex map <F5> :w<CR>:!latex % && gnome-open %<.dvi<CR>
  " OS X
  " autocmd FileType tex map <F5> :w<CR>:!pdflatex % && open %<.pdf<CR>
  autocmd FileType tex set makeprg=make
  autocmd FileType tex map <F5> :w<CR>:make<CR><CR>
augroup END

" PostScript
augroup lang_postscript
    au!
    autocmd FileType postscr map <F5> :w<CR>!gnome-open %<CR>
augroup END

" Make
augroup lang_make
    au!
    autocmd FileType make map <F5> :w<CR>:!make -f %<CR>
    autocmd FileType make map <F6> :w<CR>:!make -f %<SPACE>
augroup END

" " FIXME Matlab
" augroup matlab
"     au!
"     " set nospell " Fred tends to have a lot of crazy variable names
"     " set tabstop=4 " set tabstop to 2 spaces
"     " set shiftwidth=4 " make >> and friends (<<, ^T, ^D)  shift 2, not 8
"     " TODO nmap ,i Ifprintf(1, 'ly$Pa: %s\n', A);0f%l
" augroup END

" autocmd cursorhold * set nohlsearch
" noremap n :set hlsearch<cr>n
" noremap N :set hlsearch<cr>N
" noremap / :set hlsearch<cr>/
" noremap ? :set hlsearch<cr>?
" noremap # :set hlsearch<cr>#
" noremap * :set hlsearch<cr>*

