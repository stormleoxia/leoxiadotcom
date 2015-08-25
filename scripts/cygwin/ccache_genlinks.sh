#!/bin/sh

#Generate sh files in /usr/lib/ccache in the same way debian/Ubuntu installs ccache
# All you need then is add an export PATH=/usr/lib/ccache:$PATH in bashrc or the like
# and you'll benefit from ccache features

dir=.

cd /usr/bin

files=$(\
	find $dir -maxdepth 1 -name "*g++.*"; \
	find $dir -maxdepth 1 -name "*gcc.*"; \
	find $dir -maxdepth 1 -name "*g++-4*"; \
	find $dir -maxdepth 1 -name "*gcc-4*" \
)

cd /usr/lib/ccache

for compiler in $files
do
  echo "#!/bin/sh" > $compiler
  echo >> $compiler
  echo "ccache /usr/bin/$compiler"' $@'  >> $compiler
done
