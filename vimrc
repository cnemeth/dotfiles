" Settings for the Vim text editor.
" 
" Author: Benjamin Oakes <hello@benjaminoakes.com>

" TODO find a way to ignore caps lock (or warn very visibly).  It's easy on OS X (via the Keyboard preference pane), but I'd like a general way

" General Settings
" ----------------

set nocompatible " don't emulate vi bugs (must be first; has side effects)
set enc=utf-8
set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

" Environment Settings
" --------------------

setlocal makeprg=rake
set mouse=a " Use the mouse from the terminal version of vim (not on OS X though, unless you use xterm or another terminal emulator)
set path=/usr/local/git/bin,/opt/local/bin,/opt/local/sbin,/usr/bin,/bin,/usr/sbin,/sbin,/usr/local/bin,/usr/X11/bin,/usr/local/git/bin/,~/bin
set history=1000 " keep N lines of command line history

" Display Settings
" ----------------

syntax on  " turn on syntax hilighting
set number " Turn on line numbering
set ruler  " Always show ruler (shows percentage in status line, etc.)
" let g:syntastic_enable_signs=1
" set statusline+=%{StatuslineTabWarning()}
" set statusline+=%*
" set statusline+=%{StatuslineTrailingSpaceWarning()}
" set statusline+=%{StatuslineLongLineWarning()}
" set statusline+=%{SyntasticStatuslineFlag()}
  " FIXME Show syntax errors
set showcmd " For longer commands, show what I've typed in the status bar
set lazyredraw " Don't try to continuously update the screen during macros (makes things go faster)
set cursorline " Highlight the current line
set listchars=tab:>-,trail:.,extends:> " Which invisible characters to show (whitespace)
set linebreak " don't break words in middle
set display+=lastline " show incomplete paragraphs even when they don't fit on screen (avoid @'s)
colorscheme railscasts

" Indentation and Tabs
" --------------------

autocmd FileType make set noexpandtab " Use tabs instead of spaces, otherwise `make` will hate you
set expandtab " Use spaces instead of tabs
set tabstop=2 " set tabstop to 2 spaces
set shiftwidth=2 " make >> and friends (<<, ^T, ^D)  shift 2, not 8
set shiftround " round to nearest n, don't just move n
set autoindent
set smartindent " turn on Vim's magic indenting
" ...but don't move # lines to the beginning.  See :help smartindent
inoremap # X#

" Folding
" -------

" set foldmethod=indent " Indent based on how many tabstops there are
" set foldmethod=syntax " Indent based on language syntax

" Abbreviations
" -------------

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

" Spell Check
" -----------

set dictionary=/usr/share/dict/words " Does a completion with dictionary, Ctrl+x Ctrl+k
" set spell " Turn on spell checking
autocmd FileType diff set nospell " Turn off spell checking in diffs

" Various UI
" ----------

set wildmode=longest,list,full
set wildmenu " Gives feedback when completing on the vim command line
set wildignore+=*.o,*.obj,*~,.lo,*.swp,*.pyc,*.class " File extensions to ignore in the wildmenu
set cpotions+=$
set virtualedit=all

" GNU Screen Stuff 
" ----------------

" au BufEnter * silent !screen -X title "vi <afile>"
" au VimLeave * silent !screen -X title "bash"

" Backup File Tweaks
" ------------------

au BufWrite /private/tmp/crontab.* set nowritebackup " don't write backup file when called by "crontab -e"; it breaks
au BufWrite /private/etc/pw.* set nowritebackup " same for "chpass"; breaks if backups written

" Keybindings
" -----------

" Same as o, but doesn't leave you in insert.  Really nice for spacing code out.
noremap - o<esc>
noremap _ O<esc>

" Switch keybindings between moving by display and moving by physical lines - that is, 'k' moves up by a display line, 'gk' by a physical line.
" (This might be confusing if you're not used to it, but it's how most GUI apps behave.)
noremap k gk
noremap j gj
noremap gk k
noremap gj j

" Shift-tab to insert a hard tab
imap <silent> <S-tab> <C-v><tab>

" Insert my name
nmap ,a AAuthor: Benjamin Oakes <hello@benjaminoakes.com><esc>

" Replace double quotes with single quotes on the current line.
nmap ,' :.s/"/'/g

" Inspect the variable on the current line (in C).  NOTE: You'll need to specify the right format for printf();
autocmd FileType c nmap ,i ^"oy$Iprintf("<esc>A: %s\n", (<esc>pA));<esc>
" Inspect the variable on the current line (in Ruby)
autocmd FileType ruby nmap ,i ^"oy$Iputs "<esc>A: #{(<esc>"opA).inspect}"<esc>
" Execute the current line as Ruby, writing the result below
autocmd FileType ruby nmap ,r "rY:r!ruby -e "puts r<bs>"<cr>
" Inspect the variable on the current line (in embedded Ruby)
autocmd FileType eruby nmap ,i ^"oy$I<%= "<esc>A: #{(<esc>"opA).inspect}" %><esc>

" Reverse of ,i.  Depends on # as a marker
nmap ,I 0f#f(ld0$F)D

" Make an \end declaration from the corresponding \begin in LaTeX
autocmd FileType latex nmap ,e Ypwceend<esc>O<tab><esc>
" Make an environment (i.e. \begin{environment} from the current line
" NOTE This uses ,e (defined above)
autocmd FileType latex nmap ,n I\begin{<esc>A}<esc>,e

" Standard text for testing layouts
nmap ,l iLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<esc>
 
" Search
" ------

set ignorecase " Case-insensitive searches
set smartcase  " This will have searches ignore case unless I use a capital letter
set incsearch  " Start searching right away
set tags=./tags; " From http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks

" Language-specific
" -----------------

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

" Ruby
augroup lang_ruby
    au!
    autocmd FileType ruby map <F4> :w<CR>:!ruby -c %<CR>
    autocmd FileType ruby map <F5> :w<CR>:!ruby %<CR>
    autocmd FileType ruby map <F6> :w<CR>:!ruby %<SPACE>

    " " FIXME Automatic rtags
    " au BufWritePost *.rb silent! !rtags -R > /dev/null
augroup END

" JavaScript (Rhino)
augroup lang_javascript
    au!
    autocmd BufEnter *.js map <F5> :w<CR>:!js %<CR>
    autocmd BufEnter *.js map <F6> :w<CR>:!js %<SPACE>
augroup END

" Bash
augroup lang_bash
    au!
    autocmd FileType sh map <F4> :w<CR>:!bash -n %<CR>
    autocmd FileType sh map <F5> :w<CR>:!bash %<CR>
    autocmd FileType sh map <F6> :w<CR>:!bash %<SPACE>
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

" Make
augroup lang_make
    au!
    autocmd FileType make map <F5> :w<CR>:!make -f %<CR>
    autocmd FileType make map <F6> :w<CR>:!make -f %<SPACE>
augroup END
