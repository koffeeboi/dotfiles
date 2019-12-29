silent! call mkdir($HOME . "/.vim")
silent! call mkdir($HOME . "/.vim/temp")
silent! call mkdir($HOME . "/.vim/temp/backup")
silent! call mkdir($HOME . "/.vim/temp/swap")
silent! call mkdir($HOME . "/.vim/temp/undo")

set rtp+=~/.vim

set backupdir=~/.vim/temp/backup//                      "need // for no collisions
set directory=~/.vim/temp/swap//
set undodir=~/.vim/temp/undo//

if !exists("g:syntax_on")                               "Avoid syntax collision with others
    syntax enable
endif

set wildmode=list:longest,full                          "List preview window for tab completion
set wildmenu                                            "Show and move to next tab completion
set background=dark
set hlsearch                                            "Highlight searches
set number                                              "Line number
set tabstop=4                                           "Tab to 4 spaces
set shiftwidth=4
set mouse=a                                             "Enable mousewheel scrolling
set expandtab
set autoindent
set smartindent
set nowrap
set laststatus=2                                        "Status bar
set textwidth=0                                         "Something to do with auto wrapping even if nowrap is set
set wrapmargin=0
set autoread                                            "Auto reload file if changed somewhere else
set incsearch                                           "Live highlighting
set bs=indent,eol,start                                 "Backspace over everything in insert mode
set vb t_vb=                                            "Mute system beep and screen flash
set linespace=0                                         "Fix special symbol alignment issue
set autochdir                                           "Auto change working directory when opening/viewing files"
set undofile                                            "Maintain undo history between sessions
set fileencoding=utf8
set encoding=utf8

"Paste more than once hack
xnoremap p pgvy

"PathToFile FileType NumberOfLines ColumnNumber PercentageThroughFile [see :help statusline to what can add]
"set statusline=%F\ %y\ [%L\ lines]\ column:\ %c\ %=---%p%%--- "using airline atm so no need for this
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

let mapleader=','

"Delete buffer without closing
nnoremap <silent> <Leader>k :bp\|bd#<CR>
 
"Increase/Decrease buffer window height/width
nnoremap <A--> <C-w>-
nnoremap <A-=> <C-w>+
nnoremap <A-,> <C-w><
nnoremap <A-.> <C-w>>

"Tab and buffer cycle
nnoremap <silent> ( :bp<Return>
nnoremap <silent> ) :bn<Return>

"Turn off highlight
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Custom syntax highlight
syntax match Note /\<TODO\>\|\<NOTE\>\|\<\cJasper\>\|\<\cjj\>/
syntax match Fixme /\<\cfixme\>/
highlight! Note ctermfg=green ctermbg=black guifg=black guibg=#00AF5F
highlight! Fixme ctermfg=red ctermbg=black guifg=black guibg=red
