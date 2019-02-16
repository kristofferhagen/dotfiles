" Hide the encoding field in NERDTree splits
function! kristofferhagen#statusline#FileEncoding()
  if &filetype !=? 'nerdtree'
    return &fileencoding
  else
    return ''
  endif
endfunction

" Hide the fileformat field in NERDTree splits
function! kristofferhagen#statusline#FileFormat()
  if &filetype !=? 'nerdtree'
    return &fileformat
  else
    return ''
  endif
endfunction

" Hide the filename field in NERDTree splits
function! kristofferhagen#statusline#FileName()
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

" Hide the filetype field in NERDTree splits
function! kristofferhagen#statusline#FileType()
  if &filetype !=? 'nerdtree'
    return &filetype
  else
    return ''
  endif
endfunction

" Hide the lineinfo field in NERDTree splits
function! kristofferhagen#statusline#LineInfo()
  if &filetype !=? 'nerdtree'
    return line('.').':'. col('.')
  else
    return ''
  endif
endfunction

" Show plugin name instead of normal as the mode
function! kristofferhagen#statusline#Mode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar' :
       \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
       \ &filetype ==# 'nerdtree' ?  'NERDTree' :
       \ &filetype ==# 'unite' ? 'Unite' :
       \ &filetype ==# 'vimfiler' ? 'VimFiler' :
       \ &filetype ==# 'vimshell' ? 'VimShell' :
       \ lightline#mode()
endfunction

" Hide the modified field in NERDTree splits
function! kristofferhagen#statusline#Modified()
  if &filetype !=? 'nerdtree' && &modified == 1
    return '+'
  else
    return ''
  endif
endfunction

" Hide the percent field in NERDTree splits
" TODO: Consider adding a different field for this only for NERDTree so that it
"       doesn't get the colored background.
function! kristofferhagen#statusline#Percent()
  if &filetype !=? 'nerdtree'
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction

" gcavallanti/vim-noscrollbar
" https://github.com/maximbaz/dotfiles/blob/64154db7eb1c9434576c1b52959aaf3f7ba21e3c/.config/nvim/init.vim#L354
function! kristofferhagen#statusline#Scrollbar()
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
