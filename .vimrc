""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  file      .vimrc
"  brief     Vim configuration file
"  modified  2018-01-10
"  author    andre-st
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on               " syntax highlighting
filetype on             " enable automatic file type detection
set nocompatible        " disable vi compatibility mode
"set autoindent         " automatic indentation
"set noautoindent       " 
"set smartindent        " smarter indention than autoindent
"set cindent            " c style indentation
set autowrite           " automatically write files as needed
set hlsearch            " have vim highlight the target of a search
set incsearch           " do incremental searches
set exrc                " allow project-dir specific .vimrc
set smartcase           " search case (in)sensitive based on capitalization in the query string, alternative: /\cSearch  :set ic bzw. noic
set ignorecase          " 
"set showmatch          " show () {} and [] matches while writing
set ruler               "
colors andre-st_term    " color theme
set number              " line numbering
set nowrap              " 
set tw=0                " 
"set expandtab          " tabs to spaces
set pastetoggle=<F11>   " toggle paste mode
set tabstop=5           "
set softtabstop=5       "
set shiftwidth=5        "
set wildmenu            " file system surfing	:e /directory/ ^D	Tab
"set wildmode=list:longest,full
"set wildignore=*.o,*~,*.pyc
set smartcase           " upper case char in search -> case sensitive, otherwise insensitive
"set t_Co=256           " 
set ttimeout            " 
set ttimeoutlen=0       " avoid command mode switch delay
" Indiciate invisible characters (tab, eol, ...), should low contrast to BG color
set listchars=tab:»-,trail:~,extends:>,precedes:<
set list                " 
set vb                  " use visual bell instead of beeping
" stopping vim from removing indentation on empty lines
inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>


" Copy/Paste between multiple Vim instances:
"set clipboard=unnamedplus    " requires Vim compiled with +xterm_clipboard (see vim --version)
" or install xclip and in vim: 7w !xclip  or  visual mode :'<,'>!xclip



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Doxygen
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:load_doxygen_syntax=1
let g:syntax_extra_php='doxygen'
" Continue Doxygen comments when you reach a new line
au FileType c,cpp,php,php5 set comments-=://
au FileType c,cpp,php,php5 set comments+=:///
au FileType c,cpp,php,php5 set comments+=://



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Perl
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite
let perl_include_pod=1    " my perl includes pod
let perl_extended_vars=1  " syntax color complex things like @{${"foo"}}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  vim-markdown
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
autocmd FileType markdown highlight Title cterm=none ctermfg=226 ctermbg=19



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Replace umlauts etc with HTML entities
"  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Deumlaut()
	" umlauts:
	%s/ü/\&uuml;/egI
	%s/ä/\&auml;/egI
	%s/ö/\&ouml;/egI
	%s/ß/\&szlig;/egI
	%s/Ü/\&Uuml;/egI
	%s/Ä/\&Auml;/egI
	%s/Ö/\&Ouml;/egI
	" ...
	%s/²/\&sup2;/egI
	%s/°/\&deg;/egI
	" don't break numbers and subsequent nomen or units:
	%s/\(\d\)\s\([&A-Z0-9]\)/\1\&nbsp;\2/egI
endfunction
command Deumlaut :call Deumlaut()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Statusline
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline=  
"set statusline+=%<\                       " cut at start  
"set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags  
"set statusline+=%-40f\                    " relative path  
"set statusline+=%=                        " seperate between right- and left-aligned  
"set statusline+=%10((%l/%L)%)\            " line and column  
"set statusline+=%P                        " percentage of file  

