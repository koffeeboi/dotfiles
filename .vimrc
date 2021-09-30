syntax on
filetype on

let mapleader="\<Space>"

set rtp+=~/vimfiles

silent! call mkdir($HOME . "/vimfiles")
silent! call mkdir($HOME . "/vimfiles/swap")
silent! call mkdir($HOME . "/vimfiles/backup")
silent! call mkdir($HOME . "/vimfiles/undo")
set backupdir=~/vimfiles/backup//
set directory=~/vimfiles/swap//
set undodir=~/vimfiles/undo//

call plug#begin('~/vimfiles/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    "https://github.com/dhruvasagar/vim-table-mode
    Plug 'dhruvasagar/vim-table-mode'
call plug#end()

set background=light
 
"Must install vim-markdown for markdown syntax highlighting rules. See https://github.com/plasticboy/vim-markdown.
colorscheme PaperColor

"syntax enable

"Disable matchparen and DoMatchParen for performance https://old.reddit.com/r/vim/comments/7rcc5e/quick_question_about_domatchparen/dsvt5ys/
let g:loaded_matchparen = 1

set noswapfile
set nomodeline
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
set nocursorline
set clipboard=unnamed                                                       "Use system clipboard by default for y and p
set sidescroll=1                                                            "Horizontal scrolling, move character by character
set sidescrolloff=3                                                         "Three characters from the edge of window, start scrolling by sidescroll=n
set foldopen="mark,percent,quickfix,search,tag,undo"                        "Only open folds under these options. See :help fdo for options

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
    set guitablabel=%N/\ %t\ %M                                             "Show tab number, filename, if modified in tab bar title
    set guicursor+=a:blinkon0                                               "Disable blinking cursor
    set guifont=Consolas:h14:cANSI:qDRAFT                                   "Set GVIM font

    "Use only of these two (maximize or non-maximize)
    "autocmd GUIEnter * simalt ~x                                            "Maximizes window
    set lines=35 columns=75                                                "Smaller window
endif

"---------------------native packages------------------------------------

"https://github.com/vim/vim/blob/master/runtime/pack/dist/opt/cfilter/plugin/cfilter.vim
"https://stackoverflow.com/questions/15406138/is-it-possible-to-grep-the-quickfix-window-in-vim/51962217#51962217
"Use this to filter quickfix results
packadd cfilter                                                              
command! -nargs=1 JojoSearchLFilter :Lfilter /<args>/
nnoremap <leader>fl :JojoSearchLFilter<space>

command! -nargs=1 JojoSearchCFilter :Cfilter /<args>/
nnoremap <leader>fc :JojoSearchCFilter<space>

"----------------------keybindings----------------------------------


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

nnoremap <f9> :so $myvimrc<CR>
nnoremap <f10> :e $myvimrc<CR>

nnoremap <c-tab> :tabnext<CR>
nnoremap <c-s-tab> :tabprevious<CR>

