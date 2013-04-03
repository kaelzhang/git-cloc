git-cloc(1)
===========

NAME
----

git-cloc - Count lines for code for git

SYNOPSIS
--------

git-cloc [<options>]

DESCRIPTION
-----------

Git-cloc helps to count the file changes, insertions and deletions of a specified git repo. 

You could also use it to traverse all git repos inside the current or an assigned directory and generate a summary.

OPTIONS
-------
--since <date>, --after <date>	
	The beginning date, "2012-01-01"

--until <date>, --before <date>
	The end date, "2012-02-01"

-c <path>, --cwd <path>
	Specify the current working directory
	
-r, --recursive
	Use this option, git-cloc will walk through the current working directory to find all git repos and analysis them
	
--recurse-depth
	The maximun depth git-cloc will traverse a directory into. Default to 10

--month <Y-M>
    The month which will limit the counting, "2013-03"

-o, --output
    The file path where standard output will redirect and write into
