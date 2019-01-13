"======================================================="
"                        常规                           "
"======================================================="


"是否兼容VI，compatible为兼容，nocompatible为不完全兼容 
""如果设置为compatible，则tab将不会变成空格 
set nocompatible 
source $VIMRUNTIME/vimrc_example.vim 
source $VIMRUNTIME/mswin.vim 
"设置鼠标运行模式为WINDOWS模式 
behave mswin 
"设置行号
set nu
"自动语法高亮 
syntax on 
"默认缩进4个空格 
set shiftwidth=4 
"使用tab时 tab空格数 
set softtabstop=4
"tab 代表4个空格 
set tabstop=4
"使用空格替换tab
set expandtab


"======================================================="
"                      vundle插件                       "
"======================================================="

set nocompatible
filetype on
 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" github 仓库中的插件 "
Plugin 'VundleVim/Vundle.vim'

" vim-airline配置:优化vim界面"
Plugin 'vim-airline/vim-airline'
" airline设置
let g:airline#extensions#tabline#enabled = 1
" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>
" 映射<leader>num到num buffer
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

" vim-scripts 中的插件 "
" Plugin 'taglist.vim'
" ctags 配置:F3快捷键显示程序中的各种tags，包括变量和函数等。
" map <F3> :TlistToggle<CR>
" let Tlist_Use_Right_Window=1
" let Tlist_Show_One_File=1
" let Tlist_Exit_OnlyWindow=1
" let Tlist_WinWidt=25

Plugin 'The-NERD-tree'
" NERDTree 配置:F2快捷键显示当前目录树
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25
" 打开 Vim 时自动打开NERDTree目录
" autocmd vimenter * NERDTree
" 用快捷键ctrl+n切换NEADTree目录的开关
" map <C-n> :NERDTreeToggle<CR>

Plugin 'indentLine.vim'
Plugin 'delimitMate.vim'


" 自动补全,无效弃用
" Bundle 'Valloric/YouCompleteMe'





" markdown插件
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
" previm是一个预览Markdown的插件，支持实时更新
" 同时安装了open-browser.vim这个插件，就不用再配置相关参数，直接在编辑Markdown文本时，使用:PrevimOpen就可以预览文本了，并且修改保存后可以实时更新预览
" Plugin 'kannokanno/previm'
" Plugin 'tyru/open-browser.vim'

" vim-colorschemes是一个支持各种颜色主题的插件，方便配置
Plugin 'flazz/vim-colorschemes'




call vundle#end()

"======================================================="
"                 自动添加头部注释                      "
"======================================================="
" 使用热键<F4>自动加入头部
map <F4> ms:call AddAuthor()<cr>'S'

function AddAuthor()
    let n=1
    while n < 11
            let line = getline(n)
            if line=~'[#]*\s*\*\s*\S*Last\s*modified\s*:\s*\S*.*$'
                call UpdateTitle()
                return
            endif
    let n = n + 1
    endwhile
    if &filetype == 'sh'    
        call AddTitleForShell()
    elseif &filetype == 'python'
        call AddTitleForPython()
    else
        call AddTitleForC()
    endif
endfunction

" add comment for Python
function AddTitleForPython()
    call append(0,"#!/usr/bin/env python")
    call append(1,"#coding:utf-8")
    call append(2,"")
    call append(3,"# **********************************************************")
    call append(4,"# * Author        : Wi1s0n030")
    call append(5,"# * Email         : 961290465@qq.com")
    call append(6,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(8,"# * Filename      : ".expand("%:t"))
    call append(9,"# * Description   : ")
    call append(10,"# **********************************************************")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

" add conment for shell
function AddTitleForShell()
    call append(0,"#!/bin/bash")
    call append(1,"# **********************************************************")
    call append(2,"# * Author        : Wi1s0n030")
    call append(3,"# * Email         : 961290465@qq.com")
    call append(4,"# * Create time   : ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"# * Last modified : ".strftime("%Y-%m-%d %H:%M"))
    call append(6,"# * Filename      : ".expand("%:t"))
    call append(7,"# * Description   : ")
    call append(8,"# **********************************************************")
endfunction


