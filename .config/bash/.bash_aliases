# Set aliases

function trash() {
    NOWDATE=`date  +"%y%m%d-%H%M%S"`

    if [ ! -d ~/.trash/$NOWDATE ];then
      mkdir -p ~/.trash/$NOWDATE
    fi

    while [ "$1" != "" ];do
        if [ "${1:0:1}" != "-" ];then
            mv "$1" ~/.trash/$NOWDATE && echo "mv "$1" ~/.trash/$NOWDATE"
        fi
        shift
    done
}

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias lal='ls -al'
alias rm='trash'
alias rmdir="rm -rf"
alias cp='cp -i'
alias mv='mv -i'
alias cd.='cd ./'
alias cd..='cd ../'
alias cd...='cd ../../'
alias reload='exec $SHELL -l'
alias pbcopy='xsel --clipboard --input'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
