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

# Simulate OSX's pbcopy and pbpaste on other platforms
if [ ! $(uname -s) = "Darwin" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

alias minify='rm *.min.js; for f in *.js; do short=${f%.js}; uglifyjs $f > $short.min.js; done'
alias minall='for dir in .; do (minify && cd "$dir" && minall); done'