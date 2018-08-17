set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gb18030,utf-16,big5
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set hlsearch
set incsearch
set showcmd
set showmode
set ruler
set hidden
set cursorline
set colorcolumn=79
set backspace=indent,eol,start
set clipboard+=unnamed

syntax enable

" 基于语法进行代码折叠 za 打开或关闭 zM 关闭所有折叠 zR 打开所有折叠
set foldmethod=syntax
" 启动 vim 时不要自动折叠代码
set foldlevel=100
" 不要创建 swp 文件
set noswapfile

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
inoremap <C-a> <Esc>g^i
inoremap <C-e> <Esc>lg$a
inoremap <C-l> <Esc>V
nnoremap <leader><space> :noh<CR>
" 用 & 执行上一次替换
nnoremap & :&&<CR>
" 用 & 在当前选区执行上一次替换
xnoremap & :&&<CR>
" 用 * 对选择的内容进行正向搜索
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
" 用 # 对选中的内容进行反向搜索
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V'.substitute(escape(@s,'/\'),'\n','\\n','g')
    let @s = temp
endfunction

" set background=dark
" let g:solarized_termcolors=256
colorscheme solarized

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'auto-pairs'
Plugin 'nvie/vim-flake8'
call vundle#end()
filetype plugin indent on


" nerdtree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeWinSize = 20


" nerdcommenter
let g:NERDSpaceDelims = 0
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'


" tagbar
nnoremap <C-t> :TagbarToggle<CR>
let g:tagbar_width = 20


" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'
" 跳转到定义
nnoremap <leader>jd :YcmCompleter GoTo<CR>
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_invoke_completion = '<M-;>'
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_key_list_select_completion = ['<C-n>','<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>','<up>']
let g:SuperTabDefaultCompletionType = '<C-n>'


" ultiSnips
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"


" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" emmet-vim
" Enable just for html, css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall


" " closetag.vim
" let g:closetag_filename = "*.html,*.xhtml,*.phtml,*.xml"

" markdown-preview
let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
let g:mkdp_auto_start = 1
let g:mkdp_refresh_slow = 1

" " indent
" " 之所以在这里配置，是因为在上面配置的话好像会被某些插件覆盖，导致无法生效，
" " 这是找到的一个可以解决这个问题的方法，可能还会有更好的方法。
" autocmd Filetype * setlocal ts=4 sts=4 sw=4 et
" autocmd FileType html,css setlocal ts=2 sts=2 sw=2 et
" 
" 折叠
autocmd FileType python setlocal foldmethod=indent makeprg=python\ %

" " 格式化
" autocmd BufWrite *.py :0,$!yapf --style google
