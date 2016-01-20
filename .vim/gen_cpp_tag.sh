#########################################################################
# File Name: gene_cpp_tag.sh
# Author: xgod
# mail: xgod@163.com
# Created Time: 2015年11月18日 星期三 10时32分33秒
#########################################################################
#!/bin/bash
#ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpptags cpp_src
#支持echofunc.vim 需要参数--fields=+lS
ctags -R --c++-kinds=+px --fields=+iaSl --extra=+q --language-force=C++ -f cpptags cpp_src
#in Vim 
#set tags+=/mypath/cpptags
