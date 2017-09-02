"Swapfiles/Backup/Undo file directories; need // for no collisions
if !isdirectory($HOME . "/.vim")
    call mkdir($HOME . "/.vim")
endif
if !isdirectory($HOME . "/.vim/backup")
    call mkdir($HOME . "/.vim/backup")
endif
if !isdirectory($HOME . "/.vim/swap")
    call mkdir($HOME . "/.vim/swap")
endif
if !isdirectory($HOME . "/.vim/undo")
    call mkdir($HOME . "/.vim/undo")
endif

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set runtimepath+=~/.vim

"Gui options
if has ("gui_running")
    set guioptions -=m                                  "Menu bar
    set guioptions -=T                                  "Tool bar
    set guioptions -=r                                  "Right scroll bar
    set guioptions -=L                                  "Left scroll bar
    set guitablabel=%t                                  "Only show file name in tab bar
    set guifont=Inconsolata:h12:cANSI:qDRAFT
    "Fonts
        "DejaVu_Sans_Mono_for_Powerline:h10:cANSI:qDRAFT
        "Consolas:h11:cANSI:qDRAFT
endif
"---------------------------------------------------------------------"
"----------------------------- SUPER TAB------------------------------"
"---------------------------------------------------------------------"
if isdirectory($HOME . "/.vim/supertab")
    let g:SuperTabCrMapping=1
    so ~/.vim/supertab/plugin/supertab.vim
    so ~/.vim/supertab/ftplugin/html.vim
    so ~/.vim/supertab/ftplugin/xml.vim
    helptags ~/.vim/supertab/doc
endif
"---------------------------------------------------------------------"
"-------------------------------AIRLINE-------------------------------"
"---------------------------------------------------------------------"
if isdirectory($HOME . "/.vim/vim-airline")
    set runtimepath+=~/.vim/vim-airline                 "Add airline to runtime
    set runtimepath+=~/.vim/vim-airline-themes          "Add airline themes to runtime
    
    helptags ~/.vim/vim-airline/doc                     "Add airline help.txt to :help airline
    
    let g:airline#extensions#tabline#enabled=1          "Enable tabline
    let g:airline#extensions#tabline#show_buffers=1
    let g:airline#extensions#tabline#show_splits=1      "Removes tabline filename
    let g:airline#extensions#tabline#fnamemod=':t'      "Just show the filename (no path) in the tab
    let g:airline#extensions#tabline#tab_nr_type=1      "Tab number

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif

    "Arrows
    "let g:airline_powerline_fonts = 1                   "Enable special symbols
    "let g:Powerline_symbols = 'fancy'
    "let g:airline_left_sep = ''
    "let g:airline_left_alt_sep = ''
    "let g:airline_right_sep = ''
    "let g:airline_right_alt_sep = ''
    "let g:airline_symbols.branch = ''
    "let g:airline_symbols.readonly = ''
    "let g:airline_symbols.linenr = '☰'
    "let g:airline_symbols.maxlinenr = ''
    autocmd VimEnter * AirlineToggleWhitespace          "Turn off whitespace detection
    autocmd VimEnter * AirlineTheme gruvbox 
endif
"-----------------------------------------------------------------------"
"-------------------------------NERD TREE-------------------------------"
"-----------------------------------------------------------------------"
if !isdirectory($HOME . "/.vim/nerdtree")
    echo "unable to find nerdtree directory"
else
    set runtimepath+=~/.vim/nerdtree                     "Add nerdtree directory
    helptags ~/.vim/nerdtree/doc                         "Add nerdtree help page 
endif

map <Leader>o :NERDTree<Return>
map <Leader>tg :NERDTreeToggle<Return>
map <Leader>f :NERDTreeFocus<Return>
"-----------------------------------------------------------"
"-----------------------START BUILD CONFIG------------------"
"-----------------------------------------------------------"
let g:cmds = ['make',
                \'msbuild /nologo /verbosity:quiet /property:GenerateFullPaths=true C:\Users\JJ\Github\Timer\Timer\Timer.sln',
                \ $HOME . '\Github\Timer\Timer\build.bat',
                \'Add future makeprg values here',]

