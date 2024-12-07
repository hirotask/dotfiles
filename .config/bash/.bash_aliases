# Set aliases

function chrome(){
    "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe" $(wslpath -w $(realpath $1))
}

alias ls='eza'
alias ll='ls -abghHliS --icons'
alias la='ls -a'
alias rmdir="rm -rf"
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cd.='cd ./'
alias cd..='cd ../'
alias cd...='cd ../../'
alias reload='exec $SHELL -l'
alias pbcopy='xsel --clipboard --input'
alias chrome='chrome'
