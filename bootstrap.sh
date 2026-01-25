#!/bin/zsh
set -euo pipefail

# -----------------------------
<<<<<<< HEAD
# Defaults
# -----------------------------
RSD_REPO_URL="${RSD_REPO_URL:-https://github.com/afonsoc12/ready-set-develop.git}"

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export RSD_ANSIBLE_HOME="${RSD_ANSIBLE_HOME:-$XDG_DATA_HOME/ansible}"

# Repo defaults
RSD_REPO_DIR="${RSD_REPO_DIR:-$XDG_DATA_HOME/ready-set-develop}"

export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"

# Optional SOPS file
RSD_SOPS_FILE="${RSD_SOPS_FILE:-}"

=======
# Configuration
# -----------------------------
REPO_URL="https://github.com/afonsoc12/ready-set-develop.git"

# XDG defaults
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"

REPO_DIR="$XDG_DATA_HOME/ready-set-develop"

# Python user bin (3.*)
export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"

>>>>>>> a7efc97 (Add bootstrap script, license and updated readme)
echo
echo "🚀 Ready, Set, Develop — bootstrap"
echo

# -----------------------------
# 1. Sanity checks
# -----------------------------
if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "❌ This bootstrap script is intended for macOS only."
  exit 1
fi

# -----------------------------
# 2. Command Line Tools
# -----------------------------
if ! xcode-select -p >/dev/null 2>&1; then
  echo "🔧 Installing Apple Command Line Tools..."
  xcode-select --install
  echo
  echo "⚠️  Complete the installation and re-run this script."
  exit 1
else
  echo "✅ Command Line Tools installed"
fi

# -----------------------------
# 3. SOPS check
# -----------------------------
if [[ -z "${SOPS_AGE_KEY_FILE:-}" ]]; then
  echo "❌ SOPS_AGE_KEY_FILE is not set."
<<<<<<< HEAD
  echo "Export your AGE key file before running:"
  echo "  export SOPS_AGE_KEY_FILE=<PATH AGE KEY>"
=======
  echo
  echo "Export your AGE key file before running:"
  echo "  export SOPS_AGE_KEY_FILE=<PATH AGE KEY>"
  echo
>>>>>>> a7efc97 (Add bootstrap script, license and updated readme)
  exit 1
fi

if [[ ! -f "$SOPS_AGE_KEY_FILE" ]]; then
<<<<<<< HEAD
  echo "❌ SOPS_AGE_KEY_FILE does not exist: $SOPS_AGE_KEY_FILE"
=======
  echo "❌ SOPS_AGE_KEY_FILE does not exist:"
  echo "  $SOPS_AGE_KEY_FILE"
>>>>>>> a7efc97 (Add bootstrap script, license and updated readme)
  exit 1
fi

echo "🔐 SOPS AGE key detected"

# -----------------------------
# 4. Ensure directories exist
# -----------------------------
echo "📁 Ensuring directories exist"
<<<<<<< HEAD
mkdir -p "$XDG_DATA_HOME" "$RSD_ANSIBLE_HOME"
=======

mkdir -p \
  "$XDG_DATA_HOME" \
  "$ANSIBLE_HOME"
>>>>>>> a7efc97 (Add bootstrap script, license and updated readme)

# -----------------------------
# 5. Install Ansible (user)
# -----------------------------
if ! command -v ansible >/dev/null 2>&1; then
  echo "📦 Installing Ansible (user install)"
  /usr/bin/pip3 install --upgrade pip
  /usr/bin/pip3 install ansible
else
  echo "✅ Ansible already installed"
fi

# -----------------------------
# 6. Clone repository
# -----------------------------
<<<<<<< HEAD
if [[ -d "$RSD_REPO_DIR" && "${RSD_FORCE_REPO:-false}" == "true" ]]; then
  echo "⚠️ RSD_FORCE_REPO=true, removing existing repo: $RSD_REPO_DIR"
  rm -rf "$RSD_REPO_DIR"
fi

if [[ ! -d "$RSD_REPO_DIR" ]]; then
  echo "📥 Cloning ready-set-develop into: $RSD_REPO_DIR"
  git clone "$RSD_REPO_URL" "$RSD_REPO_DIR"
else
  echo "📂 Repository already exists: $RSD_REPO_DIR"
fi

cd "$RSD_REPO_DIR"

# -----------------------------
# Checkout version if specified
# -----------------------------
if [[ -n "${RSD_REPO_VERSION:-}" ]]; then
  echo "🔀 Checking out version: $RSD_REPO_VERSION"
  git fetch --all
  git checkout "$RSD_REPO_VERSION"
fi

# -----------------------------
# 7. SOPS file (inside repo)
# -----------------------------
if [[ -n "$RSD_SOPS_FILE" ]]; then
  if [[ ! -f "$RSD_SOPS_FILE" ]]; then
    echo "❌ Provided SOPS file does not exist inside repo: $RSD_SOPS_FILE"
    exit 1
  fi
  echo "🗝 Using SOPS file: $RSD_SOPS_FILE"
fi

# -----------------------------
# 8. Install Ansible requirements
=======
if [[ ! -d "$REPO_DIR" ]]; then
  echo "📥 Cloning ready-set-develop into:"
  echo "   $REPO_DIR"
  git clone "$REPO_URL" "$REPO_DIR"
else
  echo "📂 Repository already exists:"
  echo "   $REPO_DIR"
fi

cd "$REPO_DIR"

# -----------------------------
# 7. Install Ansible requirements
>>>>>>> a7efc97 (Add bootstrap script, license and updated readme)
# -----------------------------
echo "📚 Installing Ansible Galaxy requirements"
ansible-galaxy install -r requirements.yml

# -----------------------------
<<<<<<< HEAD
# 9. Run playbook
=======
# 8. Run playbook
>>>>>>> a7efc97 (Add bootstrap script, license and updated readme)
# -----------------------------
echo
echo "▶️  Running Ansible playbook"
echo

<<<<<<< HEAD
ANSIBLE_CMD="ansible-playbook main.yml --ask-become-pass -v"
[[ -n "$RSD_SOPS_FILE" ]] && ANSIBLE_CMD+=" -e sops_file=$RSD_SOPS_FILE"

eval "$ANSIBLE_CMD"
=======
ansible-playbook main.yml --ask-become-pass -v

>>>>>>> a7efc97 (Add bootstrap script, license and updated readme)

echo
echo "🎉 Ready, Set, Develop completed successfully"
echo "You may want to restart your terminal or log out/in"
