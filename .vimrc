silent! call mkdir($HOME . "/.vim")
silent! call mkdir($HOME . "/.vim/backup")
silent! call mkdir($HOME . "/.vim/swap")
silent! call mkdir($HOME . "/.vim/undo")

set rtp+=~/.vim

"Need // for no collisions
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
call vundle#end()

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
set autochdir                                                               "Change into working directory when opening/viewing files
set undofile                                                                "Maintain undo history between sessions
set fileencoding=utf8
set encoding=utf8
set belloff=all                                                             "Stops some white flashing or something
set ignorecase                                                              "IncSearch is case insensitive
set smartcase                                                               "IncSearch becomes case sensitive if pattern contains an uppercase letter
set nowrap
set breakindent
set linebreak
set cursorline
set clipboard=unnamed                                                       "Use system clipboard by default for y and p
set sidescroll=1                                                            "Horizontal scrolling, move character by character
set sidescrolloff=3                                                         "Three characters from the edge of window, start scrolling by sidescroll=n

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

nnoremap <f4> :e ~/Dropbox/TODO.txt<CR>

nnoremap <f5> :so $myvimrc<CR>
nnoremap <f6> :e $myvimrc<CR>

"----------------------random stuff----------------------------------
"Tag generator for fat text file. Five characters length.
"let seed = srand()
"function! GenerateRandomCharacters(length)
"    put =range(1)
"        \ ->map({-> range(a:length)
"        \ ->map({-> (97+rand(g:seed) % 26)->nr2char()})->join('')})
"endfunction
"command! -nargs=0 RandomTag :call GenerateRandomCharacters(5)
"nnoremap <Leader>r :RandomTag<CR>

"Help you by displaying all the leader shortcuts
"List what keybinds are associated with the leader key
"command! -nargs=0 Help :map <lt>leader>                                         
"nnoremap <Leader>h :Help<CR>

"Search for tags in a big ass text file
"command! -nargs=1 TaskFindCaseSensitive :lvimgrep /\C<args>/gj % <BAR> :copen
"nnoremap <Leader>sf :TaskFindCaseSensitive<space>
"Open file using Windows default. Use <c-r><c-o><quotes> to paste in command mode
"command! -nargs=1 OpenSomethingWithDefaultProgram :call system('start <args>')
"nnoremap <Leader>o :OpenSomethingWithDefaultProgram<space>

"command! -nargs=0 KillBuffer :bp\|bd#
"command! -nargs=0 KillBuffer :bdelete
"nnoremap <Leader>k :KillBuffer<CR>

"----------------------todo list-------------------------
"" *find task list*  | *new task*                   | *task states*    | *archive*       |
"" `spc-sa`/`F1` all | `spc-n` creates a new task   | `spc-t` todo     | `spc-a` archive |
"" `spc-st` todo     |                              | `spc-g` doing    |                 |
"" `spc-sg` doing    | *search window*              | `spc-w` waiting  | *help*          |
"" `spc-sw` waiting  | `spc-l` open search window   | `spc-d` done     | `spc-spc` help  |
"" `spc-sd` done     | `C-n`   next result          | `spc-c` canceled |                 |
"" `spc-sc` canceled | `C-p`   previous result      | `spc-r` repeat   |                 |
"" `spc-sr` repeat   |                              | `spc-f` future   |                 |
"" `spc-sf` future   |                              | `spc-o` old      |                 |
"" `spc-so` old      |                              |                  |                 |
"" @critical @high @low        @customtag                            *bold* `code` "quote"         


highlight TaskTodo                  gui=bold guifg=#FF0004
highlight TaskDoing                 gui=bold guifg=#002AFF
highlight TaskWaiting               gui=bold guifg=#BC169E

highlight TaskDone                  gui=none guifg=#477A63
highlight TaskCanceled              gui=none guifg=#B70003

highlight TaskRepeat                gui=bold guifg=#124DAD

