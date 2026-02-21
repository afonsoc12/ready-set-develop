#!/bin/zsh
set -euo pipefail

# -----------------------------
# Defaults
# -----------------------------
RSD_REPO_URL="${RSD_REPO_URL:-https://github.com/afonsoc12/ready-set-develop.git}"

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export RSD_ANSIBLE_HOME="${RSD_ANSIBLE_HOME:-$XDG_DATA_HOME/ansible}"

# Repo defaults
RSD_REPO_DIR="${RSD_REPO_DIR:-$XDG_DATA_HOME/ready-set-develop}"
RSD_REPO_VERSION="${RSD_REPO_VERSION:-master}"

export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"

# Optional SOPS file
RSD_SOPS_FILE="${RSD_SOPS_FILE:-}"

echo
echo "========================================"
echo "🚀 Ready, Set, Develop — bootstrap"
echo "========================================"
echo

# -----------------------------
# 1. Sanity checks
# -----------------------------
if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "❌ This bootstrap script is intended for macOS only."
  exit 1
fi
echo "----------------------------------------"

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
echo "----------------------------------------"

# -----------------------------
# 3. SOPS check
# -----------------------------
if [[ -z "${SOPS_AGE_KEY_FILE:-}" ]]; then
  echo "❌ SOPS_AGE_KEY_FILE is not set."
  echo "Export your AGE key file before running:"
  echo "  export SOPS_AGE_KEY_FILE=<PATH AGE KEY>"
  exit 1
fi

if [[ ! -f "$SOPS_AGE_KEY_FILE" ]]; then
  echo "❌ SOPS_AGE_KEY_FILE does not exist: $SOPS_AGE_KEY_FILE"
  exit 1
fi

echo "🔐 SOPS AGE key detected"
echo "----------------------------------------"

# -----------------------------
# 4. Ensure directories exist
# -----------------------------
echo "📁 Ensuring directories exist"
mkdir -p "$XDG_DATA_HOME" "$RSD_ANSIBLE_HOME"
echo "----------------------------------------"

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
echo "----------------------------------------"

# -----------------------------
# 6. Clone repository
# -----------------------------
if [[ -d "$RSD_REPO_DIR" && "${RSD_FORCE_REPO:-false}" == "true" ]]; then
  echo "⚠️ RSD_FORCE_REPO=true, removing existing repo: $RSD_REPO_DIR"
  rm -rf "$RSD_REPO_DIR"
fi

if [[ ! -d "$RSD_REPO_DIR" ]]; then
  echo "📥 Cloning ready-set-develop into: $RSD_REPO_DIR"
  git clone "$RSD_REPO_URL" "$RSD_REPO_DIR"
else
  echo "📂 Repository already exists: $RSD_REPO_DIR, pulling latest..."
  git -C "$RSD_REPO_DIR" pull
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
echo "----------------------------------------"

# -----------------------------
# 6.1 Show last commit info
# -----------------------------
last_commit_hash=$(git -C "$RSD_REPO_DIR" log -1 --pretty=format:%H)
last_commit_message=$(git -C "$RSD_REPO_DIR" log -1 --pretty=format:%s)
last_commit_date=$(git -C "$RSD_REPO_DIR" log -1 --pretty=format:%ad --date=iso)

repo_web_url=${RSD_REPO_URL%.git}
repo_web_url=${repo_web_url#git@github.com:}
repo_web_url=${repo_web_url#https://github.com/}
repo_web_url="https://github.com/$repo_web_url"

echo "🧾 Last commit: $last_commit_hash"
echo "  🔗 $repo_web_url/commit/$last_commit_hash"
echo "  🗨  $last_commit_message"
echo "  🕒 $last_commit_date"
echo "----------------------------------------"

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
# -----------------------------
echo "📚 Installing Ansible Galaxy requirements"
ansible-galaxy install -r requirements.yml
echo "----------------------------------------"

# -----------------------------
# 9. Run playbook
# -----------------------------
echo
echo "▶️  Running Ansible playbook"
echo

ANSIBLE_CMD="ansible-playbook main.yml --ask-become-pass"
[[ -n "$RSD_SOPS_FILE" ]] && ANSIBLE_CMD+=" -e sops_file=$RSD_SOPS_FILE"

# Append any extra flags passed to this script
if [[ $# -gt 0 ]]; then
  ANSIBLE_CMD+=" $@"
  echo "📋 Extra flags: $@"
fi

eval "$ANSIBLE_CMD"

echo
echo "========================================"
echo "🎉 Ready, Set, Develop completed successfully"
echo "You may want to restart your terminal or log out/in"
echo "========================================"
