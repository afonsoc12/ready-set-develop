# Ready, Set, Develop

[![Lint](https://github.com/afonsoc12/ready-set-develop/actions/workflows/lint.yml/badge.svg)](https://github.com/afonsoc12/ready-set-develop/actions/workflows/lint.yml)

**Ready, Set, Develop™** is an opinionated, reproducible workstation bootstrap system built with [Ansible](https://www.ansible.com/).


<p align="center"><img src="./.github/images/banner.png" alt="ready-set-develop" width="600"/></p>

Automate setting up macOS development machines from scratch and keep configuration consistent across computers — including dotfiles, tooling, system preferences, and development environments.

---
## About

Over the years, I've set up enough machines to understand that **manual setup doesn't scale**. I treat computers as disposable tools: everything important is backed up, and the environment itself should be reproducible on demand.

This repository codifies workstation setup with version-controlled configuration and repeatable, idempotent automation. In case Murphy's Law pays a visit, get productive in **minutes**, not days!

---
## Features

### 💻 Workstation Provisioning
- **Homebrew** installation and package management (formulae & casks)
- **Mac App Store** applications
- **Python environment** (pyenv, uv, plugins, pip packages)
- **Git** configuration and repository cloning
- **Zsh** shell setup with Oh My Zsh
- **Editor / IDE / terminal** configuration

### 📁 Dotfiles Management
- 📂 XDG Base Directory compliant (where possible)
- 🏠 Minimal `$HOME` clutter
- 🔗 Deploy via symlink or copy
- 🔧 Modular, reusable Ansible tasks
- ⚙️ Templated with Ansible
- 🔐 Secrets management via SOPS

**Pre-configured applications:**
- **zsh**, **Git**, **GnuPG**, **VS Code**, **k9s**, **rclone**, **rsync**, and more

### 🎨 macOS Customization
- 🔧 System defaults
- 📌 Dock layout and ordering
- 💡 Developer-focused tweaks

---
## Getting Started

### Prerequisites
- macOS 12 or later (tested on 26+)
- ~30 minutes
- Internet connection

### Quick Start ⚡

**Fastest way to get started** — one command:

```zsh
SOPS_AGE_KEY_FILE=<path-to-key> zsh -i <(curl -fsSL https://raw.githubusercontent.com/afonsoc12/ready-set-develop/master/bootstrap.sh)
```

**With encrypted config:**
```zsh
SOPS_AGE_KEY_FILE=<path-to-key> RSD_SOPS_FILE=config.sops.yml zsh -i <(curl -fsSL https://raw.githubusercontent.com/afonsoc12/ready-set-develop/master/bootstrap.sh)
```

The bootstrap script will:
- Install XCode Command Line Tools
- Clone the repository (to `~/.local/share/ready-set-develop`)
- Install Python packages and Ansible
- Install Ansible Galaxy packages
- Run the full playbook

---

### Step-by-Step Installation

##### 1️⃣ Install Command Line Tools

```zsh
xcode-select --install
```

Accept the license when prompted.

##### 2️⃣ Clone Repository

```zsh
git clone https://github.com/afonsoc12/ready-set-develop.git
cd ready-set-develop
```

##### 3️⃣ Install Ansible

```zsh
export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
/usr/bin/pip3 install --upgrade pip ansible
```

##### 4️⃣ Install Ansible Requirements

```zsh
ansible-galaxy install -r requirements.yml
```

##### 5️⃣ Run Playbook

```zsh
export SOPS_AGE_KEY_FILE=<path-to-your-age-key>
ansible-playbook main.yml --ask-become-pass

# Or with encrypted config
ansible-playbook main.yml -e sops_file=config.sops.yml --ask-become-pass
```

---

### Configuration Reference

#### Bootstrap Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `RSD_REPO_URL` | `https://github.com/afonsoc12/ready-set-develop.git` | Git repository URL |
| `RSD_REPO_DIR` | `$XDG_DATA_HOME/ready-set-develop` | Local clone path |
| `RSD_REPO_VERSION` | `master` | Branch, tag, or commit to checkout |
| `RSD_FORCE_REPO` | `false` | Re-clone if repository exists |
| `SOPS_AGE_KEY_FILE` | _(required)_ | Path to AGE key for SOPS decryption |
| `RSD_SOPS_FILE` | _(optional)_ | SOPS-encrypted config file path |
| `XDG_DATA_HOME` | `$HOME/.local/share` | Application data directory |
| `RSD_ANSIBLE_HOME` | `$XDG_DATA_HOME/ansible` | Ansible runtime directory |
| `PATH` | (modified) | Ensures homebrew & Python binaries are available |

---

## Running the Playbook

### Standard Execution

```zsh
ansible-playbook main.yml --ask-become-pass
```

### Custom Configuration

Override defaults with your own config:

```zsh
ansible-playbook main.yml -e @myconfig.yml --ask-become-pass
```

---

## Development

### Setup

This project uses [uv](https://docs.astral.sh/uv/) for Python dependency management.

```zsh
uv sync --dev
pre-commit install
source .venv/bin/activate
```

### Quality Checks

Before committing:

```zsh
pre-commit run --all-files

# Or individually:
yamllint .
ansible-lint .
ansible-playbook main.yml --syntax-check
```

---
## License

**Copyright © 2023–2026 [Afonso Costa](https://github.com/afonsoc12)**

Licensed under the Apache License 2.0. See the [LICENSE](./LICENSE) file for details.
