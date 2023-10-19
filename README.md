# Ready, Set, Develop

Ready, Set, Develop™ is a collection of automation scripts to streamline setting up new machines or to synchronising configs across computers, powered by [Ansible](https://ansible.com).

## Installation

1. Install Apple's Command Line Tools:

    ```bash
    xcode-select --install
    # Agree with Xcode's license
    ```

2. Install Ansible using the system Python:

     ```bash
     export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"
     sudo pip3 install --upgrade pip
     pip3 install ansible
     ```

3. Clone or download this repository

    ```bash
    git clone https://github.com/afonsoc12/ready-set-develop.git
    ```

4. Install Ansible requirements

    ```bash
    ansible-galaxy install -r requirements.yml
    ```

5. Run playbook

    ```bash
    ansible-playbook main.yml --ask-become-pass
    # Enter your macOS account password
    ```
