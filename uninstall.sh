PREFIX="/usr/local"
MANPREFIX="$PREFIX/share/man/man1"

mkdir -p $MANPREFIX
mkdir -p $PREFIX/bin

echo "... installing bins to $PREFIX/bin"
rm -f $PREFIX/bin/git-cloc

echo "... installing man pages to $MANPREFIX"
rm -f $MANPREFIX/git-cloc.1