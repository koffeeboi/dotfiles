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
set autochdir                                                               "Change into working directory when opening/viewing files"
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
set clipboard=unnamed

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
"command! -nargs=1 TaskFindCaseSensitive :vimgrep /\C<args>/g % <BAR> :copen
"nnoremap <Leader>ff :TaskFindCaseSensitive<space>
"Open file using Windows default. Use <c-r><c-o><quotes> to paste in command mode
"command! -nargs=1 OpenSomethingWithDefaultProgram :call system('start <args>')
"nnoremap <Leader>o :OpenSomethingWithDefaultProgram<space>

"command! -nargs=0 KillBuffer :bp\|bd#
"command! -nargs=0 KillBuffer :bdelete
"nnoremap <Leader>k :KillBuffer<CR>

"----------------------todo/task manager--------------------------

highlight TaskTodo              gui=bold guifg=#D70087
highlight TaskStarted           gui=bold guifg=#124DAD
highlight TaskWaiting           gui=bold guifg=#A0238A

highlight TaskRepeat            gui=bold guifg=#4B65E7

highlight TaskDone              gui=bold guifg=#12AD66
highlight TaskCanceled          gui=bold guifg=#D64144

highlight TaskTextEmphasis      gui=none guifg=#E47B00
highlight TaskLabels            gui=bold guifg=#3487AF
highlight TaskTags              gui=none guifg=#878787

highlight TaskCriticalTag       gui=none guibg=#FF4C4C guifg=black
highlight TaskHighTag           gui=none guibg=#FFAC41 guifg=black
highlight TaskLowTag            gui=none guibg=#FFE634 guifg=black

highlight TaskDaily             gui=none guibg=#9939FF guifg=black
highlight TaskWeekly            gui=none guibg=#8D53CC guifg=black
highlight TaskMonthly           gui=none guibg=#70568D guifg=black

highlight TaskToday             gui=none guibg=#3FFF68 guifg=black
highlight TaskTomorrow          gui=none guibg=#FF41DE guifg=black
highlight TaskYesterday         gui=none guibg=#54AB67 guifg=black

highlight TaskFuture            gui=none guibg=#B642A2 guifg=black
highlight TaskOld               gui=none guibg=#4F7658 guifg=black

