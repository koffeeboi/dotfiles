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
"How to use: 
"All of the keys follow a mnemonic pattern and are close enough to be pressed with one hand.
"The only time you wouldn't use one-hand + mouse combo is when you're writing the task.
"For changing task state, archiving, and displaying the task list, these all should be
"done with a mouse click (to move your cursor on the task line) and one-handed key presses.

"To create a new task example
" 1. Anywhere
" 2. <Leader>n
" 3. ???
" 4. Profit

"To change to started state example
" 1. Single mouse click on a TODO line, or move your cursor on the line.
" 2. Change state to STARTED by pressing <Leader>s.
" 3. ???
" 4. Profit

"To change to done state example
" 1. Single mouse click on a STARTED line, or move your cursor on the line.
" 2. Change state to DONE by pressing <Leader>d.
" 3. ???
" 4. Profit

"To change to canceled state example
" 1. Single mouse click on a TODO line, or move your cursor on the line.
" 2. Change state to CANCELED by pressing <Leader>c.
" 3. ???
" 4. Profit

"To change a non-task line into a TODO line
" 1. Single mouse click on a line with no task keyword, or move your cursor on the line.
" 2. Change state to TODO state by pressing <Leader>g.
" 3. ???
" 4. Profit

"To archive tasks/any lines
" 1. (Windows 10), triple click and hold a TODO line, or visual block select the lines.
" 2. Drag down or whatever. Should be selecting ENTIRE lines.
" 3. Press <Leader>a
" 4. Archived.
" 5. ???
" 6. Profit

"There'll be some weird behaviors, but if you're aware of them and consistent in using it the right way
"Then they really aren't a big problem.

highlight TaskTodo              gui=bold guifg=#D70087
highlight TaskStarted           gui=bold guifg=#124DAD
highlight TaskDone              gui=bold guifg=#12AD66
highlight TaskCanceled          gui=bold guifg=#D64144
highlight TaskLabels            gui=bold guifg=#3487AF
highlight TaskTags              gui=none guifg=#878787
highlight TaskCriticalTag       gui=none guibg=#FF4C4C guifg=black
highlight TaskHighTag           gui=none guibg=#FFAC41 guifg=black
highlight TaskLowTag            gui=none guibg=#FFE634 guifg=black
highlight TaskDaily             gui=none guibg=#3FFF68 guifg=black
highlight TaskWeekly            gui=none guibg=#BE99FF guifg=black
highlight TaskMonthly           gui=none guibg=#956EDB guifg=black
highlight TaskToday             gui=none guibg=#3FFF68 guifg=black
highlight TaskYesterday         gui=none guibg=#2ED351 guifg=black
highlight TaskLastWeek          gui=none guibg=#23A03D guifg=black
highlight TaskTomorrow          gui=none guibg=#A0238A guifg=black
highlight TaskTextEmphasis      gui=none guifg=#E47B00
augroup HighlightTask
    au!
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskTodo', 'TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskStarted', 'STARTED', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskDone', 'DONE', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskCanceled', 'CANCELED', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskLabels', '^.*:$', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskTags', '@\S*(.*)\|@\S*', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskDaily', '@daily', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskWeekly', '@weekly', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskMonthly', '@monthly', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskToday', '@today', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskYesterday', '@yesterday', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskLastWeek', '@lastweek', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskTomorrow', '@tomorrow', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskCriticalTag', '@critical', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskHighTag', '@high', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskLowTag', '@low', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskTextEmphasis', '`.\{-}`\|\*.\{-}\*', -1)
augroup END

let mapleader="\<Space>"

"Used to display vimgrep results, a.k.a the actual 'task list'/'agenda'
function! ToggleTaskQuickFixWindow()
    if empty(filter(getwininfo(), "v:val.quickfix"))
        copen
    else
        cclose
    endif
endfunction
command! -nargs=0 TaskQuickFixWindow :call ToggleTaskQuickFixWindow()
nnoremap <Leader>w :TaskQuickFixWindow<CR>
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>


"Search for all TODO/STARTED/DONE/CANCELED tasks and displays them in quickfix window
" <Leader>ft for TODO
" <Leader>fs for STARTED
" <Leader>fd for DONE
" <Leader>fc for CANCELED
command! -nargs=0 TaskFindTodo :vimgrep /^\s*\CTODO/g % <BAR>
nnoremap <Leader>ft :TaskFindTodo<CR>
command! -nargs=0 TaskFindStarted :vimgrep /^\s*\CSTARTED/g % <BAR>
nnoremap <Leader>fs :TaskFindStarted<CR>
command! -nargs=0 TaskFindDone :vimgrep /^\s*\CDONE/g % <BAR>
nnoremap <Leader>fd :TaskFindDone<CR>
command! -nargs=0 TaskFindCanceled :vimgrep /^\s*\CCANCELED/g % <BAR>
nnoremap <Leader>fc :TaskFindCanceled<CR>

"Writes date in this format: 2021-01-14 Thu 2:57:57 PM
"Creates a new task like this: TODO @opened(03-22-2020 11:03:28 PM)
command! -nargs=0 TaskNew put =strftime('TODO @opened(%m-%d-%Y %X)')
nnoremap <Leader>n :TaskNew<CR>5l

"Add @opened/@started/@closed/@canceled tag to task state transition
command! -nargs=0 TaskAddOpenedTime put =strftime(' @opened(%m-%d-%Y %X)')
command! -nargs=0 TaskAddStartedTime put =strftime(' @started(%m-%d-%Y %X)')
command! -nargs=0 TaskAddClosedTime put =strftime(' @closed(%m-%d-%Y %X)')
command! -nargs=0 TaskAddCanceledTime put =strftime(' @canceled(%m-%d-%Y %X)')

"Note: These commands assume there is already a TODO/DONE/CANCELED task word.
"<Leader>t Changes task state to TODO and appends an @opened tag at the end.
"<Leader>s Changes task state to STARTED and appends an @started tag at the end.
"<Leader>d Changes task state to DONE and appends an @done tag at the end.
"<Leader>c Changes task state to CANCELED and appends an @canceled tag at the end.
nnoremap  <Leader>t mtA<ESC>:TaskAddOpenedTime<CR>k<S-j>0eciwTODO<ESC>`t
nnoremap  <Leader>s mtA<ESC>:TaskAddStartedTime<CR>k<S-j>0eciwSTARTED<ESC>`t
nnoremap  <Leader>d mtA<ESC>:TaskAddClosedTime<CR>k<S-j>0eciwDONE<ESC>`t
nnoremap  <Leader>c mtA<ESC>:TaskAddCanceledTime<CR>k<S-j>0eciwCANCELED<ESC>`t

"Prepends a line with TODO and appends @opened tag at the end.
"Use this when the task wasn't created using :TaskNew or <Leader>n
nnoremap  <Leader>g mtA<ESC>:TaskAddOpenedTime<CR>k<S-j>ITODO <ESC>`t

"Use visual block to select the lines to archive then press <Leader>a.
"This will move everything after the first ARCHIVE keyword found, prepending
"all selected lines with a '> ' after everything is moved.
"For Windows (or  maybe other OS), it might be faster to triple click and drag the lines
"to visually select the lines, then press <Leader>a.
vnoremap  <Leader>a :s/^/> /g<CR>:nohl<CR>gvxmt/^\CARCHIVE:$<CR>o<ESC><S-v>[p`t:w<CR>:e<CR>

"----------------------end of task todo/task manager----------------------
