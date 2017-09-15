#!/bin/bash
set -e
dotfilepath=`pwd`
pushd ~
for file in $(ls $dotfilepath)
do
	if [ -L .$file ]; then
		echo "Removing old symbolic link ~/.$file..."
		rm -v $file
	fi
	if [ -f .$file ]; then 
		mv .$file .$file.bak
	fi
	ln -sv $dotfilepath/$file .$file
done
rm -v .setup.sh
popd
