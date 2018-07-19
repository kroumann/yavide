filetype plugin indent on                                                   " Turn on the filetype plugin
set sessionoptions=blank,buffers,folds,help,resize,tabpages,winpos,winsize  " Set session persistence options
set enc=utf-8                                                               " Set UTF-8 encoding
set fenc=utf-8
set termencoding=utf-8
set nocompatible                                                            " Disable vi compatibility (emulation of old bugs)
set autoindent                                                              " Use indentation of previous line
set smartindent                                                             " Use intelligent indentation for C
set tabstop=4                                                               " Tab width is 4 spaces
set shiftwidth=4                                                            " Indent also with 4 spaces
set expandtab                                                               " Expand tabs to spaces
set nowrap                                                                  " Do not wrap lines
set noequalalways                                                           " Do not maintain window-size ratio (when having multiple window splits I don't find it desirable)
set textwidth=120                                                           " Wrap lines at 120 chars. 80 is somewhat antiquated with nowadays displays.
let mapleader = ","                                                         " Define ',' is leader key
syntax on                                                                   " Turn syntax highlighting on
set ignorecase
set smartcase
set incsearch
set hlsearch                                                                " Highlight all search results
set number                                                                  " Turn line numbers on
set showmatch                                                               " Highlight matching braces
set comments=sl:/*,mb:\ *,elx:\ */                                          " Intelligent comments
set wildmode=longest:full                                                   " Use intelligent file completion like in the bash
set wildmenu
set hidden                                                                  " Allow changing buffers without saving them
set cul                                                                     " Highlight the current line
set backspace=2                                                             " Backspace tweaks
set backspace=indent,eol,start
set smarttab
if has("gui_running")                                                       " GUI Vim settings
    set guioptions=agimtTr                                                  " Show 'Menu' + 'Toolbar' + 'Right Scrollbar'
    colorscheme solarized                                                   " Set the color scheme
    set background=dark
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9                       " Set the nice Powerline font so Airline could make use of it
    set lines=999 columns=999                                               " Run maximized
else                                                                        " Console Vim settings
    set t_Co=256                                                            " Set the color scheme
    colorscheme wombat256
    if exists("+lines")                                                     " Run maximized
        set lines=50
    endif
    if exists("+columns")
        set columns=100
    endif
endif
if has("win32")                                                             " Make backspace working on Windows
    set bs=2
endif

if (g:editor_use_bkp_files == 1 || g:editor_use_swp_files == 1 || g:editor_use_undo_files == 1)
    if !isdirectory(g:YAVIDE_ROOT_DIRECTORY . '/.tmp')
        call mkdir(g:YAVIDE_ROOT_DIRECTORY . '/.tmp', 'p')
    endif
endif

set nobackup
if (g:editor_use_bkp_files == 1)
    set backupdir=g:YAVIDE_ROOT_DIRECTORY . '.tmp/.backup//'
    if !isdirectory(g:YAVIDE_ROOT_DIRECTORY . '/.tmp/.backup')
        call mkdir(g:YAVIDE_ROOT_DIRECTORY . '/.tmp/.backup', 'p')
    endif
endif

set noswapfile
if (g:editor_use_swp_files == 1)
    set directory=g:YAVIDE_ROOT_DIRECTORY . '.tmp/.swp//'
    if !isdirectory(g:YAVIDE_ROOT_DIRECTORY . '/.tmp/.swp')
        call mkdir(g:YAVIDE_ROOT_DIRECTORY . '/.tmp/.swp', 'p')
    endif
endif

set nowritebackup
if (g:editor_use_undo_files == 1)
    set undodir=g:YAVIDE_ROOT_DIRECTORY . '.tmp/.undo//'
    if !isdirectory(g:YAVIDE_ROOT_DIRECTORY . '/.tmp/.undo')
        call mkdir(g:YAVIDE_ROOT_DIRECTORY . '/.tmp/.undo', 'p')
    endif
endif

if g:editor_auto_highlight_word_occurences == 1
    call Y_Buffer_AutoHighlightToggle(v:true)
endif

