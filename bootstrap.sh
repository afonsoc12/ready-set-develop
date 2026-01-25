#!/bin/zsh
set -euo pipefail

# -----------------------------
# Configuration
# -----------------------------
REPO_URL="https://github.com/afonsoc12/ready-set-develop.git"

# XDG defaults
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export ANSIBLE_HOME="$XDG_DATA_HOME/ansible"

REPO_DIR="$XDG_DATA_HOME/ready-set-develop"

# Python user bin (3.*)
export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"

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
  echo
  echo "Export your AGE key file before running:"
  echo "  export SOPS_AGE_KEY_FILE=<PATH AGE KEY>"
  echo
  exit 1
fi

if [[ ! -f "$SOPS_AGE_KEY_FILE" ]]; then
  echo "❌ SOPS_AGE_KEY_FILE does not exist:"
  echo "  $SOPS_AGE_KEY_FILE"
  exit 1
fi

echo "🔐 SOPS AGE key detected"

# -----------------------------
# 4. Ensure directories exist
# -----------------------------
echo "📁 Ensuring directories exist"

mkdir -p \
  "$XDG_DATA_HOME" \
  "$ANSIBLE_HOME"

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
# -----------------------------
echo "📚 Installing Ansible Galaxy requirements"
ansible-galaxy install -r requirements.yml

# -----------------------------
# 8. Run playbook
# -----------------------------
echo
echo "▶️  Running Ansible playbook"
echo

ansible-playbook main.yml --ask-become-pass -v


echo
echo "🎉 Ready, Set, Develop completed successfully"
echo "You may want to restart your terminal or log out/in"
