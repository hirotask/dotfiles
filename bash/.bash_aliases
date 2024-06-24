# Set aliases
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias g='cd $(ghq root)/$(ghq list | peco)'
alias ls='exa'
alias ll='ls -abghHliS --icons'
alias la='ls -a'
alias cat='bat'
alias rmdir="rm -rf"
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cd.='cd ./'
alias cd..='cd ../'
alias cd...='cd ../../'
alias reload='exec $SHELL -l'
alias pbcopy='xsel --clipboard --input'
alias browser="$BROWSER --user-data-dir=$BROWSER_USER_DATA_DIR --start-maximized"