highlight TaskFuture                gui=bold guifg=#BC169E
highlight TaskOld                   gui=bold guifg=#4F7658

highlight TaskGreyOut               gui=none guifg=#878787

highlight TaskAsterickEmphasis      gui=bold guifg=black
highlight TaskBacktickEmphasis      gui=bold guifg=#E47B00
highlight TaskDoubleQuoteEmphasis   gui=bold guifg=#5F8700

highlight TaskLabels                gui=bold guibg=#005F87 guifg=#F4F4F4
highlight TaskTags                  gui=none guifg=#878787

highlight TaskCriticalTag           gui=none guibg=#FF4C4C guifg=black
highlight TaskHighTag               gui=none guibg=#FFAC41 guifg=black
highlight TaskLowTag                gui=none guibg=#FFE634 guifg=black

"highlight TaskDaily                 gui=none guibg=#9939FF guifg=black
"highlight TaskWeekly                gui=none guibg=#8D53CC guifg=black
"highlight TaskMonthly               gui=none guibg=#70568D guifg=black
"
"highlight TaskToday                 gui=none guibg=#3FFF68 guifg=black
"highlight TaskTomorrow              gui=none guibg=#FF41DE guifg=black
"highlight TaskYesterday             gui=none guibg=#54AB67 guifg=black

