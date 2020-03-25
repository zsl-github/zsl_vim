"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This is plug config
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自动下载插件
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" solarized 主题
Plug 'altercation/vim-colors-solarized'

" 对接符颜色区分显示
Plug 'luochen1990/rainbow'

" 模糊搜索插件
Plug 'Yggdroot/LeaderF'

" 文件数插件
Plug 'scrooloose/nerdtree'

" ctags控制插件
Plug 'ludovicchabant/vim-gutentags'

" YCM 插件
Plug 'ycm-core/YouCompleteMe'

call plug#end()


"""""""""""""""""""""""""""""""""rainbow config begin"""""""""""""""""""""""""
"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1
"""""""""""""""""""""""""""""""""rainbow config end"""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""LeaderF config begin"""""""""""""""""""""""""
" set popup model
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'
" 显示当前目录文件
let g:Lf_ShortcutF = '<c-p>'
" 当前窗口打开的文件
let g:Lf_ShortcutB = '<c-b>'
" 显示最近打开文件
noremap <leader>p :LeaderfMru<cr>
" 显示函数列表
noremap <leader>d :LeaderfFunction!<cr>

let g:Lf_StlSeparator= {'left': '', 'right': '', 'font': ''}
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}


"""""""""""""""""""""""""""""""""LeaderF config end"""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""nerdtree config begin"""""""""""""""""""""""""
" 打开文件目录树的快捷键
map <leader>h :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""nerdtree config end"""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""vim-gutentags config begin"""""""""""""""""""""""""
" gutentags 搜索工程目录标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root']
" 所生成的数据文件的名称,单配set tags使用
let g:gutentags_ctags_tagfile = '.tags' 
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 参数 
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就创建
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags,'p')
endif
"""""""""""""""""""""""""""""""""vim-gutentags config end"""""""""""""""""""""""""

"let g:solarized_termcolors=256
