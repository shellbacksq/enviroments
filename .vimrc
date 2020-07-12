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

" Initialize plugin system
call plug#end()

let g:coc_disable_startup_warning = 1



" 全局配置
syntax on  "语法高亮

set showmode "底部显示当前模式

set showcmd "底部显示键入的指令

set mouse=a "支持鼠标

set encoding=utf-8 "使用utf-8编码

set tabstop=2 "按下tab时，vim 显示空格数

set expandtab "将tab转为空格
set softtabstop=4 "tab转为４个空格

"　vim 恢复到上一次打开的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 外观配置
set number "显示行数

set cursorline "高亮光标所在行

set textwidth=80 "一行最多80个字符

set termguicolors " 开启24bit颜色

" 搜索

set showmatch " 遇到括号时,　自动高亮另一个

set hlsearch  " 高亮显示搜索匹配结果

set incsearch " 搜索模式时，每输入一个字符就自动搜索

" 使用 ss 启用
nmap ss <Plug>(easymotion-s2)

" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