augroup HighlightTask
    au!
    autocmd WinEnter,VimEnter * call matchadd('TaskTodo', 'TODO', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskDoing', 'DOING', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskWaiting', 'WAITING', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskRepeat', 'REPEAT', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskFuture', 'FUTURE', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskOld', 'OLD', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskAsterickEmphasis', '\*.\{-}\*', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskBacktickEmphasis', '`.\{-}`', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskDoubleQuoteEmphasis', '\".\{-}\"', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskLabels', '^.*:$', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskTags', '@\S*(.*)\|@\S*', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskCriticalTag', '@critical', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskHighTag', '@high', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskLowTag', '@low', -1)

    "autocmd WinEnter,VimEnter * call matchadd('TaskDaily', '@daily', -1)
    "autocmd WinEnter,VimEnter * call matchadd('TaskWeekly', '@weekly', -1)
    "autocmd WinEnter,VimEnter * call matchadd('TaskMonthly', '@monthly', -1)

    "autocmd WinEnter,VimEnter * call matchadd('TaskToday', '@today', -1)
    "autocmd WinEnter,VimEnter * call matchadd('TaskTomorrow', '@tomorrow', -1)
    "autocmd WinEnter,VimEnter * call matchadd('TaskYesterday', '@yesterday', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskGreyOut', '^\s*DONE.*$\|^\s*CANCELED.*$', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskDone', 'DONE', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskCanceled', 'CANCELED', -1)

    "Grey out all archive lines
    autocmd WinEnter,VimEnter * call matchadd('TaskGreyOut', '^>.*$', -1)
augroup END

let mapleader="\<Space>"

"Display help menu by using <leader-leader>
command! -nargs=0 TaskHelpMenu :lvimgrep /^"" .*/gj $myvimrc <BAR>
nnoremap <Leader><Leader> :TaskHelpMenu<CR>

"Used to display lvimgrep results, a.k.a the actual 'task list'/'agenda'
command! -nargs=0 TaskList if empty(filter(getwininfo(), "v:val.loclist")) | lopen | else | lclose | endif
nnoremap <Leader>l :TaskList<CR>
nnoremap <C-n> :lnext<CR>
nnoremap <C-p> :lprevious<CR>

"Search for all TODO/DOING/WAITING -> DONE/CANCELED tasks and displays them in quickfix window
command! -nargs=0 TaskFindAllTask :lvimgrep /^\s*\CTODO\|^\s*\CDOING\|^\s*\CWAITING/gj % <BAR>
nnoremap <Leader>sa :TaskFindAllTask<CR>
command! -nargs=0 TaskFindTodo :lvimgrep /^\s*\CTODO/gj % <BAR>
nnoremap <Leader>st :TaskFindTodo<CR>
command! -nargs=0 TaskFindDoing :lvimgrep /^\s*\CDOING/gj % <BAR>
nnoremap <Leader>sg :TaskFindDoing<CR>
command! -nargs=0 TaskFindWaiting :lvimgrep /^\s*\CWAITING/gj % <BAR>
nnoremap <Leader>sw :TaskFindWaiting<CR>
command! -nargs=0 TaskFindDone :lvimgrep /^\s*\CDONE/gj % <BAR>
nnoremap <Leader>sd :TaskFindDone<CR>
command! -nargs=0 TaskFindCanceled :lvimgrep /^\s*\CCANCELED/gj % <BAR>
nnoremap <Leader>sc :TaskFindCanceled<CR>
command! -nargs=0 TaskFindRepeat :lvimgrep /^\s*\CREPEAT/gj % <BAR>
nnoremap <Leader>sr :TaskFindRepeat<CR>
command! -nargs=0 TaskFindFuture :lvimgrep /^\s*\CFUTURE/gj % <BAR>
nnoremap <Leader>sf :TaskFindFuture<CR>
command! -nargs=0 TaskFindOld :lvimgrep /^\s*\COLD/gj % <BAR>
nnoremap <Leader>so :TaskFindOld<CR>

nnoremap <f1> :TaskFindAllTask<CR>

"Add @created/@doing/@closed/@canceled tag to task state transition
command! -nargs=0 TaskAddCreatedTime put =strftime(' @created(%m-%d-%Y %H:%M)')
command! -nargs=0 TaskAddClosedTime put =strftime(' @closed(%m-%d-%Y %H:%M)')
"command! -nargs=0 TaskAddDoingTime put =strftime(' @doing(%m-%d-%Y %H:%M)')
"command! -nargs=0 TaskAddWaitingTime put =strftime(' @waiting(%m-%d-%Y %H:%M)')
"command! -nargs=0 TaskAddRepeatingTime put =strftime(' @repeating(%m-%d-%Y %H:%M)')
"command! -nargs=0 TaskAddCanceledTime put =strftime(' @canceled(%m-%d-%Y %H:%M)')

"Creates a new task like this: TODO @created(03-22-2020 11:03:28 PM)
nnoremap <Leader>n oTODO<ESC>:TaskAddCreatedTime<CR>k<S-j>l

"Note: These commands assume there is already a TODO/DONE/CANCELED task word.
nnoremap  <Leader>t mtA<ESC>:TaskAddCreatedTime<CR>k<S-j>0eciwTODO<ESC>`t:w<CR>
nnoremap  <Leader>g mt0eciwDOING<ESC>`t:w<CR>
nnoremap  <Leader>w mt0eciwWAITING<ESC>`t:w<CR>
nnoremap  <Leader>d mtA<ESC>:TaskAddClosedTime<CR>k<S-j>0eciwDONE<ESC>`t:w<CR>
nnoremap  <Leader>c mtA<ESC>:TaskAddClosedTime<CR>k<S-j>0eciwCANCELED<ESC>`t:w<CR>
nnoremap  <Leader>r mt0eciwREPEAT<ESC>`t:w<CR>
nnoremap  <Leader>f mt0eciwFUTURE<ESC>`t:w<CR>
nnoremap  <Leader>o mt0eciwOLD<ESC>`t:w<CR>

"Converts a non-task line to a new task
"nnoremap  <Leader>g mtA<ESC>:TaskAddCreatedTime<CR>k<S-j>ITODO <ESC>`t:w<CR>

"Use visual block to select the lines to archive then press <Leader>a.
"This will move everything after the first ARCHIVE keyword found, prepending
"all selected lines with a '> ' after everything is moved.
vnoremap  <Leader>a :s/^/> /g<CR>gvxmt/^\CARCHIVE:$<CR>:nohl<CR>o<ESC><S-v>[p`t:w<CR>:e<CR>

"----------------------end of task todo/task manager----------------------