set laststatus=2 statusline=%02n\ \ \ %<%-40f\ \ \ %h%m%r%=%-14.(%l,%c%V%)\ %P



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Sometimes it's helpful if your working directory is
"  always the same as the buffer you are editing:
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd BufEnter * cd %:p:h " this fucks up sessions



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Buffer selection
"  When F5 is pressed, a numbered list of file names is printed, 
"  and the user needs to type a single number based on the "menu" and press 
"  enter. The "menu" disappears after choosing the number so it appears 
"  only when you need it.
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <F5> :buffers<CR>:buffer<Space>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Paste without moving the cursor (breaks lineflip with d+d+p)
"  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"noremap p P`[j



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Auto Completion Ctrl-Space
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <silent> <C-Space> <C-P>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Save File Ctrl-S or F2
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <silent> <C-S> <Esc>:w<CR>a
imap <silent> <F2> <Esc>:w<CR>a



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Prefer Backward-Kill-Word over backspace
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <BS> bdw



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Kills a whole line like mcedit with F8 only
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <F8> <Esc>ddi
nmap <F8> dd



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Change word case with ~-Key in normal mode
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ~ g~w



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Auto-Completion, Auto-Bracketing etc. 
"  Some mappings slow down typing!
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"imap <silent> ( ()<ESC>:let leavechar=")"<CR>i
"imap <silent> [ []<ESC>:let leavechar="]"<CR>i
"inoremap { {<CR><BS>}<ESC>ko
"imap <silent> , ,<Space>
"imap <silent> ; ;<CR>

" annoying:
"inoremap {      {}<Left>
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap {{     {
"inoremap {}     {}



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  OS clipboard: Paste with S-Insert
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <silent> <S-Insert> <ESC>"+gPi



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Windowing
"  Normal mode:
"  Ctrl-Left/Right/Up/Down cursor keys to easily move between windows
"  Ctrl-PageDown/PageUp move between maximized windows (stacking)
"  + and - on the numeric keypad resizes window
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <silent> <C-Up> <ESC>:wincmd k<CR>a
imap <silent> <C-Down> <ESC>:wincmd j<CR>a
nmap <silent> <C-Up> :wincmd k<CR> 
nmap <silent> <C-Down> :wincmd j<CR> 
nmap <silent> <C-Left> :wincmd h<CR> 
nmap <silent> <C-Right> :wincmd l<CR>

nmap <silent> <C-PageUp> <C-W>k<C-W>_
nmap <silent> <C-PageDown> <C-W>j<C-W>_
imap <silent> <C-PageUp> <ESC><C-W>k<C-W>_a
imap <silent> <C-PageDown> <ESC><C-W>j<C-W>_a

nmap <silent> <kPlus> <C-W>3+
nmap <silent> <kMinus> <C-W>3-



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Searching
"  Normal mode:
"  <F4> toggles search highlights on/off
"  Backspace clears highlights
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> :set hls!<CR>
"nnoremap <silent> <BS> :let --AT--/ = ""<CR> :echo "Highlights Cleared"<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Code navigation with Ctags
"  Normal mode:
"  Alt-Up/Down go to declaration/go back
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <A-Up> <C-]>
nmap <silent> <A-Down> <C-T>
imap <silent> <A-Up> <ESC><C-]>a
imap <silent> <A-Down> <ESC><C-T>a



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quit vim
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F10> :qa<CR>
imap <F10> <ESC>:qa<CR>
"imap <ESC><ESC> <ESC>:qa<CR>
"nmap <ESC><ESC> :qa<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  closetag.vim: Functions and mappings to close open HTML/XML tags
"  http://www.vim.org/scripts/script.php?script_id=13
"  Ctrl-_ closes the most recent open tag
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype html,xml,xsl,php source ~/.vim/scripts/closetag.vim



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  utl: Text Linking
"  Normal Mode:
"  execute hyperlink with double click left mouse button
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <2-LeftMouse> <Leader>gu 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Grep (+ Quickfix)
"  Normal Mode:
"  <F12> list all the TODO, FIXME and @BUG items in the current file
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <F12> :grep -i -o -E "(todo\\|@bug\\|fixme) (.*)$" % <CR>:cope<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  UI: mode line changes color if in insert mode  (good bg: 33, 35)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:obviousModeInsertHi='ctermfg=White ctermbg=Magenta'
let g:obviousModeInsertHi='ctermfg=White ctermbg=35'







" Not to be confused with renamer.vim (:Ren)
" Rename.vim  -  Rename a buffer within Vim and on the disk
" Copyright June 2007 by Christian J. Robinson <heptite@gmail.com>
" Distributed under the terms of the Vim license.  See ":help license".
"
" Usage:
"
" :Rename[!] {newname}

command! -nargs=* -complete=file -bang Rename :call Rename("<args>", "<bang>")

function! Rename(name, bang)
	let l:curfile = expand("%:p")
	let v:errmsg = ""
	silent! exe "saveas" . a:bang . " " . a:name
	if v:errmsg =~# '^$\|^E329'
		if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
			silent exe "bwipe! " . l:curfile
			if delete(l:curfile)
				echoerr "Could not delete " . l:curfile
			endif
		endif
	else
		echoerr v:errmsg
	endif
endfunction
