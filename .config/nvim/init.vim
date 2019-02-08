call plug#begin('~/.config/nvim/plugged')

    Plug 'itchyny/lightline.vim' " Statusline
    Plug 'joshdick/onedark.vim' " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
    Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
    Plug 'gcavallanti/vim-noscrollbar' " A scrollbar-like widget for the vim statusline

call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab

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

" Statusline {{{
" itchyny/lightline.vim: Hide the encoding field in NERDTree splits
function! LightlineFileEncoding()
  if &filetype !=? 'nerdtree'
    return &fileencoding
  else
    return ''
  endif
endfunction

" itchyny/lightline.vim: Hide the fileformat field in NERDTree splits
function! LightlineFileFormat()
  if &filetype !=? 'nerdtree'
    return &fileformat
  else
    return ''
  endif
endfunction

" itchyny/lightline.vim: Hide the filename field in NERDTree splits
function! LightlineFileName()
  let filename = expand('%')

  if &filetype !=? 'nerdtree' && filename !=? 'ControlP'

    if filename ==# ''
      return '[No Name]'
    endif

    let parts = split(filename, ':')

    " Show the shell with full path as filename
    if parts[0] ==# 'term'
      return parts[-1]
    endif

    return filename
  else
    return ''
  endif
endfunction

" itchyny/lightline.vim: Hide the filetype field in NERDTree splits
function! LightlineFileType()
  if &filetype !=? 'nerdtree'
    return &filetype
  else
    return ''
  endif
endfunction

" itchyny/lightline.vim: Hide the lineinfo field in NERDTree splits
function! LightlineLineInfo()
  if &filetype !=? 'nerdtree'
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction

" itchyny/lightline.vim: Show plugin name instead of normal as the mode
function! LightlineMode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar' :
       \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
       \ &filetype ==# 'nerdtree' ?  'NERDTree' :
       \ &filetype ==# 'unite' ? 'Unite' :
       \ &filetype ==# 'vimfiler' ? 'VimFiler' :
       \ &filetype ==# 'vimshell' ? 'VimShell' :
       \ lightline#mode()
endfunction

" itchyny/lightline.vim: Hide the modified field in NERDTree splits
function! LightlineModified()
  if &filetype !=? 'nerdtree' && &modified == 1
    return '+'
  else
    return ''
  endif
endfunction

" itchyny/lightline.vim: Hide the percent field in NERDTree splits
" TODO: Consider adding a different field for this only for NERDTree so that it
"       doesn't get the colored background.
function! LightlinePercent()
  if &filetype !=? 'nerdtree'
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction

" gcavallanti/vim-noscrollbar
" https://github.com/maximbaz/dotfiles/blob/64154db7eb1c9434576c1b52959aaf3f7ba21e3c/.config/nvim/init.vim#L354
function! LightlineScrollbar()
  let top_line = str2nr(line('w0'))
  let bottom_line = str2nr(line('w$'))
  let lines_count = str2nr(line('$'))

  if bottom_line - top_line + 1 >= lines_count
    return ''
  endif

  let window_width = winwidth(0)
  if window_width < 90
    let scrollbar_width = 6
  elseif window_width < 120
    let scrollbar_width = 9
  else
    let scrollbar_width = 12
  endif

  "return noscrollbar#statusline(scrollbar_width, '-', '#')
  return noscrollbar#statusline(scrollbar_width, '-','█',['▐'],['▌'])
endfunction

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
    \   'fileencoding': 'LightlineFileEncoding',
    \   'fileformat':   'LightlineFileFormat',
    \   'filename':     'LightlineFileName',
    \   'filetype':     'LightlineFileType',
    \   'gitbranch':    'fugitive#head',
    \   'lineinfo':     'LightlineLineInfo',
    \   'mode':         'LightlineMode',
    \   'modified':     'LightlineModified',
    \   'percent':      'LightlinePercent',
    \   'scrollbar':    'LightlineScrollbar',
    \ },
    \ 'colorscheme': 'onedark',
    \ }
" }}}

" Disable the built-in mode indicator since this functionality is provided by lightline
set noshowmode
