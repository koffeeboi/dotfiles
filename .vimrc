silent! call mkdir($HOME . "/.vim")
silent! call mkdir($HOME . "/.vim/backup")
silent! call mkdir($HOME . "/.vim/swap")
silent! call mkdir($HOME . "/.vim/undo")

set rtp+=~/.vim

"Need // for no collisions
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set background=light
colorscheme PaperColor

syntax enable
filetype on

set t_Co=256                                                                "Need this in terminal for PaperColor theme
set wildmode=list:longest,full                                              "List preview window for tab completion
set wildmenu                                                                "Show and move to next tab completion
set completeopt=longest,menuone                                             
set hlsearch                                                                "Highlight searches
set number                                                                  "Line number
set tabstop=4                                                               "Tab to 4 spaces
set shiftwidth=4
set mouse=a                                                                 "Enable mousewheel scrolling
set expandtab
set autoindent
set smartindent
set laststatus=2                                                            "Status bar
set textwidth=0                                                             "Something to do with auto wrapping even if nowrap is set
set wrapmargin=0
set autoread                                                                "Auto reload file if changed somewhere else
set incsearch                                                               "Live highlighting
set bs=indent,eol,start                                                     "Backspace over everything in insert mode
set vb t_vb=                                                                "Mute system beep and screen flash
set linespace=0                                                             "Fix special symbol alignment issue
set autochdir                                                               "Change into working directory when opening/viewing files"
set undofile                                                                "Maintain undo history between sessions
set fileencoding=utf8
set encoding=utf8
set belloff=all                                                             "Stops some white flashing or something
set ignorecase                                                              "IncSearch is case insensitive
set smartcase                                                               "IncSearch becomes case sensitive if pattern contains an uppercase letter
set wrap
set breakindent
set linebreak
set cursorline

set statusline =
set statusline +=%0*\[%n]                                                   "Buffernr
set statusline +=%0*\ %<%F%*                                                "Full path
set statusline +=%0*\ %{&ff}%*                                              "File format
set statusline +=%0*%y%*                                                    "File type
set statusline +=%0*\ %=\ row:%l/%L\ (%p%%)                                 "Row number/total (%)
set statusline +=%0*\ col:%c\                                               "Column number
set statusline +=%0*\ \ %m%r%w\ %P\ \                                       "Modified? Readonly? Top/bot.

if has('gui_running')
    set guioptions -=m                                                      "Menu bar
    set guioptions -=T                                                      "Tool bar
    set guioptions +=r                                                      "Right scroll bar
    set guioptions -=L                                                      "Left scroll bar
    set guitablabel=%t                                                      "Only show file name in tab bar
    set guicursor+=a:blinkon0                                               "Disable blinking cursor
    set guifont=DejaVu_Sans_Mono:h14:cANSI:qDRAFT                           "Set GVIM font
    autocmd GUIEnter * simalt ~x                                            "Maximizes window
endif

"----------------------Overriding defaults----------------------------------
"Can move cursor up and down wrapped lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"Paste hack: Pastes, then yank pasted. Without this, the yank register is consumed and cannot be pasted again.
xnoremap p pgvy

"Cycle through buffer using '(' or ')'
nnoremap <silent> ( :bp<RETURN>
nnoremap <silent> ) :bn<RETURN>

"Turn off highlight after search with ctrl+l
nnoremap <silent> <C-l> :nohl<CR><C-l>

"----------------------Leader key----------------------------------
let mapleader="\<Space>"

"List what keybinds are associated with the leader key
function! ToggleQuickFix()
    if empty(filter(getwininfo(), "v:val.quickfix"))
        copen
    else
        cclose
    endif
endfunction

"Tag generator for fat text file. Five characters length.
let seed = srand()
function! GenerateRandomCharacters(length)
    put =range(1)
        \ ->map({-> range(a:length)
        \ ->map({-> (97+rand(g:seed) % 26)->nr2char()})->join('')})
endfunction

"Help you by displaying all the leader shortcuts
command! -nargs=0 Help :map <lt>leader>                                         

"Search for tags in a big ass text file
command! -nargs=1 FindInFile :vimgrep /<args>/g % <BAR> :copen

"Open file using Windows default. Use <c-r><c-o><quotes> to paste in command mode
command! -nargs=1 OpenSomethingWithDefaultProgram :call system('start <args>')

"Writes date in this format: 2021-01-14 Thu 2:57:57 PM
command! -nargs=0 Date put =strftime('%Y-%m-%d %a %X')

command! -nargs=0 QuickFixWindow :call ToggleQuickFix()

"command! -nargs=0 KillBuffer :bp\|bd#
command! -nargs=0 KillBuffer :bdelete

command! -nargs=0 RandomTag :call GenerateRandomCharacters(5)

nnoremap <Leader>q :QuickFixWindow<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

nnoremap <Leader>o :OpenSomethingWithDefaultProgram<space>
nnoremap <Leader>k :KillBuffer<CR>
nnoremap <Leader>f :FindInFile<space>
nnoremap <Leader>d :Date<CR>
nnoremap <Leader>r :RandomTag<CR>
nnoremap <Leader>h :Help<CR>

"----------------------Highlight for Fat Text File--------------------------
"[.] [+] [-] [?] [!] #23vrsdf
"highlight Dot          gui=bold guifg=#005F87
"highlight Plus         gui=bold guifg=#07D600
"highlight Minus        gui=bold guifg=red
"highlight Question     gui=bold guifg=orange
"highlight Exclamation  gui=bold guibg=red       guifg=black
"highlight Tags         gui=bold guifg=#005F87
"augroup HighlightFatTextFile
"    autocmd!
"    autocmd WinEnter,VimEnter * :silent! call matchadd('Dot', '\[\.\]', -1)
"    autocmd WinEnter,VimEnter * :silent! call matchadd('Plus', '\[+\]', -1)
"    autocmd WinEnter,VimEnter * :silent! call matchadd('Minus', '\[-\]', -1)
"    autocmd WinEnter,VimEnter * :silent! call matchadd('Question', '\[?\]', -1)
"    autocmd WinEnter,VimEnter * :silent! call matchadd('Exclamation', '\[!\]', -1)
"    "autocmd WinEnter,VimEnter * :silent! call matchadd('Tags', '#\=\S\+', -1)
"augroup END