"MSVC error format
set errorformat=\ %#%f(%l\\\,%c):\ %m

"Prints a list of available makeprg values from g:cmds
function! EchoMakeProgCommands()
    let index = 0
    for i in g:cmds
        echom index . ' '. i
        let index = index + 1 
    endfor
endfunction

"Reference https://github.com/igemnace/vim-config/blob/master/cfg/.vimrc#L357
command! -nargs=1 Build let &makeprg=g:cmds[<q-args>]

"Make sure to add a space after :Build and then enter the number
map <F8> :call EchoMakeProgCommands()<Return>:Build 
"-----------------------------------------------------------"
"-----------------------END BUILD CONFIG--------------------"
"-----------------------------------------------------------"

"------------------------------------------------------------------------"
"------------------------------PLUGINS END-------------------------------"
"------------------------------------------------------------------------"

syntax on

let g:gruvbox_contrast_dark="soft"                      "Soft contrast
colorscheme gruvbox                                     "Color scheme

set wildmode=list:longest,full                          "List preview window for tab completion
set wildmenu                                            "Show and move to next tab completion
set background=dark
set hlsearch                                            "Highlight searches
set number                                              "Line number
set tabstop=4                                           "Tab to 4 spaces
set shiftwidth=4
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
set encoding=utf8
"set cursorline                                         "Highlight cursor current line (NOTE: known to be a slow function, so remove if performance begin to hit)

au GUIEnter * set vb t_vb=                              "Remove bell noise. (NOTE: There are >= 2 rc files loaded. One vimrc and one gvim rc, etc. They might sometimes override each other.)

"Del
imap <C-l> <Del>

"Paste more than once hack
xnoremap p pgvy

"PathToFile FileType NumberOfLines ColumnNumber PercentageThroughFile [see :help statusline to what can add]
"set statusline=%F\ %y\ [%L\ lines]\ column:\ %c\ %=---%p%%--- "using airline atm so no need for this

"jj to escape key
inoremap jj <ESC>

"Insert a character from normal mode. Press space then enter a character. e.g space space, space enter, space 'i'
nnoremap <Space> i_<Esc>r

"Reload vim config file
nnoremap <F5> :so $MYVIMRC<ESC>

"Split current line down to next line
nnoremap <S-s> i<CR><ESC>l

"Move everything on cursor line and below down one line
nnoremap <C-j> mlj<S-i><Enter><ESC>`l

"Replace string under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"Mark last position, yank from mark a to current position, stay at current position
"nnoremap <F6> mbmc`a""y`b`c

"Increase/Decrease buffer window height/width
nnoremap <A--> <C-w>-
nnoremap <A-=> <C-w>+
nnoremap <A-,> <C-w><
nnoremap <A-.> <C-w>>

"Mark/Pop jump
nnoremap <A-p> `azz
nnoremap <A-m> ma

"List buffers
nnoremap gb :ls<CR>:buffer<Space>

"Turn off highlight when entering insert mode
map <ESC> <ESC>:nohl<Return>

"Cycle tabs and buffers
map <C-S-Tab> gT
map <C-Tab> gt
map <A-h> :bp<Return>
map <A-l> :bn<Return>

"Previous error
map <F9> :cprevious<Return> 

"Next error
map <F10> :cnext<Return>

"Build and open error window
map <F11> :make!<Return><ESC>:copen<Return>

"Close error window
map <F12> :cclose<Return>

"Custom syntax highlight
syntax match Note /\<TODO\>\|\<NOTE\>\|\<\cJasper\>\|\<\cjj\>/
syntax match Fixme /\<\cfixme\>/
highlight Note term=bold ctermfg=Green gui=bold guifg=#00AF5F
highlight Fixme term=bold ctermfg=Red gui=bold guifg=Red
