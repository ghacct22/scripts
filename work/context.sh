# paths
# sta='/home/stephen.smith/insidesales/sta'
# atom=''
# qb='/home/stephen.smith/insidesales/qb/src'
# release='release/train/may21'
# Config options moved to context.Config
line='======================================================================================'

out_formatted(){
    echo $line
    echo "$1"
    echo $line
}

# git checkout command
co(){
    out_formatted "Checking out $1"
    git checkout $1

    out_formatted "Running git pull"
    git pull

    out_formatted "Running composer install"
    composer install

    out_formatted "Running submodule update"
    git submodule update
    git st
}

#deploy to sf
deploy(){
    co $1

    out_formatted "Running ant sfDeploy"
    ant sfDeploy
}

description_text(){
    echo $line
    echo "Finished context switch"
    echo "SalesTeamAutomation :: $sta_repo"
    echo "Querybuilder        :: $atom_repo"
    echo "Atom                :: $qb_repo"
    echo $line
}

# run them all
context(){
    src=`pwd`
    sta_repo=$1
    qb_repo=$2
    atom_repo=$3

    description_text

    out_formatted "STA: Changing directory to $sta"
    if [$sta == '']; then
        out_formatted "STA directory not defined"
    else
        cd $sta
        echo `pwd`
        co $sta_repo
    fi
    
    out_formatted "Atom: Changing directory to $atom"
    if [$atom == '']; then
        out_formatted "Atom directory not defined"
    else
        cd $atom
        echo `pwd`
        co $atom_repo
    fi

    out_formatted "QB: changing directory to $qb"
    if [$qb == '']; then
        out_formatted "Querybuilder directory is not defined."
    else
        cd $qb
        echo `pwd`
        deploy $qb_repo
    fi

    description_text
    cd $src   
}


