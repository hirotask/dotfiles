# Set aliases

alias g='cd $(ghq root)/$(ghq list | peco)'
alias ls='lsd'
alias ll='ls -al'
alias la='ls -a'
alias lt='ls --tree'
alias cat='bat'
alias rmdir="rm -rf"
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias cd.='cd ./'
alias cd..='cd ../'
alias cd...='cd ../../'
alias reload='exec $SHELL -l'

# Set date format
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"

# display branch nameß
set -g theme_display_git_master_branch yes

# Customize title bar
set -g theme_title_display_user no
set -g theme_title_display_process yes
set -g theme_title_display_path no

