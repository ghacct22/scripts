# requires fzf be installed
# https://github.com/junegunn/fzf
# https://coderwall.com/p/ba8afa/git-branch-fuzzy-search-checkout
switch() {
    local branches branch
    branches=$(git branch -a) &&
    branch=$(echo "$branches" | fzf +s +m -e) &&
    git checkout $(echo "$branch" | sed "s:.* remotes/origin/::" | sed "s:.* ::")
}

switchAll() {
    local branches branch
    branches=$(git branch -a) &&
    branch=$(echo "$branches" | fzf +s +m -e) &&
    context $branch $branch $branch
}

alias grit='git fetch --all && switch && prep && ant sfDeploy' # grit will start an interactive grep on all branches