augroup HighlightTask
    au!
    autocmd WinEnter,VimEnter * call matchadd('TaskTodo', 'TODO', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskStarted', 'STARTED', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskWaiting', 'WAITING', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskRepeat', 'REPEAT', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskDone', 'DONE', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskCanceled', 'CANCELED', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskTextEmphasis', '`.\{-}`\|\*.\{-}\*', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskLabels', '^.*:$', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskTags', '@\S*(.*)\|@\S*', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskCriticalTag', '@critical', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskHighTag', '@high', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskLowTag', '@low', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskDaily', '@daily', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskWeekly', '@weekly', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskMonthly', '@monthly', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskToday', '@today', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskTomorrow', '@tomorrow', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskYesterday', '@yesterday', -1)

    autocmd WinEnter,VimEnter * call matchadd('TaskFuture', '@future', -1)
    autocmd WinEnter,VimEnter * call matchadd('TaskOld', '@old', -1)
augroup END

let mapleader="\<Space>"

"Used to display vimgrep results, a.k.a the actual 'task list'/'agenda'
function! ToggleTaskList()
    if empty(filter(getwininfo(), "v:val.quickfix"))
        copen
    else
        cclose
    endif
endfunction
command! -nargs=0 TaskList :call ToggleTaskList()
nnoremap <Leader>l :TaskList<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>


"Search for all TODO/STARTED/WAITING -> DONE/CANCELED tasks and displays them in quickfix window
command! -nargs=0 TaskFindTodo :vimgrep /^\s*\CTODO/g % <BAR>
nnoremap <Leader>ft mt:TaskFindTodo<CR>`t
command! -nargs=0 TaskFindStarted :vimgrep /^\s*\CSTARTED/g % <BAR>
nnoremap <Leader>fs mt:TaskFindStarted<CR>`t
command! -nargs=0 TaskFindWaiting :vimgrep /^\s*\CWAITING/g % <BAR>
nnoremap <Leader>fw mt:TaskFindWaiting<CR>`t
command! -nargs=0 TaskFindRepeat :vimgrep /^\s*\CREPEAT/g % <BAR>
nnoremap <Leader>fr mt:TaskFindRepeat<CR>`t
command! -nargs=0 TaskFindDone :vimgrep /^\s*\CDONE/g % <BAR>
nnoremap <Leader>fd mt:TaskFindDone<CR>`t
command! -nargs=0 TaskFindCanceled :vimgrep /^\s*\CCANCELED/g % <BAR>
nnoremap <Leader>fc mt:TaskFindCanceled<CR>`t
command! -nargs=0 TaskFindAllTask :vimgrep /^\s*\CTODO\|^\s*\CSTARTED\|^\s*\CWAITING/g % <BAR>
nnoremap <Leader>fa mt:TaskFindAllTask<CR>`t

"Writes date in this format: 2021-01-14 Thu 2:57:57 PM
"Creates a new task like this: TODO @opened(03-22-2020 11:03:28 PM)
command! -nargs=0 TaskNew put =strftime('TODO @opened(%m-%d-%Y %X)')
nnoremap <Leader>n :TaskNew<CR>5l

"Add @opened/@started/@closed/@canceled tag to task state transition
command! -nargs=0 TaskAddOpenedTime put =strftime(' @opened(%m-%d-%Y %X)')
command! -nargs=0 TaskAddStartedTime put =strftime(' @started(%m-%d-%Y %X)')
command! -nargs=0 TaskAddWaitingTime put =strftime(' @waiting(%m-%d-%Y %X)')
command! -nargs=0 TaskAddRepeatingTime put =strftime(' @repeating(%m-%d-%Y %X)')
command! -nargs=0 TaskAddClosedTime put =strftime(' @closed(%m-%d-%Y %X)')
command! -nargs=0 TaskAddCanceledTime put =strftime(' @canceled(%m-%d-%Y %X)')

"Note: These commands assume there is already a TODO/DONE/CANCELED task word.
"<Leader>t Changes task state to TODO and appends an @opened tag at the end.
"<Leader>s Changes task state to STARTED and appends an @started tag at the end.
"<Leader>d Changes task state to DONE and appends an @done tag at the end.
"<Leader>c Changes task state to CANCELED and appends an @canceled tag at the end.
nnoremap  <Leader>t mtA<ESC>:TaskAddOpenedTime<CR>k<S-j>0eciwTODO<ESC>`t:w<CR>
nnoremap  <Leader>s mtA<ESC>:TaskAddStartedTime<CR>k<S-j>0eciwSTARTED<ESC>`t:w<CR>
nnoremap  <Leader>w mtA<ESC>:TaskAddWaitingTime<CR>k<S-j>0eciwWAITING<ESC>`t:w<CR>
nnoremap  <Leader>r mtA<ESC>:TaskAddRepeatingTime<CR>k<S-j>0eciwREPEAT<ESC>`t:w<CR>
nnoremap  <Leader>d mtA<ESC>:TaskAddClosedTime<CR>k<S-j>0eciwDONE<ESC>`t:w<CR>
nnoremap  <Leader>c mtA<ESC>:TaskAddCanceledTime<CR>k<S-j>0eciwCANCELED<ESC>`t:w<CR>

"Prepends a line with TODO and appends @opened tag at the end.
"Use this when the task wasn't created using :TaskNew or <Leader>n
nnoremap  <Leader>g mtA<ESC>:TaskAddOpenedTime<CR>k<S-j>ITODO <ESC>`t:w<CR>

"Use visual block to select the lines to archive then press <Leader>a.
"This will move everything after the first ARCHIVE keyword found, prepending
"all selected lines with a '> ' after everything is moved.
"For Windows (or  maybe other OS), it might be faster to triple click and drag the lines
"to visually select the lines, then press <Leader>a.
vnoremap  <Leader>a :s/^/> /g<CR>gvxmt/^\CARCHIVE:$<CR>:nohl<CR>o<ESC><S-v>[p`t:w<CR>:e<CR>

"----------------------end of task todo/task manager----------------------
