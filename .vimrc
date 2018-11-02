set expandtab
set shiftwidth=4
set tabstop=4
set nocompatible              " be iMproved, required
filetype off                  " required
set ignorecase
set tw=79

let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" vim go
Plugin 'fatih/vim-go'

" go autocompletion
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}

" vim python
Plugin 'klen/python-mode'

" vim autocomplete python
Plugin 'davidhalter/jedi-vim'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" NERDTree
Bundle 'scrooloose/nerdtree'

" ctrl-p
Plugin 'kien/ctrlp.vim'

" smoothscroll
Bundle 'yonchu/accelerated-smooth-scroll'

" Fugitive Git
Bundle 'tpope/vim-fugitive'

" flake8 vim
" Bundle 'nvie/vim-flake8'

" easymotion
Plugin 'Lokaltog/vim-easymotion'

" vim-taskwarrior
Bundle 'farseer90718/vim-taskwarrior'

" powerline
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
let g:jedi#auto_initialization = 1
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Automatically open NERDTree
" :autocmd vimenter * NERDTree | wincmd p

" Get NERDTree to point to the appropriate file.
" autocmd BufEnter * silent! if bufname('%') !~# 'NERD_tree_' | cd %:p:h | NERDTreeCWD | wincmd p | endif

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call rc:syncTree()

" Flake8 on write of python file.
" autocmd BufWritePost *.py call flake8()

" Ignore pyc for NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Ctrlp ignore files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

" Don't allow ctrl-p to choose its own working path
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

" Show file we are working on always
"set laststatus=2
"set statusline+=%F

" Easy-Motion stuff------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

"Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
nmap f <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap \, <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
"----------------------------------------------------
"
"Remap some annoying things I do

command WQ wq
command Wq wq
command W w
command Q q

autocmd FileType go nmap <leader>b  <Plug>(go-build)


" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  " :GoBuild and :GoTestCompile
  " autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END
