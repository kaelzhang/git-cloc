PREFIX="/usr/local"
MANPREFIX="$PREFIX/share/man/man1"

mkdir -p $MANPREFIX
mkdir -p $PREFIX/bin

echo "... installing bins to $PREFIX/bin"
cp -f bin/git-cloc $DESTDIR$PREFIX/bin
@chmod 755 $PREFIX/bin/git-cloc

echo "... installing man pages to $MANPREFIX"
cp -f man/git-cloc.1 $MANPREFIX