vnoremap <Leader>" c"<ESC>pa"<ESC>
vnoremap <Leader>' c'<ESC>pa'<ESC>
vnoremap <Leader>` c`<ESC>pa`<ESC>
vnoremap <Leader>~ c~<ESC>pa~<ESC>
vnoremap <Leader>* c*<ESC>pa*<ESC>
vnoremap <Leader>** c**<ESC>pa**<ESC>
vnoremap <Leader>( c(<ESC>pa)<ESC>
vnoremap <Leader>) c(<ESC>pa)<ESC>
vnoremap <Leader>{ c{<ESC>pa}<ESC>
vnoremap <Leader>} c{<ESC>pa}<ESC>
vnoremap <Leader>[ c[<ESC>pa]<ESC>
vnoremap <Leader>] c[<ESC>pa]<ESC>
vnoremap <Leader>< c<<ESC>pa><ESC>
vnoremap <Leader>> c<<ESC>pa><ESC>

nnoremap <Leader>w :w<CR>

"----------------------Task/Todo file----------------------------------
"hi TaskTodo gui=bold guifg=#EA2222
"augroup HiglightTODO
"    autocmd!
"    autocmd WinEnter,VimEnter * :silent! call matchadd('TaskTodo', 'TODO', -1)
"augroup END

function! OpenFiles()
    "args ~\desktop\txt\*
    args ~\desktop\wtf\ideas.txt
endfunction

nnoremap <f12> :call OpenFiles()<CR>

"Insert date at cursor. https://stackoverflow.com/a/58604
iabbrev cdate <C-R>=strftime("@%Y-%m-%d")<CR>

"Use two spaces for txt files.
autocmd FileType text setlocal shiftwidth=2 tabstop=2

"https://superuser.com/questions/844004/creating-a-simple-vim-syntax-highlighting
hi JojoLabel                gui=bold guifg=#005FA7
hi JojoTask                 gui=none guibg=#C5D8D9 guifg=#444448

hi JojoUnorderedList        gui=bold guifg=#A700AF
hi JojoOrderedList          gui=bold guifg=#A700AF

hi JojoImportantTag         gui=none guibg=#FF4C4C guifg=#320000
hi JojoHighTag              gui=none guibg=#FFAC41 guifg=#2C2700
hi JojoLowTag               gui=none guibg=#FFE634 guifg=#2C2700

hi JojoDailyTag             gui=none guibg=#3FADFF guifg=#320000
hi JojoFutureTag            gui=none guibg=#3FADFF guifg=#320000

hi JojoTags                 gui=none guifg=#A700AF

hi JojoOptionalTag          gui=none guibg=#FFC107 guifg=#343A40

hi JojoDate                 gui=none guifg=#5F8700

hi JojoBrackets             gui=none    guifg=#005FA7
hi JojoParen                gui=italic  guifg=#878787
hi JojoString               gui=none    guibg=#B3ECB3 guifg=#111111
hi JojoBackTicks            gui=none    guifg=#DB0087

hi JojoBold                 gui=bold

hi JojoNumber               gui=bold guifg=#E65597

hi JojoPriorityOne          gui=none guibg=#EB23A1 guifg=black
hi JojoPriorityTwo          gui=none guibg=#FFAC4F guifg=black
hi JojoPriorityThree        gui=none guibg=#B299FF guifg=black

hi JojoArtTags              gui=none guibg=#8BCDCD guifg=#111111
hi JojoBlenderTags          gui=none guibg=#E8D4B4 guifg=#111111
hi JojoVSCTags              gui=none guibg=#CEE5D0 guifg=#111111
hi JojoSysTags              gui=none guibg=#FFEDA3 guifg=#111111
hi JojoSocialTags           gui=none guibg=#E4BAD4 guifg=#111111
hi JojoVimTags              gui=none guibg=#B5EAEA guifg=#111111
hi JojoResearchTags         gui=none guibg=#FFAAA7 guifg=#111111
hi JojoWebsiteTags          gui=none guibg=#B8B5FF guifg=#111111
hi JojoWorkTags             gui=none guibg=#FFCB91 guifg=#111111
hi JojoCodeTags             gui=none guibg=#EBA1B6 guifg=#111111

hi JojoHeader1              gui=none guifg=#008700
hi JojoHeader2              gui=none guifg=#0087AF
hi JojoHeader3              gui=none guifg=#8700AF
hi JojoHeader4              gui=none guifg=#D75F00
hi JojoHeader5              gui=none guifg=#D75F00
hi JojoHeader6              gui=none guifg=#D75F00

"https://vim.fandom.com/wiki/Automatically_fitting_a_quickfix_window_height
"Whenever quickfix is called, it will call this function to list as many 
"lines as possible. Adjust minheight, maxheight variable to preference.
au FileType qf call AdjustWindowHeight(5, 15)
function! AdjustWindowHeight(minheight, maxheight)
   let l = 1
   let n_lines = 0
   let w_width = winwidth(0)
   while l <= line('$')
       " number to float for division
       let l_len = strlen(getline(l)) + 0.0
       let line_width = l_len/w_width
       let n_lines += float2nr(ceil(line_width))
       let l += 1
   endw
   exe max([min([n_lines, a:maxheight]), a:minheight]) . "wincmd _"
endfunction

"Used to display lvimgrep results, a.k.a the actual 'task list'/'agenda'
" quickfix = v:val.quickfix, copen, cclose, vimgrep
" location list = v:val.loclist, lopen, lclose, lvimgrep
command! -nargs=0 JojoToggleLocationList if empty(filter(getwininfo(), "v:val.loclist")) | lopen | else | lclose | endif
nnoremap <f1> :JojoToggleLocationList<CR>
nnoremap <C-n> :lnext<CR>
nnoremap <C-p> :lprevious<CR>

command! -nargs=0 JojoToggleQuickFix if empty(filter(getwininfo(), "v:val.quickfix")) | copen | else | cclose | endif
nnoremap <f2> :JojoToggleQuickFix<CR>
nnoremap <C-Down> :cnext<CR>
nnoremap <C-Up> :cprevious<CR>

"Grep for unfinished tasks
command! -nargs=0 JojoGrepUnfinishedTasks :lvimgrep /\[\]\s.*[\.\?!]/gj % <BAR>
nnoremap <Leader>t :JojoGrepUnfinishedTask<CR>

"Sketchy display hack
"Basically, use vimgrep to find lines starting with [tags] in .vimrc and display in quickfix.
"[tags] Use `findtags.py` to find non-duplicate tags. `$ findtags.py file.txt`
"[tags]        priority @low @high @critical     date: @1990-01-01 (yyyy-mm-dd)
"[tags]                                          special: @optional
"[tags]        time: @future @daily              misc: chore, config, notes, productivity, todos, passion
"[tags]                                          
"[tags]        categories: art, blender, vsc, sys, social, vim, research, website, work, code
"[tags]
"[tags]        art: drawing, light, values, color, perspective, anatomy, figure
"[tags]        blender: shaders, meshes
"[tags]        vsc: .
"[tags]        sys: .
"[tags]        social: conversation, positivity, politeness 
"[tags]        vim: .
"[tags]        research: .
"[tags]        website: .
"[tags]        work: interview, application
"[tags]        code: .
command! -nargs=0 JojoDisplayTags :lvimgrep /^"\[tags\]/gj ~/.vimrc <BAR>
nnoremap <Leader>d :JojoDisplayTags<CR>

"Fzf is good, but the window doesn't persist like quickfix.
"Use both fzf and the vimgrep commands.
"Search for anything in the file
command! -nargs=1 JojoSearch :lvimgrep /<args>/gj % <BAR>
nnoremap <Leader>s :JojoSearch<space>

""Search for all labels
nnoremap <Leader>e :JojoSearch ^\s*.*:\s*$<CR>

"Help menu.
"[help]      | -------------------------------------------------------------------------------- |
"[help]      | spc-spc  help          | spc-e  list labels        | f9   reload vimrc           |
"[help]      | ---------------------- | spc-d  list tags          | f10  open vimrc             |
"[help]      | f1/f2 toggle loc/qf    | spc-t  list tasks         | f12  open todofiles in tabs |
"[help]      | c-n/c-down  next error | ------------------------- | --------------------------- |
"[help]      | c-p/c-up    prev error | spc-s  grep in file       | cdate  insert date tag      |
"[help]      | ---------------------- | spc-fl/fc  filter loc/qf  | bmk    insert bookmark      |
"[help]      |                        | ------------------------- | --------------------------- |
"[help]      | spc-b :Buffers         | spc-h explorer open       | spc-w    save               |
"[help]      | spc-l :BLines          | spc-j chrome open         |                             |
"[help]      | spc-L :Lines           | spc-k firefox open        |                             |
"[help]      | -------------------------------------------------------------------------------- |

command! -nargs=0 JojoDisplayHelp :lvimgrep /^"\[help\]/gj ~/.vimrc <BAR>
nnoremap <Leader><Leader> :JojoDisplayHelp<CR>

"https://stackoverflow.com/questions/23316272/gvim-windows-7-netrw-open-url-under-text-cursor
"https://vi.stackexchange.com/questions/26007/getting-gx-to-open-a-url
"https://vi.stackexchange.com/questions/26052/select-word-under-cursor
"https://stackoverflow.com/questions/21224865/what-does-the-number-1-in-the-shellescape-function-mean-in-vim
nnoremap <Leader>h :silent execute '!explorer ' . shellescape(expand('<cfile>'), 1)<CR>
"Add chrome folder to env variables
nnoremap <Leader>j :silent execute "!chrome <C-r><C-a>"<CR>
"Add firefox folder to env variables
nnoremap <Leader>k :silent execute "!firefox <C-r><C-a>"<CR>

"Bookmark/File snippet
iabbrev bmk title: "PLACEHOLDER" tags: PLACEHOLDER<CR>
    \link: PLACEHOLDER<CR>
    \date: <C-R>=strftime("@%Y-%m-%d")<CR><CR>
    \description: <CR>

"----------------------fzf----------------------------------
"autocmd VimEnter * command! -bang -nargs=? JojoFiles call fzf#vim#files(<q-args>, {'options': '--no-preview'}, <bang>0)
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>L :Lines<CR>

function! s:build_location_list_for_files(lines)
  call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'))
  lopen
  ll
endfunction

"https://github.com/junegunn/fzf/blob/master/README-VIM.md#global-options-supported-by-fzfwrap
"NOT POSSIBLE for buffer lines. The custom fzf_action is a hacky solution. It
"needs a special format to work. Only works for file names provided by fzf.
"See also:
"https://github.com/junegunn/fzf.vim/issues/448
"https://vimhelp.org/eval.txt.html#setqflist%28%29
"https://vimhelp.org/quickfix.txt.html#setqflist-examples
"https://vimhelp.org/eval.txt.html#setloclist%28%29
"https://github.com/junegunn/fzf.vim/issues/185#issuecomment-322120216
"https://github.com/junegunn/fzf/issues/1885
"
"BUT, there is some kind of default behavior underneath to pipe it to quickfix.
"Stick with quickfix window for now.

function! s:replace_location_list_for_bufferlines(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'), 'r')
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_location_list_for_files'),
  \ 'ctrl-r': function('s:replace_location_list_for_bufferlines'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

"---------------------table plugin--------------------------------
 
nnoremap <Leader>tm :TableModeToggle<CR>

"----------------------txt fold------------------------------------

"Fold labels or tasks
function! TextFolds()
    let thisline = getline(v:lnum)

    if thisline =~ '^\s\{10}[]' 
        return ">10"
    elseif thisline =~ '^\s\{10}.*:$' 
        return ">10"
    elseif thisline =~ '^\s\{8}[]' 
        return ">8"
    elseif thisline =~ '^\s\{8}.*:$' 
        return ">8"
    elseif thisline =~ '^\s\{6}[]' 
        return ">6"
    elseif thisline =~ '^\s\{6}.*:$' 
        return ">6"
    elseif thisline =~ '^\s\{4}[]' 
        return ">4"
    elseif thisline =~ '^\s\{4}.*:$' 
        return ">4"
    elseif thisline =~ '^\s\{2}[]' 
        return ">2"
    elseif thisline =~ '^\s\{2}.*:$' 
        return ">2"
    elseif thisline =~ '^\s\{0}[]' 
        return ">1"
    elseif thisline =~ '^\s\{0}.*:$'
        return ">1"
    else
        return "="
    endif
endfunction

function! TextFoldText()
    let foldsize = (v:foldend-v:foldstart)
    return getline(v:foldstart).' ('.foldsize.' lines)'
endfunction

function! TextFoldExpr()
    setlocal foldmethod=expr
    setlocal foldexpr=TextFolds()
    setlocal foldtext=TextFoldText()
endfunction

command! -nargs=0 JojoTextFoldExpr call TextFoldExpr()

"-------------------- notes ----------------------------------------

"https://taptoe.wordpress.com/2013/02/06/vim-capitalize-every-first-character-of-every-word-in-a-sentence/
" Capitalize every first letter of every word of a line:
" :s/\v<\a/\u&/g
" Capitalize everything
" :%s/\v<\a/\u&/g
