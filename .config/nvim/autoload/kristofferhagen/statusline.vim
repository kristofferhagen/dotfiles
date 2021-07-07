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
