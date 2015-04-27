# some more ls aliases
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -GFh'
alias ll='ls -lhA'
alias lsl='ls -lhFA | less'
alias cd..='cd ..'
alias ..='cd ..'
alias please='sudo '

# this uses a bash autocorrect utility, i didn't name it
alias crap='$(thefuck $(fc -ln -1))'

# make things simpler
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'
alias remove='sudo apt-get remove'