
" automatically downloads vim-plug to your machine if not found.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source .config/nvim/init.vim
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Define plugins to install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

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

	" plugin that provides support for writing LaTeX documents
	Plug 'lervag/vimtex'

    " A collection of language packs for Vim.
    Plug 'sheerun/vim-polyglot'

    " Track the engine.
    Plug 'SirVer/ultisnips'

    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'

    " A plugin of NERDTree showing git status flags.
    Plug 'Xuyuanp/nerdtree-git-plugin'

    Plug 'dpelle/vim-languagetool'


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
:set encoding=utf-8

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
"map <leader>nb :NERDTreeFromBookmark<Space>
"map <leader>nf :NERDTreeFind<cr>
nmap <leader>n :NERDTreeToggle<CR>  " open current buffer in file tree


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Tree A plugin of NERDTree showing git status flags.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeGitStatusConcealBrackets = 1 " turn off []
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Modify below if you want less invasive autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'tex'  : [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ],
  \ }

let g:ycm_complete_in_comments_and_strings=1
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'

set completeopt-=preview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX preview  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:livepreview_previewer = 'evince'
map <leader>t :LLPStartPreview<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<S-Tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

