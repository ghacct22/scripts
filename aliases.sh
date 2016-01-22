################################################################################
# Aliases in the scripts folder
################################################################################
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -GFh'
alias ll='ls -lhA'
alias lsl='ls -lhFA | less'
alias cd..='cd ..'
alias ..='cd ..'
alias please='sudo '
alias repache='apache2ctl restart'
alias rebash='. $BASHPATH'
alias vibash='vim $BASHPATH'
alias vivim='vim ~/.vimrc'
alias pull='git pull'
alias addall='git add .'
alias commit='git commit -m'
alias status='git status'
alias branches='git branch -va'
alias vitig='vim ~/.tigrc'
alias crap='$(thefuck $(fc -ln -1))' # A bash autocorrect utility, i didn't name it

# @commit: I think this doesn't keep a clean repo because it alters the files after commit.
alias maven='mvn clean compile assembly:single'
alias jarup='cd target && scp -rpC IAAMAuto-1.0SNAPSHOT-jar-with-dependencies.jar root@10.204.130.109:/srv/ftp/auto/auto-sspr-4.0.0.jar'

