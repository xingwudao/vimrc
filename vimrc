" *********************************************
" Vbundle插件管理                
" *********************************************
set nocompatible              " required
filetype off                  " required 
   
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()        
 
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
 
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim' 
Plugin 'scrooloose/nerdtree'
" *********************************************
" NERD插件属性
" *********************************************
au vimenter * NERDTree   " // 开启vim的时候默认开启NERDTree
autocmd VimEnter * wincmd p "//自动定位到待编辑文件
map <F2> :NERDTreeToggle<CR>  "// 设置F2为开启NERDTree的快捷键

Plugin 'majutsushi/tagbar'
" 启动时自动focus
let g:tagbar_auto_faocus =1 
" 启动指定文件时自动开启tagbar
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

Plugin 'Valloric/YouCompleteMe'
" *********************************************
" YCM插件相关
" *********************************************
let g:ycm_autoclose_preview_window_after_completion=1
" 跳转到定义处
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 默认tab、s-tab和自动补全冲突
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" *********************************************
" vim-airline 底部状态栏
" *********************************************
" 开启powerline字体
let g:airline_powerline_fonts = 1
" 使用powerline包装过的字体
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" *********************************************
" ctrlp  实现文件之间的跳转
" *********************************************
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" 设置过滤不进行查找的后缀名
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|pyc|o)$'

" *********************************************
" python自动缩进
" *********************************************
Plugin 'vim-scripts/indentpython.vim'

" *********************************************
" ClangFormat支持
" *********************************************
Plugin 'kana/vim-operator-user'
Plugin 'rhysd/vim-clang-format'
"map <C-I> :pyf path_to_clang_format/clang-format.py<CR>
"imap <C-I> <ESC>:pyf path_to_clang_format/clang-format.py<CR>i

" *********************************************
" For Google C++ style support
" *********************************************
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
" ...

" *********************************************
" 括号自动匹配
" *********************************************
Plugin 'Raimondi/delimitMate'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line                 
call vundle#end()            " required
filetype plugin indent on    " required
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

syntax on

" *********************************************
" Tomorrow主题配置
" *********************************************
set t_Co=256
set background=dark
colorscheme Tomorrow-Night

" *********************************************
" 分割布局相关
" *********************************************
set splitright
set splitbelow
"快捷键，ctrl+l切换到左边布局，ctrl+h切换到右边布局
"ctrl+k切换到上面布局，ctrl+j切换到下面布局
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" 开启代码折叠功能
" 根据当前代码行的缩进来进行代码折叠
set foldmethod=indent
set foldlevel=99

" 将za快捷键映射到space空格键上
nnoremap <space> za

" 设置编码为UTF8
set encoding=utf-8

" *********************************************
" python代码风格PEP8
" *********************************************
"au BufNewFile,BufRead *.py set tabstop=4 |set softtabstop=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent|set fileformat=unix
"au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2|set softtabstop=2|set shiftwidth=2

" 显示行号
set number
"
" *********************************************
" For Google C++ style support
" *********************************************
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" 解决vim下某些情况不能向左删除的问题
set backspace=2
