" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:isWIN = 1
else
    let g:isWIN = 0
endif

" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
" =============================================================================
"                          << 以下为用户自定义配置 >>
" =============================================================================
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle管理插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!e
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
"
"自动补全YouCompleteMe插件，很好的只能提示，基本达到IDE级别
Plugin 'Valloric/YouCompleteMe'
Plugin 'Valloric/ListToggle'
"静态代码分析，语法检查
Plugin 'scrooloose/syntastic'
"主题
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
"目录树导航     \nt
Plugin 'scrooloose/nerdtree'
"标签导航       \tb
Plugin 'majutsushi/tagbar'
"Taglist        \tl
Plugin 'vim-scripts/taglist.vim'
"多文档编辑器
Plugin 'fholgado/minibufexpl.vim'
"文件搜索       \fp
Plugin  'kien/ctrlp.vim'
"美化状态栏
Plugin 'Lokaltog/vim-powerline'
"括号匹配高亮
Plugin 'kien/rainbow_parentheses.vim'
"可视化缩进
Plugin 'nathanaelkane/vim-indent-guides'
"标志无效空格
Plugin 'bronson/vim-trailing-whitespace'
"快速移动
Plugin  'Lokaltog/vim-easymotion'
"括号匹配跳转
Plugin 'vim-scripts/matchit.zip'
"宏定义补全
Plugin 'SirVer/ultisnips'
"快速加减注释 cc注释当前选中文本 cu取消
Plugin 'scrooloose/nerdcommenter'
"快速加环绕符
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"自动括号补全
Plugin 'Raimondi/delimitMate'
"代码对齐  \bb     按=号对对齐   \bn  自定义对齐
Plugin 'godlygeek/tabular'
"快速跳转到TODO列表
Plugin 'vim-scripts/TaskList.vim'
"维基百科
Plugin 'vim-scripts/vimwiki'
"多光标批量操作
Plugin 'terryma/vim-multiple-cursors'
"python语法高亮
Plugin 'hdima/python-syntax'
"窗口管理工具
Plugin 'winmanager'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured Plugins
" :PluginInstall(!)    - install(update) Plugins
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused Plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
 filetype on                                           "启用文件类型侦测
 filetype plugin on                                    "针对不同的文件类型加载对应的插件
 filetype plugin indent on                             "启用缩进
 set smartindent                                       "启用智能对齐方式
 set expandtab                                         "将Tab键转换为空格
 set tabstop=4                                         "设置Tab键的宽度
 set shiftwidth=4                                      "换行时自动缩进4个空格
 set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格
 set foldenable                                        "启用折叠
 set foldmethod=indent                                 "indent 折叠方式
" set foldmethod=marker                                "marker 折叠方式

" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 当文件在外部被修改，自动更新该文件
 set autoread

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<cr>:noh<cr>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<cr>:noh<cr>

set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
" set noincsearch                                       "在输入要搜索的文字时，取消实时匹配

" Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>

" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>

" Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>

" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>

" 每行超过80个的字符用下划线标示
au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 100 . 'v.\+', -1)

" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
set number                                            "显示行号
set laststatus=2                                      "启用状态栏信息
set showcmd                                           "输入的命令显示出来，看的清楚些
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
" set guifont=YaHei_Consolas_Hybrid:h10               "设置字体:字号（字体名称空格用下划线代替）
"set nowrap                                           "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
"au GUIEnter * simalt ~x                              "窗口启动时自动最大化
winpos 100 10                                         "指定窗口出现的位置，坐标原点在屏幕左上角
"set lines=38 columns=120                              "指定窗口大小，lines为高度，columns为宽度

" 设置代码配色方案/主题
if g:isGUI
    colorscheme Tomorrow-Night-Eighties               "Gvim配色方案
else
    "colorscheme Tomorrow-Night-Eighties               "终端配色方案
    "solarized主题
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    "molokai主题
    let g:molokai_original = 1
    "配色方案
    set background=dark
    set t_Co=256
    colorscheme solarized  "很好的主题，很炫！I like it！
    "colorscheme molokai
    "colorscheme phd
endif

