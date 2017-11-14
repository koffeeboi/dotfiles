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

"PLUGINS

"SuperTab
"if isdirectory($HOME . "/.vim/supertab")
"    let g:SuperTabCrMapping=1
"    so ~/.vim/supertab/plugin/supertab.vim
"    so ~/.vim/supertab/ftplugin/html.vim
"    so ~/.vim/supertab/ftplugin/xml.vim
"    helptags ~/.vim/supertab/doc
"endif

"Visual markers
"if isdirectory($HOME . "/.vim/visualmarks")
"    set runtimepath+=~/.vim/visualmarks
"    helptags ~/.vim/visualmarks/doc
"endif

"Airline
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

    autocmd VimEnter * AirlineToggleWhitespace          "Turn off whitespace detection
    if has("gui_running")
        autocmd VimEnter * AirlineTheme jjstyle_airline 
    endif
endif

"NerdTree
if isdirectory($HOME . "/.vim/nerdtree")
    set runtimepath+=~/.vim/nerdtree                     "Add nerdtree directory
    helptags ~/.vim/nerdtree/doc                         "Add nerdtree help page 
endif
"PLUGIN END

if !exists("g:syntax_on")                               "Avoid syntax collision with others
    syntax enable
endif

"let g:gruvbox_contrast_dark="soft"                      "Soft contrast
colorscheme jjstyle
 
let mapleader=','

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
set fileencoding=utf8
set encoding=utf8
"set bomb                                               "Don't use this for glsl. Corrupts file
"set cursorline                                         "Highlight cursor current line (NOTE: known to be a slow function, so remove if performance begin to hit)

"Gui options
if has ("gui_running")
    "highlight Cursor gui=NONE guifg=black guibg=green
    set guioptions -=m                                  "Menu bar
    set guioptions -=T                                  "Tool bar
    set guioptions -=r                                  "Right scroll bar
    set guioptions -=L                                  "Left scroll bar
    set guitablabel=%t                                  "Only show file name in tab bar
    set guicursor+=a:blinkon0                           "Disable blinking cursor

    set lines=999 columns=999

    if has ("unix")
        "set guifont=Inconsolata\ 12
        set guifont=Ubuntu\ Mono\ 12
    elseif has ("win32")
        "set guifont=
        set guifont=Consolas:h11:cANSI:qDRAFT

        autocmd GUIEnter * simalt ~x                    "Maximizes window
    endif

    "Fonts
        "Inconsolata:h12:cANSI:qDRAFT
        "DejaVu_Sans_Mono_for_Powerline:h10:cANSI:qDRAFT
        "Consolas:h11:cANSI:qDRAFT

    "YouCompleteMe                                      "GUI only for now. Can't run 64-bit vim in window's terminal emulator, however it is possible. A solution exist though.
    if isdirectory($HOME . "/.vim/Youcompleteme")
        let g:ycm_global_ycm_extra_conf = "~/.vim/YouCompleteMeConfigs/.ycm_extra_conf.py"
        set runtimepath+=~/.vim/Youcompleteme
        helptags ~/.vim/Youcompleteme/doc
    endif
endif 

autocmd GUIEnter * set vb t_vb=                         "Remove bell noise. (NOTE: There are >= 2 rc files loaded. One vimrc and one gvim rc, etc. They might sometimes override each other.)

"Del
inoremap <C-l> <Del>

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
nnoremap <C-j> mlo<ESC>`l
 
"Replace string under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>h :.,$s/\<<C-r><C-w>\>/

"Delete buffer without closing
nnoremap <silent> <Leader>k :bp\|bd#<CR>
 
"Increase/Decrease buffer window height/width
nnoremap <A--> <C-w>-
nnoremap <A-=> <C-w>+
nnoremap <A-,> <C-w><
nnoremap <A-.> <C-w>>
 
"Nerdtree shortcuts
nnoremap <Leader>o :NERDTree<Return>
nnoremap <Leader>tg :NERDTreeToggle<Return>
nnoremap <Leader>f :NERDTreeFocus<Return>

"Cut, Yank, Paste
nnoremap ;y m`v`a"dy``
nnoremap ;p m`v`a"dp``
nnoremap ;x m`v`a"dx``

"Tab and buffer cycle
nnoremap <silent> <C-S-Tab> gT
nnoremap <silent> <C-Tab> gt
nnoremap <silent> ( :bp<Return>
nnoremap <silent> ) :bn<Return>
 
"List buffers
nnoremap gb :ls<CR>:buffer<Space>

"Turn off highlight
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Previous error
nnoremap <F9> :cprevious<Return> 

"Next error
nnoremap <F10> :cnext<Return>

"Build and open error window
nnoremap <F11> :make!<Return><ESC>:copen<Return>

"Close error window
nnoremap <F12> :cclose<Return>

"Custom syntax highlight
syntax match Note /\<TODO\>\|\<NOTE\>\|\<\cJasper\>\|\<\cjj\>/
syntax match Fixme /\<\cfixme\>/
highlight! Note ctermfg=green ctermbg=black guifg=black guibg=#00AF5F
highlight! Fixme ctermfg=red ctermbg=black guifg=black guibg=red

"Settings
"let g:visualmarks_buffer_mark = 'l'
"call visualmarks#SetHighlights([ 
"    \["buffer", "black", "white",   "black", "white"],
"    \["a",      "black", "cyan",    "black", "#137b71"],
"    \["b",      "black", "yellow",  "black", "#ffa500"],
"    \["c",      "black", "red",     "black", "red"],
"    \["d",      "black", "red",     "black", "red"],
"    \["e",      "black", "red",     "black", "red"],
"\])
"nnoremap <silent> ma ma:call visualmarks#HighlightMark("a")<CR>
"nnoremap <silent> mb mb:call visualmarks#HighlightMark("b")<CR>
"nnoremap <silent> mc mc:call visualmarks#HighlightMark("c")<CR>
"nnoremap <silent> md md:call visualmarks#HighlightMark("d")<CR>
"nnoremap <silent> me me:call visualmarks#HighlightMark("e")<CR>
"nnoremap <silent> <Leader>z :call visualmarks#UnhighlightAll()<CR>

"Smooth scrollling
"[Modified] https://stackoverflow.com/questions/4064651/what-is-the-best-way-to-do-smooth-scrolling-in-vim
function! SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter = 1
    let progress = (counter + 0.0) * 100 / &scroll
    while counter < &scroll
        let counter += 1

        if progress < 30    "Less than 50% progress
            "pass
        elseif progress < 50
            sleep 1m
        elseif progress < 70
            sleep 3m
        elseif progress < 90
            sleep 5m
        else
            sleep 7m
        endif

        redraw
        exec "normal! " . scrollaction
        let progress = (counter + 0.0) * 100 / &scroll
    endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
