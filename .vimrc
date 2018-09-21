silent! call mkdir($HOME . "/.vim")
silent! call mkdir($HOME . "/.vim/temp")
silent! call mkdir($HOME . "/.vim/temp/backup")
silent! call mkdir($HOME . "/.vim/temp/swap")
silent! call mkdir($HOME . "/.vim/temp/undo")

set backupdir=~/.vim/temp/backup//                      "need // for no collisions
set directory=~/.vim/temp/swap//
set undodir=~/.vim/temp/undo//

"================================================================================================="

set rtp+=~/.vim/colors
set rtp+=~/.vim/colors/jjstyle.vim
set rtp+=~/.vim

"Plugin settings
"autocmd VimEnter * AirlineToggleWhitespace              "Turn off whitespace detection

"================================================================================================="

let g:gruvbox_contrast_dark="soft"                      "Soft contrast

if !exists("g:syntax_on")                               "Avoid syntax collision with others
    syntax enable
endif

let mapleader=','

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
set foldmethod=indent                                   "Fold stuff based on indent level
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

"Gui options
if has ("gui_running")
    "highlight Cursor gui=NONE guibg=darkorange
    set guioptions -=m                                  "Menu bar
    set guioptions -=T                                  "Tool bar
    set guioptions -=r                                  "Right scroll bar
    set guioptions -=L                                  "Left scroll bar
    set guitablabel=%t                                  "Only show file name in tab bar
    set guicursor+=a:blinkon0                           "Disable blinking cursor

    autocmd GUIEnter * set vb t_vb=                     "Remove bell noise. (NOTE: There are >= 2 rc files loaded. One vimrc and one gvim rc, etc. They might sometimes override each other.)
    "autocmd GUIEnter * AirlineTheme jjstyle_airline

    if has ("unix")
        set guifont=Ubuntu\ Mono\ 12
    elseif has ("win32")
        set shell=cmd                                  "When using syntastic, for some reason on Windows, a TMP file is created but destroyed... adding this and -c fixes that...
        set shellcmdflag=/c
        set guifont=Consolas:h11:cANSI:qDRAFT
        autocmd GUIEnter * simalt ~x                    "Maximizes window
    endif
endif 

"Del
inoremap <C-l> <Del>

"Paste more than once hack
xnoremap p pgvy

"PathToFile FileType NumberOfLines ColumnNumber PercentageThroughFile [see :help statusline to what can add]
"set statusline=%F\ %y\ [%L\ lines]\ column:\ %c\ %=---%p%%--- "using airline atm so no need for this
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

"Insert a character from normal mode. Press space then enter a character. e.g space space, space enter, space 'i'
nnoremap <Space> i_<Esc>r

"Reload vim config file
nnoremap <F5> :so $MYVIMRC<ESC>

"Split current line down to next line
nnoremap <S-s> i<CR><ESC>l

"Move everything on cursor line and below down one line
nnoremap <C-j> mlo<ESC>`l
 
"Replace string under cursor
nnoremap <Leader>q :%s/\<<C-r><C-w>\>/
nnoremap <Leader>w :.,$s/\<<C-r><C-w>\>/

"Delete buffer without closing
nnoremap <silent> <Leader>k :bp\|bd#<CR>
 
"Increase/Decrease buffer window height/width
nnoremap <A--> <C-w>-
nnoremap <A-=> <C-w>+
nnoremap <A-,> <C-w><
nnoremap <A-.> <C-w>>

"Tab and buffer cycle
nnoremap <silent> <C-S-Tab> gT
nnoremap <silent> <C-Tab> gt
nnoremap <silent> ( :bp<Return>
nnoremap <silent> ) :bn<Return>
 
"List buffers
nnoremap gb :ls<CR>:buffer<Space>

"Turn off highlight
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Custom syntax highlight
syntax match Note /\<TODO\>\|\<NOTE\>\|\<\cJasper\>\|\<\cjj\>/
syntax match Fixme /\<\cfixme\>/
highlight! Note ctermfg=green ctermbg=black guifg=black guibg=#00AF5F
highlight! Fixme ctermfg=red ctermbg=black guifg=black guibg=red
