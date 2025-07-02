# Set aliases

source ~/.bin/funcs.sh

alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias ls='ls --color=auto -A'
alias ll='ls -alF'
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
alias pg='peco_ghq'
alias pgh='peco_hub'
alias rh='replace_by_history'
alias fzfe='find_and_edit'


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
