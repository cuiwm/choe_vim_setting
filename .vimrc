"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version: 
"       5.0 - 29/05/12 15:43:36
"
" Blog_post: 
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler "右下角显示光标的状态行

set showcmd
" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  set selection=exclusive
  set selectmode=mouse,key
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
" set matchtime = 5
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable "syntax on ??

"set nohls

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8 "set enc=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
" After new setting take effect, each time you press TAB key, it will automatically replaced by 4 SPACE and do indentation.
" You can still insert real Tabs as [Ctrl]-V [Tab].
" If you open an unwell indentation source code file, you can press "gg=G", all TABs will be replaced by 4 SPACE. 

" 1 tab == 4 spaces
set tabstop=4 "set ts=4
set shiftwidth=4 "set sw=4

" 现在你再打开vim，按下tab，再按backspace，你会发现tab出来的缩进只需要backspace一次就能删除，这足以说明这段空白是tab；然后你再次修改vimrc，并加入：
" set expandtab
" 或
" set et
" 再次打开vim，你会发现tab出来的空白已经变成空格了，而这个时候一个tab就真正成为4个空格了，而不仅仅是4个空格的缩进距离。这才是我们真正想要的。
set expandtab

"另一个方法是使用vim的modeline，当别人打开这个文件的时候会自动使用相同的配置。什么是modeline呢？就是往文件里面写入特定的行，当vim打开这个文件的时候会自动读取这一行的参数配置并调整自己的设置到这个配置，例如你可能经常会看到在有些源码的文件末尾会出现这样的行：
"# vim:et:ts=4:sw=4:
"这个就是modeline。当其他人的vimrc里打开了set modeline的时候，就会自动读入这个配置。
"更多的信息请参考vim :help auto-setting  和:help modeline

" Be smart when using tabs ;)
set smarttab

" Linebreak on 500 characters
set lbr
set tw=500

"set autoindent
set ai "Auto indent

"set smartindent
set si "Smart indent

