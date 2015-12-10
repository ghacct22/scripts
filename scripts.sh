
# work Scripts
source $scriptsDir/work/scripts.sh
# Simulate OSX's pbcopy and pbpaste on other platforms
if [ ! $(uname -s) = "Darwin" ]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi
# Personal Scripts
source $scriptsDir/aliases.sh # comment out if you don't want
