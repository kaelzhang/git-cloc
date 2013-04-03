PREFIX="/usr/local"
MANPREFIX="$PREFIX/share/man/man1"

mkdir -p $MANPREFIX
mkdir -p $PREFIX/bin

echo "... uninstalling bins"
rm -f $PREFIX/bin/git-cloc

echo "... uninstalling man pages"
rm -f $MANPREFIX/git-cloc.1