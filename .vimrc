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

nnoremap <f5> :so $myvimrc<CR>
nnoremap <f6> :e $myvimrc<CR>

"----------------------todo list----------------------------------------------------------
"" *search task*     | *new task*                   | *task states*    | *archive*        |
"" `spc-st` todo     | `spc-n` creates a new task   | `spc-t` todo     | `spc-a` archive  |
"" `spc-sg` doing    |                              | `spc-g` doing    |                  |
"" `spc-sw` waiting  | *search window*              | `spc-w` waiting  | *help*           |
"" `spc-sd` done     | `spc-l` toggle search window | `spc-d` done     | `spc-spc` help   |
"" `spc-sc` canceled | `C-n`   next result          | `spc-c` canceled |                  |
"" `spc-sr` repeat   | `C-p`   previous result      | `spc-r` repeat   | `f1` on/off task |
"" `spc-sf` future   |                              | `spc-f` future   | `f2` open todo   |
"" `spc-so` old      |                              | `spc-o` old      |                  |
"" @critical @high @low        @customtag                            *bold* `code` "quote"         

let s:tasks_highlight_on = 0
function! ToggleHighlightTaskGroup()
    if !s:tasks_highlight_on
        let s:tasks_highlight_on = 1

        hi TaskTodo                  gui=bold guifg=#EA2222
        hi TaskDoing                 gui=bold guifg=#002AFF
        hi TaskWaiting               gui=bold guifg=#BC169E

        hi TaskDone                  gui=none guifg=#477A63
        hi TaskCanceled              gui=none guifg=#B70003

        hi TaskRepeat                gui=bold guifg=#124DAD
        hi TaskFuture                gui=bold guifg=#BC169E
        hi TaskOld                   gui=bold guifg=#4F7658

        hi TaskAsterickEmphasis      gui=bold guifg=black
        hi TaskBacktickEmphasis      gui=bold guifg=#E47B00
        hi TaskDoubleQuoteEmphasis   gui=bold guifg=#5F8700

        hi TaskLabels                gui=none guibg=#BCBCBC guifg=#191919
        hi TaskTags                  gui=none guibg=#41BBC5 guifg=#023A3E

        hi TaskCriticalTag           gui=none guibg=#FF4C4C guifg=#320000
        hi TaskHighTag               gui=none guibg=#FFAC41 guifg=#2F1A00
        hi TaskLowTag                gui=none guibg=#FFE634 guifg=#2C2700

        hi TaskGreyout               gui=none guifg=#878787

        augroup HighlightTaskGroup
            au!
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskTodo', 'TODO', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskDoing', 'DOING', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskWaiting', 'WAITING', -1)

            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskRepeat', 'REPEAT', -1)

            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskFuture', 'FUTURE', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskOld', 'OLD', -1)

            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskAsterickEmphasis', '\*.\{-}\*', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskBacktickEmphasis', '`.\{-}`', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskDoubleQuoteEmphasis', '\".\{-}\"', -1)

            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskLabels', '^.*:$', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskTags', '@\S*', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskGreyout', '@\S*(.*)', -1)

            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskCriticalTag', '@critical', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskHighTag', '@high', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskLowTag', '@low', -1)

            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskGreyout', '^\s*DONE.*$\|^\s*CANCELED.*$', -1)

            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskDone', 'DONE', -1)
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskCanceled', 'CANCELED', -1)

            "Grey out all archive lines
            autocmd BufEnter,WinEnter,VimEnter * call matchadd('TaskGreyout', '^>.*$', -1)
        augroup END
    else
        let s:tasks_highlight_on = 0
        augroup HighlightTaskGroup
            au!
        augroup END
        hi clear TaskTodo                  
        hi clear TaskDoing                 
        hi clear TaskWaiting               
        
        hi clear TaskDone                  
        hi clear TaskCanceled              
       
        hi clear TaskRepeat                
        hi clear TaskFuture                
        hi clear TaskOld                   
      
        hi clear TaskAsterickEmphasis      
        hi clear TaskBacktickEmphasis      
        hi clear TaskDoubleQuoteEmphasis   
     
        hi clear TaskLabels                
        hi clear TaskTags                  
    
        hi clear TaskCriticalTag           
        hi clear TaskHighTag               
        hi clear TaskLowTag                
   
        hi clear TaskGreyout               
    endif 
endfunction

nnoremap <f1> :call ToggleHighlightTaskGroup()<CR>:e<CR>
nnoremap <f2> :e ~/Dropbox/TODO.txt<CR>

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

"Append @created/@closed tag
command! -nargs=0 TaskAddCreatedTime put =strftime(' @created(%m-%d-%Y %H:%M)')
command! -nargs=0 TaskAddClosedTime put =strftime(' @closed(%m-%d-%Y %H:%M)')

"Creates a new task like this: TODO @created(03-22-2020 11:03:28 PM)
nnoremap <Leader>n oTODO<ESC>:TaskAddCreatedTime<CR>k<S-j>l

"Task state transition functions: TODO/DOING/WAITING => DONE/CANCELED, REPEAT/FUTURE/OLD
"Note: These commands assume there is already a TODO/DONE/CANCELED task word.
nnoremap  <Leader>t mtA<ESC>:TaskAddCreatedTime<CR>k<S-j>0eciwTODO<ESC>`t:w<CR>
nnoremap  <Leader>g mt0eciwDOING<ESC>`t:w<CR>
nnoremap  <Leader>w mt0eciwWAITING<ESC>`t:w<CR>
nnoremap  <Leader>d mtA<ESC>:TaskAddClosedTime<CR>k<S-j>0eciwDONE<ESC>`t:w<CR>
nnoremap  <Leader>c mtA<ESC>:TaskAddClosedTime<CR>k<S-j>0eciwCANCELED<ESC>`t:w<CR>
nnoremap  <Leader>r mt0eciwREPEAT<ESC>`t:w<CR>
nnoremap  <Leader>f mt0eciwFUTURE<ESC>`t:w<CR>
nnoremap  <Leader>o mt0eciwOLD<ESC>`t:w<CR>

"Use visual block to select the lines to archive then press <Leader>a.
"This will move everything after the first ARCHIVE keyword found, prepending
"all selected lines with a '> ' after everything is moved.
vnoremap  <Leader>a :s/^/> /g<CR>gvxmt/^\CARCHIVE:$<CR>:nohl<CR>o<ESC><S-v>[p`t:w<CR>:e<CR>

"----------------------end of task todo/task manager----------------------

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
"----------------------end of random stuff----------------------------------
