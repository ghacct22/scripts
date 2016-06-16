# requires fzf be installed
# https://github.com/junegunn/fzf
# https://coderwall.com/p/ba8afa/git-branch-fuzzy-search-checkout
#
# Basically this file is all about adding fzf functionality to command line
# Tried to make the function names descriptive and the aliases short, so that
# the functions can be tab completed to see what you want.

###############################################################################
#
#   Switches to selected branch
#
###############################################################################
fuzzy_switch() {
    local branches branch
    branches=$(git branch -a) &&
    branch=$(echo "$branches" | fzf +s +m -e) &&
    git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}

###############################################################################
#
#   Runs Context on selected branch on all defined repos
#
###############################################################################
fuzzy_switch_all() {
    local branches branch
    branches=$(git branch -a) &&
    branch=$(echo "$branches" | fzf +s +m -e) &&
    context $branch $branch $branch
}

###############################################################################
#
#   List and search commits, checkout selected
#
###############################################################################
fuzzy_checkout_commit() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

###############################################################################
#
#   List and search commits, show selected
#
###############################################################################
fuzzy_show_commit() {
  local out sha q
  while out=$(
      git log --decorate=short --graph --oneline --color=always |
      fzf --ansi --multi --no-sort --reverse --query="$q" --print-query); do
    q=$(head -1 <<< "$out")
    while read sha; do
      [ -n "$sha" ] && git show --color=always $sha | less -R
    done < <(sed '1d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
  done
}

###############################################################################
#
#   Searches through all files and files in subdirectories and opens it in vim
#
###############################################################################
fuzzy_file() {
    local file
    file=$(fzf --query="$1" --select-1 --exit-0)
    [ -n "$file" ] && ${EDITOR} "$file"
}

###############################################################################
#
#   Searches through all files and files in subdirectories and opens it in atom
#
###############################################################################
fuzzy_atom() {
    local file
    file=$(fzf --query="$1" --select-1 --exit-0)
    [ -n "$file" ] && atom "$file"
}

###############################################################################
#
#   Lists and changes to a directory in the current or sub directory
#
###############################################################################
fuzzy_cd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

###############################################################################
#
#   Fuzzy search from git toplevel
#
###############################################################################
fuzzy_git_cd() {
  local top=`git rev-parse --show-toplevel`
  cd $top
  fuzzy_cd
}

###############################################################################
#
#   Fuzzy search from git toplevel
#
###############################################################################
fuzzy_git_cd_file() {
    local top=`git rev-parse --show-toplevel`
    cd $top
    fuzzy_cd_to_file
}

###############################################################################
#
#   Fuzzy open from git toplevel
#
###############################################################################
fuzzy_git_file() {
    local top=`git rev-parse --show-toplevel`
    cd $top
    fuzzy_file
}

###############################################################################
#
#   Fuzzy atom open from git toplevel
#
###############################################################################
fuzzy_git_file_atom() {
    local top=`git rev-parse --show-toplevel`
    cd $top
    fuzzy_atom
}

###############################################################################
#
#   Includes hidden folders
#
###############################################################################
fuzzy_cd_all() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) &&
  cd "$dir"
}

###############################################################################
#
#   Lists all directories from ~ and switches to one from that
#
###############################################################################
fuzzy_cd_root() {
  local dir
  cd
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

###############################################################################
#
#   Lists all directories from ~ including hidden directories
#
###############################################################################
fuzzy_cd_root_all() {
  local dir
  cd
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) &&
  cd "$dir"
}

###############################################################################
#
#   cd into the directory of the selected file
#
###############################################################################
fuzzy_cd_to_file() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

###############################################################################
#
#   Allows fzf to write to the shell, allowing selections to be edited
#
###############################################################################
write_to_cmd() {
  perl -e '$TIOCSTI = 0x5412; $l = <STDIN>; $lc = $ARGV[0] eq "-run" ? "\n" : ""; $l =~ s/\s*$/$lc/; map { ioctl STDOUT, $TIOCSTI, $_; } split "", $l;' -- $1
}

###############################################################################
#
#   lists the command history of the shell
#
###############################################################################
fuzzy_command_history() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | write_to_cmd -run
}

###############################################################################
#
#   Lists the command history of the shell but allow the command to be edited
#
###############################################################################
fuzzy_command_history_editable() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | write_to_cmd
}

###############################################################################
#
#   Lists running processes and kills the selected one
#
###############################################################################
fuzzy_kill_process() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

###############################################################################
#
#   Lists changed files from git status to stage
#
###############################################################################
fuzzy_git_add() {
  local changes file
  changes=$(git diff --name-only) &&
  file=$(echo "$changes" | fzf --tac +s +m -e) &&
  git add $(echo "$file")
}

fuzzy_git_unstage() {
    local changes file
    changes=$(git diff --cached --name-only) &&
    file=$(echo "$changes" | fzf --tac +s +m -e) &&
    git unstage $(echo "$file")
}
