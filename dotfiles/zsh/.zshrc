# ~/.zshrc
# Sourced by interactive shells only.
# Set up aliases, functions, key bindings, prompt, and interactive tool features.

# ─────────── Oh My Zsh ───────────
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
COMPLETION_WAITING_DOTS="true"
zstyle ':omz:update' frequency 15
<<<<<<< HEAD
plugins=(aliases alias-finder)
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ─────────── plugins:alias-finder ───────────
zstyle ':omz:plugins:alias-finder' autoload yes

# ─────────── Pure Prompt ───────────
=======
plugins=(git)

[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ─────────── Pure Prompt ───────────
fpath+=("$(brew --prefix)/share/zsh/site-functions")
>>>>>>> c57576d (Merged dotfiles from afonsoc12/dotfiles)
autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:execution_time color yellow
zstyle :prompt:pure:path color yellow
zstyle :prompt:pure:git:arrow color cyan
zstyle :prompt:pure:git:stash color cyan
zstyle :prompt:pure:git:branch color 242
zstyle :prompt:pure:git:branch:cached color red
zstyle :prompt:pure:git:action color 242
zstyle :prompt:pure:git:dirty color 218
zstyle :prompt:pure:host color 242
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success color green
zstyle :prompt:pure:prompt:continuation color cyan
zstyle :prompt:pure:suspended_jobs color red
zstyle :prompt:pure:user color 242
zstyle :prompt:pure:user:root color default
zstyle :prompt:pure:virtualenv show yes
<<<<<<< HEAD

# ─────────── Aliases ───────────
source $ZDOTDIR/aliases.zsh
=======
>>>>>>> c57576d (Merged dotfiles from afonsoc12/dotfiles)
