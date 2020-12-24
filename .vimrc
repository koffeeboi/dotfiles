silent! call mkdir($HOME . "/.vim")
silent! call mkdir($HOME . "/.vim/backup")
silent! call mkdir($HOME . "/.vim/swap")
silent! call mkdir($HOME . "/.vim/undo")

set rtp+=~/.vim

"Need // for no collisions
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

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
set autochdir                                           "Change into working directory when opening/viewing files"
set undofile                                            "Maintain undo history between sessions
set fileencoding=utf8
set encoding=utf8

"PathToFile FileType NumberOfLines ColumnNumber PercentageThroughFile [see :help statusline to what can add]
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

"Paste hack: Pastes, then yank pasted. Without this, the yank register is consumed and cannot be pasted again.
xnoremap p pgvy

let mapleader=','

"Delete buffer without closing
nnoremap <silent> <Leader>k :bp\|bd#<CR>
 
"Cycle through buffer using '(' or ')'
nnoremap <silent> ( :bp<Return>
nnoremap <silent> ) :bn<Return>

"Turn off highlight after search with ctrl+l
nnoremap <silent> <C-l> :nohl<CR><C-l>
