alias repache='apache2ctl restart'
alias rebash='. $bash'
alias vibash='vim $bash'
alias vivim='vim ~/.vimrc'
alias isdc='cd $workDir'
alias querybuilder='cd $workDir/qb/src'
alias sslan='ssh root@stephensmith.lan'
alias arcbranch='arc branch blah'
alias blah='arc branch blah'
alias land='arc land'
alias add='sudo add-apt-repository '

alias prep='git pull && git submodule update && composer install'
alias qbant='cd $qb && ant sfDeploy'
alias pull='git pull'
alias vitig='vim ~/.tigrc'
alias phplog='less +F /var/log/apache2/php_error.log'

# add other aliases with context $sta $qb $atom
# Since the creation of the grit command, these are mostly superfluous
alias release='context $release $release $release'
alias apr23="context $apr23 $apr23 $apr23"
alias may21='context $may21 $may21 $may21'
alias m14995='context $m14995 $release $release'
alias cti='context $cti $cti $release'
alias burp='context $burp $release $release'
