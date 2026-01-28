# ~/.zshrc
# Sourced by interactive shells only.
# Set up aliases, functions, key bindings, prompt, and interactive tool features.

# ─────────── Powerlevel10k Instant Prompt Cache ───────────
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ─────────── Oh My Zsh ───────────
export ZSH="$XDG_DATA_HOME/oh-my-zsh"
COMPLETION_WAITING_DOTS="true"
zstyle ':omz:update' frequency 15
<<<<<<< HEAD
<<<<<<< HEAD
plugins=(aliases alias-finder)
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ─────────── plugins:alias-finder ───────────
zstyle ':omz:plugins:alias-finder' autoload yes

<<<<<<< HEAD
# ─────────── Pure Prompt ───────────
=======
plugins=(git)

=======
plugins=(aliases alias-finder)
>>>>>>> 4dc2d0a (Dotfiles installation for gnupg)
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ─────────── plugins:alias-finder ───────────
zstyle ':omz:plugins:alias-finder' autoload yes

# ─────────── Pure Prompt ───────────
<<<<<<< HEAD
fpath+=("$(brew --prefix)/share/zsh/site-functions")
>>>>>>> c57576d (Merged dotfiles from afonsoc12/dotfiles)
=======
>>>>>>> 4dc2d0a (Dotfiles installation for gnupg)
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
<<<<<<< HEAD
=======
# ─────────── Powerlevel10k Prompt ───────────
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/p10k.zsh.
source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
>>>>>>> 0f5bfca (Added p10k, removed pure)

# ─────────── Aliases ───────────
source $ZDOTDIR/aliases.zsh
=======
>>>>>>> c57576d (Merged dotfiles from afonsoc12/dotfiles)
=======

# ─────────── Aliases ───────────
source $ZDOTDIR/aliases.zsh
>>>>>>> 4dc2d0a (Dotfiles installation for gnupg)
