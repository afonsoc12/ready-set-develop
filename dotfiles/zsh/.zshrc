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
plugins=(aliases alias-finder)
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ─────────── plugins:alias-finder ───────────
zstyle ':omz:plugins:alias-finder' autoload yes

# ─────────── Powerlevel10k Prompt ───────────
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/p10k.zsh.
source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

# ─────────── Aliases ───────────
source $ZDOTDIR/aliases.zsh
