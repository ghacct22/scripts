#~/bin/bash

currentpath=`pwd`
systemOS=$1

if [ "$systemOS" == "mac" ]; then 
    echo "You are running on OSX"
    if [ -f ~/.bash_profile ]; then
        mv ~/.bash_profile ~/.bash_profile.old
        echo "Moving .bash_profile to .bash_profile.old"
        echo "Linking .bash_profile"
        ln -s $currentpath/bashrc $HOME/.bash_profile
    fi
elif [ "$systemOS" == "win" ] || [ "$systemOs" == "linux" ]; then
    if [ -f ~/.bashrc ]; then
        mv ~/.bashrc ~/.bashrc.old
        echo "Moving .bashrc to .bashrc.old"
        echo "Linking bashrc"
        ln -s $currentpath/bashrc $HOME/.bashrc
    fi
else
    echo "No OS specified"
fi

if [ -f ~/.git-prompt.sh ]; then
    echo "Git prompt already present"
else
    echo "Linking git-prompt"
    ln -s $currentpath/.git-prompt.sh $HOME/.git-prompt.sh
fi

if [ -f ~/.git-completion.bash ]; then
    echo "git completion already installed"
else
    echo "Linking git completion"
    ln -s $currentpath/.git-completion.bash $HOME/.git-completion.bash
fi
