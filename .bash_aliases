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

function _peco_ghq() {
	cd $(ghq root)/$(ghq list | peco)
}

function _peco_hub() {
	hub browse $(ghq list | peco | cut -d "/" -f 2,3)
}

function _replace_by_history() {
  # fzf を使った、コマンド履歴検索
  local l
  l=$(HISTTIMEFORMAT='' history | sort -k1,1nr | sed -e 's/^[[:space:]]*[0-9]\+[[:space:]]*//' | awk '!a[$0]++{print}' | fzf --query "$READLINE_LINE")
  READLINE_LINE="$l"
  READLINE_POINT=${#l}
}

function _find_and_edit() {
  # fzf でファイルを検索して Visual Studio Code で開く
  fzf | xargs code
}


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
alias pg='_peco_ghq'
alias pgh='_peco_hub'
alias rh='_replace_by_history'
alias fzfe='_find_and_edit'


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
