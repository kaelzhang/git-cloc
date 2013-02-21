# copy Git to where the rest of the Git scripts are found.
bin="$(git --exec-path)/git-cloc"
doc="$(git --man-path)/man1/git-cloc.1"

cp ./bin/git-cloc.sh "$bin"
cp ./man/git-cloc.1 "$doc"

# avoid "Permission denied" error
chmod 755 "$bin"