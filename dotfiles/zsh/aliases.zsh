# ~/.config/zsh/aliases.zsh
# This file defines shell aliases and environment variables for interactive Zsh shells.
# Grouped by category for clarity.

# ─────────── General ───────────
alias cdd="cd ~/Desktop"
alias cdh="cd ~"
command -v eza >/dev/null && alias v="eza -lah" || alias v="ls -lah"

<<<<<<< HEAD
<<<<<<< HEAD
# ─────────── Tools ───────────
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

=======
>>>>>>> c57576d (Merged dotfiles from afonsoc12/dotfiles)
=======
# ─────────── Tools ───────────
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

>>>>>>> 4dc2d0a (Dotfiles installation for gnupg)
# ─────────── Kubernetes ───────────
alias k="kubectl"
export do="--dry-run=client -oyaml"
export now="--grace-period=0 --force"
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> c57576d (Merged dotfiles from afonsoc12/dotfiles)
=======
>>>>>>> 4dc2d0a (Dotfiles installation for gnupg)
alias kn="kubectl config set-context --current --namespace"
alias ka="kubectl apply -f"
alias kc="kubectl create"
alias kr="kubectl run"
alias kg="kubectl get"
alias kd="kubectl describe"
<<<<<<< HEAD
<<<<<<< HEAD
alias kdel="kubectl delete"
alias kdebug="kubectl run --rm -i --restart=Never"
alias hi="helm install --update"
alias hdel="helm install --update"

# ─────────── Docker ───────────
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dcd="docker compose down"

# ─────────── Git ───────────"
alias g="git"
alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gls="gl --show-signature"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gpl="git pull"
alias gst="git stash"
alias gsta="git stash apply"
gcm() { git commit -m "$*"; }
gcmp() { gcm "$@" && git push ; }
=======
alias kdebug="kubectl run --rm -i --restart=Never"
alias kubeseal="kubeseal --controller-name=sealed-secrets --controller-namespace=utils"
>>>>>>> c57576d (Merged dotfiles from afonsoc12/dotfiles)
=======
alias kdel="kubectl delete"
alias kdebug="kubectl run --rm -i --restart=Never"
alias hi="helm install --update"
alias hdel="helm install --update"

# ─────────── Docker ───────────
alias d="docker"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcud="docker compose up -d"
alias dcd="docker compose down"

# ─────────── Git ───────────"
alias g="git"
alias gs="git status"
alias ga="git add"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gpl="git pull"
alias gst="git stash"
alias gsta="git stash apply"
gc() { git commit -m "$*"; }
gcmp() { gcm "$@" && git push ; }
>>>>>>> 4dc2d0a (Dotfiles installation for gnupg)
