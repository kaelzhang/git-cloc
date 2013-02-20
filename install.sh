# copy Git to where the rest of the Git scripts are found.
des="$(git --exec-path)/git-cloc"

cp git-cloc.sh "$des"

# avoid "Permission denied" error
chmod 755 "$des"