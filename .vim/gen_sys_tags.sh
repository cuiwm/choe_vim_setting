#! /bin/bash

#ctags  参数说明
 
#–fields指定tags的可用扩展域（extension fields），以包含到tags入口。
#i:继承信息Inheritance information
#a：类成员的访问控制信息 Access (or export) of class members
#S：常规签名信息，如原型或参数表 Signature of routine(e.g. prototype or parameter list) echofunc.vim 也使用此参数

#l: for echofunc.vim使用

#–extra=[+|-]flags
#指定是否包含某种扩展信息到tags入口。
#q：包含类成员信息（如c++,java,Eiffel)。但就算是C 语言的结构，也需要这两个参数设置才能获取成员信息。 #这样就能自动完成结构和类的成员了。

# --links=[yes|no] Indicate whether symbolic links should be followed [yes].

#--language-force=language Force all files to be interpreted using specified language.
#  --if0=[yes|no]
#       Should C code within #if 0 conditional branches be parsed [no]?
#  --<LANG>-kinds=[+|-]kinds
#       Enable/disable tag kinds for language <LANG>.
#  --langdef=name
#       Define a new language to be parsed with regular expressions.
#  --langmap=map(s)
#       Override default mapping of language to source file extension.
#  --language-force=language
#       Force all files to be interpreted using specified language.
#  --languages=[+|-]list
#       Restrict files scanned for tags to those mapped to langauges
#       specified in the comma-separated 'list'. The list can contain any
#       built-in or user-defined language [all].
#
#--file-scope=[yes|no]
#       Should tags scoped only for a single file (e.g. "static" tags
#       Behave as a filter, reading file names from standard input and
#       Specify string to print to stdout following the tags for each file
#       Force output of specified tag file format [2].
#       Override default mapping of language to source file extension.
#       Force all files to be interpreted using specified language.
#       Restrict files scanned for tags to those mapped to langauges

#因为 __THROW的宏定义让ctags不再认为此系列函数是函数。 还有attribute_pure ，nonull等属性，都需要忽略。
#如/usr/incluce/socket.h的socket系列函数,memset等很多关键函数都没有到tag里：^
#extern int listen (int __fd, int __n) __THROW;
#同理，如memcpy系列函数： 如/usr/include/string.h的
#extern int strcmp (__const char *__s1, __const char *__s2)      __THROW __attribute_pure__ __nonnull ((1, 2));

#如果需要#if 0里面的定义，可以–if0=yes来忽略 #if 0这样的定义

#最全版本
#ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q -R -f ~/.vim/systags /usr/include /usr/local/include


#这样.vim/systags里面是全的，但内容过多。一个函数定义的跳转，会有几十个候选。这时我们可以简化一下，将-R去掉，自己指定目录：
#brief 版本

# --langmap=c:+.h 有问题 可能与 ctags --list-maps=c++ 中的设置冲突 

ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --languages=c,c++ --links=yes --c-kinds=+px --c++-kinds=+px --fields=+iaSl --extra=+q  -f ~/.vim/systags /usr/include/* /usr/include/sys/* /usr/include/bits/*  /usr/include/netinet/* /usr/include/arpa/* 

#/usr/include/mysql/*


#还可以包含一些自己编程需要的路径。注意后面加*号。
#补充：tags有一个小技巧，在vimrc文件中set tags=tags; (注意有分号)，在vi中使用定位快捷键时会先在当前目录中查找tags文件，找不到的话，就会到父目录中找，依次类推，这样 你在编辑一个大工程时，只需要在最上一层建立一个tags文件，之后可以任意切换到工程子目录里去操作！

#$ctags --fields=+iaS --extra=+q -R -f ~/.vim/systags /usr/include /usr/local/include

#ctags -I __THROW --file-scope=yes --fields=+iaS --extra=+q --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p -R -f ~/.vim/systags /usr/include /usr/local/include
#
