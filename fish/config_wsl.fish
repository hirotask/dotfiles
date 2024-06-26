# Set date format
set -g theme_display_date yes
set -g theme_date_format "+%F %H:%M"

# display branch name
set -g theme_display_git_master_branch yes

# dont use legacy keybindings
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 0

# Customize title bar
set -g theme_title_display_user no
set -g theme_title_display_process yes
set -g theme_title_display_path no

# Adding PATH
## Add cargo
set -gx RUSTUP_HOME $HOME/.rustup
set -gx CARGO_HOME $HOME/.cargo
fish_add_path $CARGO_HOME/bin

## Add aws
set -gx AWS /usr/local/bin/aws
fish_add_path $AWS

## Add go
set -gx GOPATH $HOME/go
fish_add_path $GOPATH/bin

set -gx BROWSER "/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe"
set -gx BROWSER_USER_DATA_DIR "/mnt/c/Users/systemi/AppData/Local/Google/Chrome/User\ Data/Default"

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
alias trans="deepl translate --to JA $1"
