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
set belloff=all                                         "Stops some white flashing or something
set ignorecase                                          "IncSearch is case insensitive
set smartcase                                           "IncSearch becomes case sensitive if pattern contains an uppercase letter
set wrap
set breakindent
set linebreak

"PathToFile FileType NumberOfLines ColumnNumber PercentageThroughFile [see :help statusline to what can add]
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P

if has ("gui_running")
    set guioptions -=m                                  "Menu bar
    set guioptions -=T                                  "Tool bar
    set guioptions +=r                                  "Right scroll bar
    set guioptions -=L                                  "Left scroll bar
    set guitablabel=%t                                  "Only show file name in tab bar
    set guicursor+=a:blinkon0                           "Disable blinking cursor

    if has ("win32")
        set guifont=DejaVu_Sans_Mono:h14:cANSI:qDRAFT   "Set GVIM font

        autocmd GUIEnter * simalt ~x                    "Maximizes window

        hi clear
        if exists("syntax_on")
          syntax reset
        endif

        let colors_name = "evening"

        hi Normal guifg=#323232 guibg=#F9FAFA

        " Groups used in the 'highlight' and 'guicursor' options default value.
        hi EndOfBuffer          guifg=#323232 guibg=#F9FAFA
        hi ErrorMsg             guibg=Red guifg=White
        hi IncSearch            guibg=#323232 guifg=DarkOrange
        hi ModeMsg              gui=bold
        hi StatusLine           gui=none guibg=#E3E6E8 guifg=Black
        hi StatusLineNC         gui=reverse
        hi VertSplit            gui=reverse
        hi Visual               guibg=grey60
        hi VisualNOS            gui=underline,bold
        hi DiffText             gui=bold guibg=Red
        hi Cursor               guibg=#54ACAD guifg=Black
        hi lCursor              guibg=Cyan guifg=Black
        hi Directory            guifg=Cyan
        hi LineNr               guifg=#969797
        hi MoreMsg              gui=bold guifg=SeaGreen
        hi NonText              gui=bold guifg=LightBlue guibg=grey30
        hi Question             gui=bold guifg=Green
        hi Search               guibg=Yellow guifg=Black
        hi SpecialKey           guifg=Cyan
        hi Title                guifg=Magenta
        hi WarningMsg           guifg=Red
        hi WildMenu             guibg=Yellow guifg=Black
        hi Folded               guibg=LightGrey guifg=DarkBlue
        hi FoldColumn           guibg=Grey guifg=DarkBlue
        hi DiffAdd              guibg=DarkBlue
        hi DiffChange           guibg=DarkMagenta
        hi DiffDelete           gui=bold guifg=Blue guibg=DarkCyan
        hi CursorColumn         guibg=grey40
        hi CursorLine           guibg=grey40

        " Enable cursor line position tracking:
        set cursorline
        " Remove the underline from enabling cursorline:
        hi clear CursorLine
        " Set line numbering to red background:
        hi CursorLineNR gui=none guibg=#E3E6E8 guifg=#969797

        " Groups for syntax highlighting
        hi Constant guifg=#ffa0a0
        hi Special guifg=Orange
        hi Ignore guifg=grey20
    endif
endif

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

"Open file under cursor using default program..
nnoremap <F11> Vy:call system('start <C-r>"')<Return>
