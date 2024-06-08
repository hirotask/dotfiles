# Set aliases
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
alias vim='nvim'
alias g='cd $(ghq root)/$(ghq list | peco)'
alias ls='exa'
alias ll='ls -abghHliS'
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

# Set date format
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"

# display branch name
set -g theme_display_git_master_branch yes

# Customize title bar
set -g theme_title_display_user no
set -g theme_title_display_process yes
set -g theme_title_display_path no

# Setup ssh-agent
eval (ssh-agent -c)
ssh-add /home/hiroto/.ssh/id_ed25519

# Adding PATH
set -gx RUSTUP_HOME $HOME/.rustup
set -gx CARGO_HOME $HOME/.cargo
fish_add_path $CARGO_HOME/bin
