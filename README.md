# Ready, Set, Develop

[![CI](https://github.com/afonsoc12/ready-set-develop/actions/workflows/ci.yml/badge.svg)](https://github.com/afonsoc12/ready-set-develop/actions/workflows/ci.yml)

Ready, Set, Develop™ is a collection of automation scripts to streamline setting up new machines (almost) from scratch or to synchronising configs across computers, powered by [Ansible](https://ansible.com).

## Motivation

Throughout my journey as a human being, I've setup enough servers and computers to ignite a profound appreciation for automation. I treat all my machines like trusty tools, but I'm not one to rely entirely on them.
In case Murphy's Law pays a visit, I take comfort in knowing my data is backed up, and I can bounce back in no time.

Now, this repository? It's all about automating setting up my personal computers and synchronise configurations across them, so that I have the same dev environment across computers.

## Features

- dotfiles setup ([afonsoc12/dotfiles](https://github.com/afonsoc12/dotfiles))
- Install homebrew and packages (formulae and casks)
- Mac App Store apps
- Python environment (pyenv, it's plugins and pip packages)
- git configuration and git clone
- macOS defaults configuration
- macOS Dock icons setup and order
- [Oh My Zsh](https://ohmyz.sh/) installation
- Configure code editors/IDEs/terminal


## Installation (virgin machine)

1. Install Apple's Command Line Tools:

    ```bash
    xcode-select --install
    # Agree with Xcode's license
    ```

2. Setup environment variables:

    ```shell
    export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
    export ANSIBLE_HOME="$HOME/.local/share/ansible"
    ```

3. Install Ansible using the system Python:

     ```bash
     sudo pip3 install --upgrade pip
     pip3 install ansible
     ```

4. Clone or download this repository

    ```bash
    git clone https://github.com/afonsoc12/ready-set-develop.git
    ```

5. Install Ansible requirements

    ```bash
    ansible-galaxy install -r requirements.yml
    ```

6. Run playbook

    ```bash
    ansible-playbook main.yml --ask-become-pass --ask-vault-password
    # Enter your macOS account password
    ```

> Note: Alternatively, the Ansible Vault password file can be passed by the environment variable
`ANSIBLE_VAULT_PASSWORD_FILE`. However, since this is likely not in the new machine, it will be
prompted at runtime.

## Usage

By default, the playbook will look for a `config.yml` variables file in the root of the repository. It contains my default settings for most of my machine.
However, since some of these cannot be shared, they are encrypted with [ansible-vault](https://docs.ansible.com/ansible/latest/vault_guide/index.html).

To override these, you can either replace the `config.yml` with the contents of `config.default.yml` or append the argument `-e myconfig.yml` to `ansible-playbook` command, pointing to your new config file.

### Extra Tasks

These extras tasks that can be placed in `extra_tasks/`, will be executed after all roles in the playbook, without any particular order.
To skip all roles and jump straight to the extra tasks, the flag `--tags extra` can be added to the playbook.
This folder is excluded in `.gitignore`. This is where I specify a few tasks that are only specific to one machine, if any.

### Potential Problems

- Issues with docker plugins not linked: [GitHub Issue](https://github.com/docker/for-mac/issues/6569#issuecomment-1312244210)

## Roles Overview

> TODO


## Testing

This repo uses [GitHub Actions](https://github.com/afonsoc12/ready-set-develop/actions) for CI. This workflow runs linting and integration tests against macOS 12 and 13. I cannot guarantee this will work in Linux, and it will definitely not work in windows.

Linting and tests overview:
- yamllint
- ansible-lint
- ansible's `--syntax-check`
- ansible-playbook with default vars
- ansible-playbook with vars from `test/config.yml`
- [Idempotence](https://en.wikipedia.org/wiki/Idempotence) test

## Credits

Copyright 2023 Afonso Costa

Licensed under the Apache License, Version 2.0 (the "License")

Thanks to Jeff Geerling for two excellent books: [Ansible for DevOps](https://www.ansiblefordevops.com) and [Ansible for Kubernetes](https://www.ansibleforkubernetes.com). Also, for unknowingly allowing me to borrow some pieces from [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook). The perks of [OSS](https://en.wikipedia.org/wiki/Open-source_software)!