" 个性化状栏（这里提供两种方式，要使用其中一种去掉注释即可，不使用反之）
let &statusline=' %t %{&mod?(&ro?"*":"+"):(&ro?"=":" ")} %1*|%* %{&ft==""?"any":&ft} %1*|%* %{&ff} %1*|%* %{(&fenc=="")?&enc:&fenc}%{(&bomb?",BOM":"")} %1*|%* %=%1*|%* 0x%B %1*|%* (%l,%c%V) %1*|%* %L %1*|%* %P'
" set statusline=%t\ %1*%m%*\ %1*%r%*\ %2*%h%*%w%=%l%3*/%L(%p%%)%*,%c%V]\ [%b:0x%B]\ [%{&ft==''?'TEXT':toupper(&ft)},%{toupper(&ff)},%{toupper(&fenc!=''?&fenc:&enc)}%{&bomb?',BOM':''}%{&eol?'':',NOEOL'}]

" 显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    map <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>
endif

" -----------------------------------------------------------------------------
"  < 编译、连接、运行配置 >
" -----------------------------------------------------------------------------
" F9 一键保存、编译、连接存并运行
map <F9> :call Run()<CR>
imap <F9> <ESC>:call Run()<CR>

" Ctrl + F9 一键保存并编译
map <c-F9> :call Compile()<CR>
imap <c-F9> <ESC>:call Compile()<CR>

" Ctrl + F10 一键保存并连接
map <c-F10> :call Link()<CR>
imap <c-F10> <ESC>:call Link()<CR>

let s:LastShellReturn_C = 0
let s:LastShellReturn_L = 0
let s:ShowWarning = 1
let s:Obj_Extension = '.o'
let s:Exe_Extension = '.exe'
let s:Sou_Error = 0

let s:windows_CFlags = 'gcc\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CFlags = 'gcc\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

let s:windows_CPPFlags = 'g++\ -fexec-charset=gbk\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CPPFlags = 'g++\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

func! Compile()
    exe ":ccl"
    exe ":update"
    if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
        let s:Sou_Error = 0
        let s:LastShellReturn_C = 0
        let Sou = expand("%:p")
        let Obj = expand("%:p:r").s:Obj_Extension
        let Obj_Name = expand("%:p:t:r").s:Obj_Extension
        let v:statusmsg = ''
        if !filereadable(Obj) || (filereadable(Obj) && (getftime(Obj) < getftime(Sou)))
            redraw!
            if expand("%:e") == "c"
                if g:iswindows
                    exe ":setlocal makeprg=".s:windows_CFlags
                else
                    exe ":setlocal makeprg=".s:linux_CFlags
                endif
                echohl WarningMsg | echo " compiling..."
                silent make
            elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
                if g:iswindows
                    exe ":setlocal makeprg=".s:windows_CPPFlags
                else
                    exe ":setlocal makeprg=".s:linux_CPPFlags
                endif
                echohl WarningMsg | echo " compiling..."
                silent make
            endif
            redraw!
            if v:shell_error != 0
                let s:LastShellReturn_C = v:shell_error
            endif
            if g:iswindows
                if s:LastShellReturn_C != 0
                    exe ":bo cope"
                    echohl WarningMsg | echo " compilation failed"
                else
                    if s:ShowWarning
                        exe ":bo cw"
                    endif
                    echohl WarningMsg | echo " compilation successful"
                endif
            else
                if empty(v:statusmsg)
                    echohl WarningMsg | echo " compilation successful"
                else
                    exe ":bo cope"
                endif
            endif
        else
            echohl WarningMsg | echo ""Obj_Name"is up to date"
        endif
    else
        let s:Sou_Error = 1
        echohl WarningMsg | echo " please choose the correct source file"
    endif
    exe ":setlocal makeprg=make"
endfunc

func! Link()
    call Compile()
    if s:Sou_Error || s:LastShellReturn_C != 0
        return
    endif
    let s:LastShellReturn_L = 0
    let Sou = expand("%:p")
    let Obj = expand("%:p:r").s:Obj_Extension
    if g:iswindows
        let Exe = expand("%:p:r").s:Exe_Extension
        let Exe_Name = expand("%:p:t:r").s:Exe_Extension
    else
        let Exe = expand("%:p:r")
        let Exe_Name = expand("%:p:t:r")
    endif
    let v:statusmsg = ''
    if filereadable(Obj) && (getftime(Obj) >= getftime(Sou))
        redraw!
        if !executable(Exe) || (executable(Exe) && getftime(Exe) < getftime(Obj))
            if expand("%:e") == "c"
                setlocal makeprg=gcc\ -o\ %<\ %<.o
                echohl WarningMsg | echo " linking..."
                silent make
            elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
                setlocal makeprg=g++\ -o\ %<\ %<.o
                echohl WarningMsg | echo " linking..."
                silent make
            endif
            redraw!
            if v:shell_error != 0
                let s:LastShellReturn_L = v:shell_error
            endif
            if g:iswindows
                if s:LastShellReturn_L != 0
                    exe ":bo cope"
                    echohl WarningMsg | echo " linking failed"
                else
                    if s:ShowWarning
                        exe ":bo cw"
                    endif
                    echohl WarningMsg | echo " linking successful"
                endif
            else
                if empty(v:statusmsg)
                    echohl WarningMsg | echo " linking successful"
                else
                    exe ":bo cope"
                endif
            endif
        else
            echohl WarningMsg | echo ""Exe_Name"is up to date"
        endif
    endif
    setlocal makeprg=make
