# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ei="eza --icons --git"
alias ea="eza -a --icons --git"
alias ee="eza -aahl --icons --git"
alias et="eza -T -L 3 -a -I 'node_modules|.git|.cache' --icons"
alias eta="eza -T -a -I 'node_modules|.git|.cache' --color=always --icons | less -r"
alias ls=ei
alias Ls=ei
alias la=ea
alias ll=ee
alias lt=et
alias lta=eta

alias cl="clear"
alias l="clear && ls"
alias nv="nvim"
