# ~/.config/zsh/aliases.zsh
# This file defines shell aliases and environment variables for interactive Zsh shells.
# Grouped by category for clarity.

# ─────────── General ───────────
alias cdd="cd ~/Desktop"
alias cdh="cd ~"
command -v eza >/dev/null && alias v="eza -lah" || alias v="ls -lah"

# ─────────── Kubernetes ───────────
alias k="kubectl"
export do="--dry-run=client -oyaml"
export now="--grace-period=0 --force"

alias kn="kubectl config set-context --current --namespace"
alias ka="kubectl apply -f"
alias kc="kubectl create"
alias kr="kubectl run"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdebug="kubectl run --rm -i --restart=Never"
alias kubeseal="kubeseal --controller-name=sealed-secrets --controller-namespace=utils"
