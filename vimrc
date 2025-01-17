" Mr.Yu'vimrc

"""""""""""""""""""""""""""""""""""""""""""
"                 搜索相关                 "
"""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "        " 设置leader为空格键
set hlsearch             " 设置搜索高亮显示
exec "nohlsearch"
set incsearch            " 设置搜索时高亮
set ignorecase           " 设置忽略大小写
set smartcase            " 设置智能大小写
noremap = nzz            " 设置在搜索时下一个，并循环
noremap - Nzz            " 设置在搜索时上一个，并循环
noremap <LEADER><CR> :nohlsearch<CR>   " 设置空格加回车取消高亮


""""""""""""""""""""""""""""""""""""""""""""""
"                 快捷键设置                 "
""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-l> <ESC>      " 设置用ctrl+l代替Esc
" N key: go to the start of the line
noremap <C-n> 0
" I key: go to the end of the line
noremap <C-i> $
map ; :
map S :w<CR>              " 设置用S代替 :w+回车
map Q :q<CR>              " 设置用Q 代替 :q+回车
map R :source /etc/vim/vimrc<CR>
map s <nop>
map sl :set splitright<CR>:vsplit<CR>  " 向右分屏
map sh :set nosplitright<CR>:vsplit<CR>  "向左分屏
map sk :set nosplitbelow<CR>:split<CR>  " 向上分屏
map sj :set splitbelow<CR>:split<CR>  "向下分屏

map <LEADER>l <C-w>l  " 光标向右边屏幕移动 
map <LEADER>h <C-w>h  " 光标向左边屏幕移动 
map <LEADER>k <C-w>k  " 光标向上边屏幕移动 
map <LEADER>j <C-w>j  " 光标向下边屏幕移动 
" 更改分屏大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" 建立标签页
map m <nop>
map tt :tabe<CR>
map tn :-tabNext<CR> 
map tm :+tabNext<CR> 
" 上下分屏和左右分屏的互换
map sv <C-w>t<C-w>H
map sn <C-w>t<C-w>K

map <LEADER>o o<ESC>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                             实用设置                          ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2              " 设置状态栏为2
set completeopt=preview,menu  " 代码补全 
set clipboard+=unnamed        " 共享剪贴板  
set foldenable                " 开始折叠
syntax on                 " 语法高亮
set noeb                      " 去掉输入错误的提示声音
set confirm                   " 在处理未保存或只读文件的时候，弹出确认

set autoindent                " 自动缩进
set cindent

set foldmethod=indent         " 折叠代码
set foldlevel=99

set number                    " 设置显示序号
set relativenumber          " 不使用相对行号

set scrolloff=3               " 设置在最下段始终显示五行
let &t_ut=''                  " 优化终端配色

set norelativenumber 
set wildmenu                  " 在指令模式下，按下Tab自动补全
set cursorline                " 显示一条光线
set wrap                      " 控制字数不要超过界限

set expandtab                 " 按tab全部转换为空格
set showcmd                   " 在状态栏显示执行的指令
set tabstop=4                 " Tab键的宽度
set softtabstop=4             " 统一缩进为4
set shiftwidth=4

" set mouse=a  " 设置可以使用鼠标
set autochdir  " 让vim在当前目录下执行命令

set list  "" 显示行尾的一些空格
set listchars=tab:▸\ ,trail:▫

" 改变光标样式
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  " 让光标回到上一次打开的位置

" Copy to system clipboard
" 复制相关
set clipboard=unnamed
vnoremap Y :w !xclip -i -sel c<CR>

" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full

" Open the vimrc file anytime
map <LEADER>rc :e ~/.vim/vimrc<CR>

"Fing the Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 10<C-y>
noremap <C-E> 10<C-e>
inoremap <C-U> <Esc>10<C-y>a
inoremap <C-E> <Esc>10<C-e>a

" Delete the word and to change
noremap <C-o> xi

" Press space twice to jump to the next '<++>' and edit it
" map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

map R :call CompileBuildrrr()<CR>
func! CompileBuildrrr()
  exec "w"
  if &filetype == 'vim'
    exec "source $MYVIMRC"
  elseif &filetype == 'markdown'
    exec "echo"
  endif
endfunc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                             自动补全                          ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction



""""""""""""""""""""""""""""""""""""""""""""""
"                 插件管理                    "
""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible             " 和vi兼容的一些设置
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'

Plug 'ycm-core/YouCompleteMe'   " 代码自动补全
Plug 'dense-analysis/ale'       " 代码错误检查
" Taglist                       " 函数跳转
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }
" Python                        " Python自动缩进
Plug 'vim-scripts/indentpython.vim'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'  " 自动更改缩进等级
Plug 'itchyny/vim-cursorword'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Undo Tree
Plug 'mbbill/undotree/'

" Markdown
" Plug 'iamcco/markdown-preview.nvim', {'for' :['markdown', 'vim-plug'] }
" Plug 'iamcco/markdown-preview.nvim', { 'do': mkdp#util#install_sync() } }
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install_sync()', 'for': ['markdown','vim-plug'], 'on': 'MarkdownPreview' }
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'


call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""
let g:SnazzyTransparent = 1
color snazzy


" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" 插件NERDTree的配置
" === 显示文件树
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"  " 树的根向上进一步
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"  " 打开节点，打开或关闭文件夹，跳转到标记
let NERDTreeMapOpenInTab = "o"  " 打开选中文件/文件夹
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"  " 关闭选中的节点
let NERDTreeMapChangeRoot = "y"  " 让选中的文件夹成为新的根


" 插件NERDTree-git的配置
" ==
" == NERDTree-git
" == 给NERDTree 的改变做一些记号
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" 插件You Complete ME 的配置
" === 代码自动补全
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "/bin/python3"
let g:ycm_python_binary_path = "/bin/python3"

" 插件ale的配置
" === 代码检错插件
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

" 插件Taglist的配置
" === 显示函数信息，并跳转
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" 插件Undotree的配置
" === 查看文件目录历史
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>

" 插件Python-syntax的配置
" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" 插件vim-indent-guide 的配置
" === 自动缩进
" === vim-indent-guide
" ===
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_color_change_percent = 1
" silent! unmap <LEADER>ig
" autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'google-chrome'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

au BufRead,BufNewFile *.md set filetype=vimwiki

let g:taskwiki_sort_orders={"C": "pri-"}
let g:taskwiki_syntax = 'markdown'
let g:taskwiki_markdown_syntax='markdown'
let g:taskwiki_markup_syntax='markdown'
source ~/.vim/snippits.vim

" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

