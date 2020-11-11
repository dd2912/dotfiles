"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically downloads vim-plug to your machine if not found.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define plugins to install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Browse the file system
	Plug 'scrooloose/nerdtree'

	" Ctrlp
	Plug 'kien/ctrlp.vim'

	" YCM
	Plug 'Valloric/YouCompleteMe'

	" A Vim Plugin for Lively Previewing LaTeX PDF Output
	 Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

	 " Plug 'vim-live-latex-preview'
	 
	 " plugin that provides support for writing LaTeX documents
	 Plug 'lervag/vimtex'

" All of your Plugins must be added before the following line
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other setteings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber
let mapleader ="\<Space>"
set background=dark
colorscheme peaksea
:set tabstop=4
:set shiftwidth=4
:set expandtab

highlight ColorColumn ctermbg=233 guibg=#0f0f0f
let &colorcolumn=join(range(81,999),",")
"set colorcolumn=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden " Allow buffers to be hidden if you've modified a buffer
nmap <leader>l :bnext<CR> " Move to the next buffer
nmap <leader>h :bprevious<CR> " Move to the previous buffer
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-p
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r'
nmap <leader>p :CtrlP<cr>  " enter file search mode


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
map <C-n> :NERDTreeToggle<CR>  " open and close file tree
nmap <leader>n :NERDTreeFind<CR>  " open current buffer in file tree


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modify below if you want less invasive autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \ }

let g:ycm_complete_in_comments_and_strings=1
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_global_ycm_extra_conf = '<path/to/your/ycm_extra_conf'

set completeopt-=preview
