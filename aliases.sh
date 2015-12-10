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
alias rebash='. $bash'
alias vibash='vim $bash'
alias vivim='vim ~/.vimrc'
alias pull='git pull'
alias addall='git add .'
alias commit='git commit -m'
alias status='git status'
alias vitig='vim ~/.tigrc'
alias crap='$(thefuck $(fc -ln -1))' # A bash autocorrect utility, i didn't name it
alias generalAliases="cat $scriptsDir/aliases.sh"
alias workAliases="cat $scriptsDir/work/aliases.sh"
alias gritAliases="cat $scriptsDir/work/gritAlias.sh"
alias aliases="generalAliases && gritAliases"