"使用C样式的缩进
set cindent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
" autocmd BufReadPost *
"      \ if line("'\"") > 0 && line("'\"") <= line("$") |
"      \   exe "normal! g`\"" |
"      \ endif
" Remember info about open buffers on close
" set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
"set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ag and put the cursor in the right position
map <leader>g :Ag 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ag, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"#如果你的vim有使用echofunc插件来显示函数的参数定义, 那么在使用ctags生产索引文件时需要使用如下附加参数: ctags -R --fields=+lS
"ctags默认生成的索引文件只包含了对C语言的语法分析, 如果你需要ctags支持对C++语法分析. 需要使用下面的命令: 　　ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
"如果你在C语言编写的代码中使用上面提到的C++命令生成tags, 那么你将惊讶的发现, 当你希望通过ctags跳转到光标下函数定义的地方的时候, vim总是跳转到这个函数定义的地方, "原因是ctags的C++命令增加了额外的语法分析以便支持C++更加复杂的语法结构, 这种额外的语法分析用在C语言中的时候就会出现跳转默认定位到函数声明的地方.


"------ctags setting--------------
"         ctags --sort=yes  --languages=c,c++ --links=yes --c-kinds=+px --c++-kinds=+px --fields=+liaSKz --extra=+q -R -f tags /cui/work/im/trunk/
map <F5> :!ctags --sort=yes  --languages=c,c++ --links=no --c-kinds=+lpx --c++-kinds=+lpx --fields=+liaSKz --extra=+q -R -f /cui/work/im/trunk/tags /cui/work/im/trunk/<CR><CR>:TlistUpdate<CR>
imap <F5> <ESC>:!ctags --sort=yes  --languages=c,c++ --links=no --c-kinds=+lpx --c++-kinds=+lpx --fields=+liaSKz --extra=+q -R -f /cui/work/im/trunk/tags /cui/work/im/trunk/<CR><CR>:TlistUpdate<CR>

" vi -t tag
" :ts (ts 助记字 :tagslist)
" Ctrl + ]  g+ ] Ctrl + T
"set autochdir表示自动切换目录的意思, set tags=tags;表示自动查找, 这两句同时设置vim即可实现递归的tags查找, 注意: set tags=tags;这一句的最后有一个分号, 这个分号是不能省略的. vim的配置文件使用的是vim自己的脚步语言. 这里是少数几个在行尾需要使用分号的地方之一.
set autochdir 
set tags=tags;

"search multi dirs
"如果你有多个tags需要使用,也可以在同一个语句中加入多个路径,每个路径用","隔开
"set tags=./tags,./../tags,./../../tags

set tags+=~/.vim/cpptags
set tags+=~/.vim/systags
set tags+=/cui/work/im/tags

"set shortmess=atI
"设置粘贴模式格式无错位现象
"set paste
"set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
"set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
"set fileencoding=utf-8

set nu
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  

set foldenable "允许折叠
"set foldmethod=manual "set fdm=manual
set foldmethod=syntax
set foldlevel=100 " 启动vim时不要自动折叠代码

set modeline "自动载入模式行
"自动插入modeline
func! AppendModeline()
let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
\ &tabstop, &shiftwidth, &textwidth)
let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
call append(line("$"), l:modeline)
endfunc
"按\ml,自动插入modeline
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

"空格展开折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

autocmd filetype python setlocal et sta sw=4 sts=4

set nocompatible "关闭vi兼容

set cscopequickfix=s-,c-,d-,i-,t-,e-
source ~/cscope_maps.vim

cs add /cui/work/im/trunk/cscope.out /cui/work/im/trunk

"Tlist
"let Tlist_Auto_Open=1
let Tlist_Ctags_Cmd='/usr/bin/ctags'
"按名称排序
let Tlist_Sort_Type="name"
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"压缩方式显示
let Tlist_Compart_Format=1
"不要关闭其它文件的tags
let Tlist_File_Fold_AutoClose=0
"不要显示折叠树
let Tlist_Enable_Fold_Column=0

let g:bufExplorerMaxHeight=30

"Winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWidth=30
nmap wm :WMToggle<cr>
"miniBufexp
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 
"let g:miniBufExplorerMoreThanOne=0
imap <F3> <C-X><C-O>
imap <F2> <C-X><C-I>

"还需确认在 vimrc 中开启了 filetype 选项，不然 OmniComplete 无法自动识别 C/C++ 文件类型进行补全。
"在插入模式编辑 C/C++ 源文件时按下 . 或 -> 或 ::，或者手动按下 Ctrl+X Ctrl+O 后就会弹出自动补全窗口，此时可以用 Ctrl+N 和 Ctrl+P 上下移动光标进行选择。
set completeopt=menu,menuone " 关掉智能补全时的预览窗口

"set completeopt=menuone,menu,longest
"set completeopt=menuone,menu,longest,preview
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::

let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)

let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files

let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std", "_GLIBCXX_STD"]

let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

"" 自动关闭补全窗口
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 

"也许你也已经注意到了一个问题，那就是「自动补全窗口的配色非常之丑」，Vim 自带的几个配色方案中只有两三种配色改掉了自动补全窗口丑陋的紫色，其它的基本上都是很逆天的用灰色表示当前选中项、紫色表示其他项。
"
"要改变自动补全窗口的配色可以在 vimrc 中加上：
"
"highlight Pmenu    guibg=darkgrey  guifg=black 
"highlight PmenuSel guibg=lightgrey guifg=black
"Pmenu 是所有项的配色，PmenuSel 是选中项的配色，guibg 和 guifg 分别对应背景色和前景色
"
hi Pmenu        cterm=none ctermfg=White     ctermbg=Black
hi PmenuSel     cterm=none ctermfg=Black     ctermbg=DarkGreen
hi PmenuSbar    cterm=none ctermfg=none      ctermbg=Green
hi PmenuThumb   cterm=none ctermfg=DarkGreen ctermbg=DarkGreen

":help :highlight

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
"定义函数SetTitle，自动插入文件头 
func SetTitle() 
"如果文件类型为.sh文件 
   if &filetype == 'sh' 
     call setline(1,"\#########################################################################") 
     call append(line("."), "\# File Name: ".expand("%")) 
     call append(line(".")+1, "\# Author: andrew Choe") 
     call append(line(".")+2, "\# mail: xgod@163.com") 
     call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
     call append(line(".")+4,"\#########################################################################") 
    call append(line(".")+5, "\#!/bin/bash") 
    call append(line(".")+6, "") 
  else 
     call setline(1, "/*************************************************************************") 
     call append(line("."), "    > File Name: ".expand("%")) 
     call append(line(".")+1, "    > Author: xgod") 
     call append(line(".")+2, "    > Mail: xgod@163.com ") 
     call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
               call append(line(".")+4, " ************************************************************************/") 
     call append(line(".")+5, "")
  endif
  if &filetype == 'cpp'
     call append(line(".")+6, "#include <iostream>")
     call append(line(".")+7, "using namespace std;")
     call append(line(".")+8, "")
     call append(line(".")+9, "int main(int argc, char* argv[])")
     call append(line(".")+10, "{")
     call append(line(".")+11, "")
     call append(line(".")+12, "return 0;")
     call append(line(".")+13, "}")
   endif
  if &filetype == 'c'
    call append(line(".")+6, "#include <stdio.h>")
    call append(line(".")+7, "")
    call append(line(".")+8, "")
    call append(line(".")+9, "int main(int argc, char* argv[])")
    call append(line(".")+10, "{")
    call append(line(".")+11, "")
    call append(line(".")+12, "return 0;")
    call append(line(".")+13, "}")
   endif
   "新建文件后，自动定位到文件末尾
   "autocmd BufNewFile * normal G
   autocmd BufNewFile,BufRead   *.c,*.h     1;/^{
endfunc 
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"F2去空行
"nnoremap <F2> :g/^\s*$/d<CR>
imap <F2> <Esc>:w<CR>
map <F2> :w<CR>
imap <F9> <Esc>:!make -j8<CR>
map <F9> :!make -j8<CR>
"解释<C-R>是插入某个寄存器的值 ，=是表达式寄存器的意思。所以这句话是在命令行插入expand("<cword>")的值，也就是当前光标下的单词。其实在<C-R>后再输入<C-W>就是当前光标下单词的意思，<C-R><C-W>与<C-R>=expand("<cword>")应该是等效的。
"nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
map <F6> :!man -a <C-R><C-W><CR>
