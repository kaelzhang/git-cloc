#!/bin/bash

# flags
debug=1

# tools ##############################
debug()
{
    if [ -n "$debug" ]; then
        echo "$@" >&2
    fi
}

#overload arguments

# git cloc 
#   --since, --after    the beginning date, "2012-01-01"
#   --until,--before    the end date, "2012-02-01"
#   -u, --user          the author and user, "Kael". default(or "*") to all user. use -u instead of -a to avoid misunderstanding of "all"; 
#   -b, --branch        default to "master", if "*" will count lines of all branches without duplication
#   -r, --recursive     recursively search all sub directories of the specified working directory
#   -c, --cwd           cwd
after=
before=
author=
branch=master
recursive=
cwd=.

while [[ $# -gt 0 ]]; do
    opt="$1"
    shift
    case "$opt" in
        --since|--after)
            after="$1"; debug "after: $after"
            shift
            ;;

        --until|--before)
            before="$1"; debug "before: $before"
            shift
            ;;

        --author|--committer)
            author="$1"; debug "author: $author"
            shift
            ;;

        -b|--branch)
            branch="$1"; debug "branch: $branch"
            shift
            ;;

        -r|--recursive)
            recursive=1; debug "recursive: on"
            # no shift
            ;;

        -c|--cwd)
            cwd="$1"; debug "cwd: $cwd"
            shift
            ;;

        --)
            break
            ;;

        *)
            die "Unexpected option: $opt"
            ;;
    esac
done

# generate git log query
log_query="git log"

if [[ -n "$author" ]]; then
    log_query=`echo "$log_query --author $author"`
fi

if [[ -n "$after" ]]; then
    log_query=`echo "$log_query --after $after"`
fi

if [[ -n "$before" ]]; then
    log_query=`echo "$log_query --before $before"`
fi

if [[ -n "$branch" ]]; then
    : # log_query=`echo "$log_query --branches $branch"`
fi

debug "log_query: $log_query"


git_repos(){
    for file in $1/*
    do
        if [[ -d "$file" ]]; then
            if [[ -d "$file/.git" ]]; then
                # cloc $file
                debug "git repo found: $file"
            else
                git_repos $file
            fi

        # else
        #    echo $file
        fi
    done
}

cloc(){
    cd $1

    # %H commit
    commit_end=$(eval "$log_query --pretty=format:'%H' -1")
    commit_start_plus_one=$(eval "$log_query --pretty=format:'%H' --reverse -1")

    debug "from $commit_end to $commit_start_plus_one"
}


if [[ -n "$recursive" ]]; then
    git_repos $cwd
else
    if [[ -d "$cwd/.git" ]]; then
        cloc $cwd
    else
        # TODO:
        # support sub directories of a git repo
        # (or any of the parent directories)
        die "fatal: Not a git repository: .git"
    fi
fi


