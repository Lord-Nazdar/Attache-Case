set nocompatible
let mapleader="\<Space>"

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Vim airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" color scheme
Plugin 'altercation/vim-colors-solarized'

" C++ syntax
Plugin 'octol/vim-cpp-enhanced-highlight'

" Ctag sidebar
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on

" airline config
set laststatus=2
set noshowmode
let g:airline_theme='wombat'
let g:airline_powerline_fonts = 1

" Default vim setup
set tabstop=4
set cursorline
set number
set relativenumber

" 80+
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v./

syntax enable
set background=dark
colorscheme solarized

" Save
nnoremap <Leader>s :w<CR>
					
" Copy Paste function
function! CmdPaste() abort
	set paste
	normal! "+p
	set nopaste
endfunction

nnoremap <Leader>p :call CmdPaste()<CR>

" Auto undo breakpoint
inoremap <CR> <C-g>u<CR>

" Edit and reload vim rc
nnoremap <Leader>ve :e $MYVIMRC<CR>
nnoremap <Leader>vs :so $MYVIMRC

" Ctags
command! RefreshCtags !ctags -R .
nmap <Leader>t :TagbarToggle<CR>

