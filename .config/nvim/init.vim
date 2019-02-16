if &shell =~# 'fish$'
    set shell=sh
endif

call plug#begin('~/.config/nvim/plugged')

    Plug 'itchyny/lightline.vim' " Statusline
    Plug 'joshdick/onedark.vim' " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
    Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
    Plug 'gcavallanti/vim-noscrollbar' " A scrollbar-like widget for the vim statusline
    Plug 'dag/vim-fish' " Vim support for editing fish scripts
    Plug 'scrooloose/nerdtree' " A tree explorer plugin for vim.
    Plug 'christoomey/vim-tmux-navigator' " Seamless navigation between tmux panes and vim splits
    Plug 'rust-lang/rust.vim' " Vim configuration for Rust.
    Plug 'racer-rust/vim-racer' " Racer support for Vim

call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a

set splitbelow
set splitright

map <C-n> :NERDTreeToggle<CR>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <M-Tab>   :TmuxNavigatePrevious<cr>

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" TODO: Compare against the version of tmux used instead of just commenting out the first if check.
"if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
"endif

syntax on
colorscheme onedark

" itchyny/lightline.vim
let g:lightline = {
    \ 'active': {
    \   'left': [
    \     ['mode', 'paste'],
    \     ['gitbranch', 'readonly', 'filename', 'modified']
    \   ],
    \   'right': [
    \     ['lineinfo'],
    \     ['percent'],
    \     ['fileformat', 'fileencoding', 'filetype', 'scrollbar']
    \   ]
    \ },
    \ 'component_function': {
    \   'fileencoding': 'kristofferhagen#statusline#FileEncoding',
    \   'fileformat':   'kristofferhagen#statusline#FileFormat',
    \   'filename':     'kristofferhagen#statusline#FileName',
    \   'filetype':     'kristofferhagen#statusline#FileType',
    \   'gitbranch':    'fugitive#head',
    \   'lineinfo':     'kristofferhagen#statusline#LineInfo',
    \   'mode':         'kristofferhagen#statusline#Mode',
    \   'modified':     'kristofferhagen#statusline#Modified',
    \   'percent':      'kristofferhagen#statusline#Percent',
    \   'scrollbar':    'kristofferhagen#statusline#Scrollbar',
    \ },
    \ 'colorscheme': 'onedark',
    \ }

" Disable the built-in mode indicator since this functionality is provided by lightline
set noshowmode
