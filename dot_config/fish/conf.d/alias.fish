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

# jujutsu
alias jja="jj -r.."
alias jjs="jj status"
alias jjb="jj bookmark"
alias jjbl="jj bookmark list"
alias jjbd="jj bookmark delete"
alias jjbs="jj bookmark set"
alias jjbs-="jj bookmark set -r @-"
alias jjbm="jj bookmark move"
alias jjbt="jj bookmark track"
alias jjr="jj rebase"
alias jjn="jj new"
alias jjd="jj desc -m"
alias jjc="jj commit -m"
alias jje="jj edit"
alias jjdi="jj diff"
alias jjg="jj git"
alias jjgp="jj git push"
alias jjgf="jj git fetch"

#chezmoi
alias ch="chezmoi"
alias cha="chezmoi apply"
alias chc="chezmoi cd"

alias oc="opencode"

