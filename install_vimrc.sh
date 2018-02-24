#########################################################################
# File Name: install.sh
# Author: andrew Choe
# mail: xgod@163.com
# Created Time: Fri 05 Jan 2018 10:41:57 AM CST
#########################################################################
#!/bin/bash
suffix=`date +%Y%m%d-%H%M%S`
bakfl=.vimrc.bak.${suffix}

if [ -f ${HOME}/.vimrc ] ; then
	echo "backup ${HOME}/.vimrc to ${HOME}/"${bakfl}
	cp -v ${HOME}/.vimrc ${HOME}/${bakfl}
fi

cp -v .vimrc  ${HOME}/.vimrc
cp -v cscope_maps.vim ${HOME}/
cp -rv .vim  ${HOME}/
