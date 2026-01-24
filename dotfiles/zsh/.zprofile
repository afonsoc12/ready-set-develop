# ~/.zprofile
# Sourced only by login shells (before .zshrc).
# Use for PATH setup, environment prep, and login-time tool initialization.

# ─────────── PATH ───────────
export PATH="$XDG_BIN_HOME:$PATH"

# ─────────── Homebrew ───────────
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ─────────── Pyenv ───────────
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init --path)"           # login shell PATH prep
    [[ -o interactive ]] && eval "$(pyenv init -)"   # interactive features
fi

# ─────────── jEnv ───────────
if command -v jenv >/dev/null 2>&1; then
    export PATH="$HOME/.jenv/bin:$PATH"
    [[ -o interactive ]] && eval "$(jenv init -)"
fi
