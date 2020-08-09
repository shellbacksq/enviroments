" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" 代码提示插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 光标快速跳转插件
Plug 'easymotion/vim-easymotion'

" 打开最近操作文件 
Plug 'mhinz/vim-startify'

" 展示目录树插件
Plug 'preservim/nerdtree'

" vim内搜索
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
" shell语法检查
Plug 'scrooloose/syntastic'

" 给字符串添加双引号等
Plug 'tpope/vim-surround'

" 添加取消注释
Plug 'scrooloose/nerdcommenter'

" vim内fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" 显示git修改内容
Plug 'airblade/vim-gitgutter'

" 查找文件代码
Plug 'mileszs/ack.vim'


" 括号不同的颜色
Plug 'frazrepo/vim-rainbow'


" gtags用于跳转
Plug 'ludovicchabant/vim-gutentags'

" 配色
""Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'

" 智能查找
Plug 'Yggdroot/LeaderF'

" vim 美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

" Initialize plugin system
call plug#end()

let g:coc_disable_startup_warning = 1

let mapleader=","


" 全局配置
syntax on  "语法高亮

set showmode "底部显示当前模式

set showcmd "底部显示键入的指令

set mouse=a "支持鼠标

set encoding=utf-8 "使用utf-8编码

set tabstop=2 "按下tab时，vim 显示空格数

set expandtab "将tab转为空格
set softtabstop=4 "tab转为４个空格

set clipboard^=unnamed,unnamedplus "设置无名寄存器为系统粘贴板

"　括号自动补全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
"数组则不换行
inoremap { {}<ESC>i
"函数左括号加回车则换行
inoremap {<CR> {<CR>}<ESC>O
"　vim 恢复到上一次打开的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 外观配置
set number "显示行数

set cursorline "高亮光标所在行

set textwidth=80 "一行最多80个字符

"set termguicolors " 开启24bit颜色

" 搜索

set showmatch " 遇到括号时,　自动高亮另一个

set hlsearch  " 高亮显示搜索匹配结果

set incsearch " 搜索模式时，每输入一个字符就自动搜索

" 使用 ss 启用
nmap ss <Plug>(easymotion-s2)

" 设置NerdTree
map <F10> :NERDTreeMirror<CR>
map <F10> :NERDTreeToggle<CR>


""gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']

" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"　配置molokai
""let g:molokai_original = 1
syntax on
syntax enable
set t_Co=256
""colorscheme molokai
colorscheme hybrid
set background=dark


" 配置leaderf
" search word under cursor literally only in current buffer
noremap <leader>r :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>

" vim ctrlp 
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
nnoremap <Leader>fu :CtrlPFunky<Cr>

" airline
set laststatus=2  "永远显示状态栏
let g:airline#extensions#tabline#enabled = 1 "" 显示窗口tab和buffer
let g:airline_theme='hybridline'