endfunc

func! Run()
    let s:ShowWarning = 0
    call Link()
    let s:ShowWarning = 1
    if s:Sou_Error || s:LastShellReturn_C != 0 || s:LastShellReturn_L != 0
        return
    endif
    let Sou = expand("%:p")
    let Obj = expand("%:p:r").s:Obj_Extension
    if g:iswindows
        let Exe = expand("%:p:r").s:Exe_Extension
    else
        let Exe = expand("%:p:r")
    endif
    if executable(Exe) && getftime(Exe) >= getftime(Obj) && getftime(Obj) >= getftime(Sou)
        redraw!
        echohl WarningMsg | echo " running..."
        if g:iswindows
            exe ":!%<.exe"
        else
            if g:isGUI
                exe ":!gnome-terminal -e ./%<"
            else
                exe ":!./%<"
            endif
        endif
        redraw!
        echohl WarningMsg | echo " running finish"
    endif
endfunc

" -----------------------------------------------------------------------------
"  < 其它配置 >
" -----------------------------------------------------------------------------
set writebackup                             "保存文件前建立备份，保存成功后删除该备份
set nobackup                                "设置无备份文件
" set noswapfile                              "设置无临时文件
set vb t_vb=                                "关闭提示音

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "YCM自动补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>  "跳转到定义

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "< WinManager 插件配置 >
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " 管理各个窗口, 或者说整合各个窗口

 " 常规模式下输入 F3 调用插件
 nmap <F3> :WMToggle<cr>

 " 这里可以设置为多个窗口, 如'FileExplorer|TagList'
 let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
 let g:persistentBehaviour    = 0                 "只剩一个窗口时, 退出vim
 let g:winManagerWidth        = 30                "设置窗口宽度
 let g:AutoOpenWinManager     = 1                 "在进入vim时自动打开winmanager

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "目录文件导航
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 nmap <F2> :NERDTreeToggle<CR> " 常规模式下输入 F2 调用插件
 nmap <leader>nt :NERDTree<CR> " \nt         打开nerdtree窗口，在左侧栏显示
 let NERDTreeHighlightCursorline=1
 let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
 let g:netrw_home='~/bak'
 "close vim if the only window left open is a NERDTree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "标签导航
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 nmap <leader>tb :TagbarToggle<CR>  " \tb 打开tagbar窗口
 let g:tagbar_autofocus = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "taglist
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 nmap <F10> :TlistToggle<CR>
 nmap <leader>tl :Tlist<CR><c-l>                " \tl   打开Taglist/TxtBrowser窗口，在右侧栏显示 Tagtlist
 let Tlist_Show_One_File        = 1             " 只显示当前文件的tags
 let Tlist_Exit_OnlyWindow      = 1             " 如果Taglist窗口是最后一个窗口则退出Vim
 let Tlist_Use_Right_Window     = 1             " 在右侧窗口中显示
 let Tlist_File_Fold_Auto_Close = 1             " 自动折叠
 let Tlist_Sort_Type            = "name"                   " items in tags sorted by

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "多文档编辑器
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "多文件切换，也可使用鼠标双击相应文件名进行切换
 let g:miniBufExplMapWindowNavVim    = 1
 let g:miniBufExplMapWindowNavArrows = 1
 let g:miniBufExplMapCTabSwitchBufs  = 1
 let g:miniBufExplModSelTarget       = 1
 "解决FileExplorer窗口变小问题
 let g:miniBufExplForceSyntaxEnable = 1
 let g:miniBufExplorerMoreThanOne   = 2
 let g:miniBufExplCycleArround      = 1
 " buffer 切换快捷键，默认方向键左右可以切换buffer
 map <C-Tab> :MBEbn<cr>
 map <C-S-Tab> :MBEbp<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "文件搜索
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "打开ctrlp搜索
 let g:ctrlp_map = '<leader>ff'
 let g:ctrlp_cmd = 'CtrlP'
 " 相当于mru功能，show recently opened files
 map <leader>fp :CtrlPMRU<CR>
 "set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
 let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
	\ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
        \ }
 "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
 let g:ctrlp_working_path_mode=0
 let g:ctrlp_match_window_bottom=1
 let g:ctrlp_max_height=15
 let g:ctrlp_match_window_reversed=0
 let g:ctrlp_mruf_max=500
 let g:ctrlp_follow_symlinks=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "美化状态栏
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "if want to use fancy,need to add font patch -> git clone
 "git://gist.github.com/1630581.git ~/.fonts/ttf-dejavu-powerline
 "let g:Powerline_symbols = 'fancy'
 let g:Powerline_symbols = 'unicode'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "括号匹配高亮
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
 let g:rbpt_max = 40
 let g:rbpt_loadcmd_toggle = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "可视化缩进
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:indent_guides_enable_on_vim_startup = 0  " 默认关闭
 let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
 let g:indent_guides_start_level 	  = 2  " 从第二层开始可视化显示缩进
 " \ig 打开/关闭 vim-indent-guides

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "标志无效空格
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 map <leader><space> :FixWhitespace<cr>	" \+space去掉末尾空格"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "宏定义补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"快速插入代码片段
 let g:UltiSnipsExpandTrigger = "<tab>"
 let g:UltiSnipsJumpForwardTrigger = "<tab>"
 let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
 "定义存放代码片段的文件夹.vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
 let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "快速加减注释
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let NERDSpaceDelims = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "自动括号补全
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 au FileType python let b:delimitMate_nesting_quotes = ['"']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "代码对齐
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "for code alignment
 " \bb    按=号对齐代码 [Tabular插件]
 nmap <leader>bb :Tab /=<CR>
 " \bn    自定义对齐    [Tabular插件]
 nmap <leader>bn :Tab /

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "静态代码分析
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "使用pyflakes,速度比pylint快
 let g:syntastic_error_symbol = '✗'	"set error or warning signs
 let g:syntastic_warning_symbol = '⚠'
 let g:syntastic_check_on_open=1
 let g:syntastic_enable_highlighting = 0
 "let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
 let g:syntastic_python_checkers=['pyflakes']
 "highlight SyntasticErrorSign guifg=white guibg=black

 let g:syntastic_cpp_include_dirs = ['/usr/include/']
 let g:syntastic_cpp_remove_include_errors = 1
 let g:syntastic_cpp_check_header = 1
 let g:syntastic_cpp_compiler = 'clang++'
 let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
 let g:syntastic_enable_balloons = 1	"whether to show balloons"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "快速跳转到TODO列表
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 map <leader>td <Plug>TaskList

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "快速跳转到TODO列表
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:vimwiki_w32_dir_enc     = 'utf-8' " 设置编码
 let g:vimwiki_use_mouse       = 1       " 使用鼠标映射
 let g:vimwiki_valid_html_tags ='a,img,b,i,s,u,sub,sup,br,hr,div,del,code,red,center,left,right,h1,h2,h3,h4,h5,h6,pre,script,style'
                                        " 声明可以在wiki里面使用的HTML标签
 "对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
 let g:vimwiki_camel_case = 0
 let blog = {}
 if g:isWIN
	 if g:atCompany
		 let blog.path            = 'D:/Files/Files/mysite/wiki/'
		 let blog.path_html       = 'D:/Files/Files/mysite/html/'
		 let blog.template_path   = 'D:/Files/Files/mysite/templates/'
		 let blog.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
	  else
		 let blog.path            = 'D:/Files/mysite/wiki/'
	       	 let blog.path_html       = 'D:/Files/mysite/html/'
		 let blog.template_path   = 'D:/Files/mysite/templates/'
		 let blog.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
	 endif
 else
	 let blog.path          = '~/mysite/wiki/'
  	 let blog.path_html     = '~/mysite/html/'
	 let blog.template_path = '~/mysite/templates/'
 endif
 let blog.template_default  = 'site'
 let blog.template_ext      = '.html'
 let blog.auto_export       = 1

 let g:vimwiki_list = [blog]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "多光标批量操作
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 "for mutil cursor
 let g:multi_cursor_use_default_mapping=0
 " Default mapping
 let g:multi_cursor_next_key='<C-m>'
 let g:multi_cursor_prev_key='<C-p>'
 let g:multi_cursor_skip_key='<C-x>'
 let g:multi_cursor_quit_key='<Esc>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "python语法高亮
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let python_highlight_all = 1
