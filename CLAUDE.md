# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository that manages configuration files for various development tools and desktop environments. The repository uses symbolic links to deploy configuration files from the repository to their expected locations in the home directory.

## Setup and Installation

### Initial Setup
```sh
git clone https://github.com/rafaelglikis/dotfiles.git
cd dotfiles
sudo ./setup.sh
```

### Full Installation with Dependencies
```sh
make install
```

The `make install` command will:
- Run the setup script to create symbolic links
- Install essential packages (python3, tmux, vim, zsh, bat, ranger, etc.)
- Install Vim plugins via Vundle
- Install Oh My Zsh with syntax highlighting and autosuggestions plugins

## Architecture

### Core Components
- **setup.sh**: Main deployment script that creates symbolic links for all configuration files
- **Makefile**: Provides `make install` command for full system setup including package installation
- **Configuration directories**: Each tool has its own directory containing dotfiles

### Supported Tools and Environments
- **Shell**: zsh (with Oh My Zsh), bash
- **Editor**: vim (with .vimrc and .ideavimrc for IntelliJ)
- **Terminal multiplexer**: tmux
- **File manager**: ranger
- **Desktop environment**: Hyprland, i3
- **Development tools**: git, lazydocker, lazygit
- **Container platform**: Docker with custom aliases for specific projects

### Symbolic Link Strategy
The setup script finds all files in each configuration directory and creates symbolic links in the home directory, preserving the directory structure but removing the top-level directory name from the path.

## Key Configuration Features

### ZSH Configuration
- Uses Oh My Zsh with robbyrussell theme
- Includes extensive plugin suite (git, docker, kubernetes, syntax highlighting)
- Custom aliases for kubernetes (`k`, `kgp`, `kns`, etc.)
- Docker Compose aliases for specific development environments
- Utility functions for log tailing and continuous command execution

### Development Workflow Aliases
- `vf`: Open file with vim using fzf selection
- `copy-branch`/`cb`: Copy current git branch to clipboard  
- `lzd`: Launch lazydocker
- Kubernetes shortcuts for common operations
- Docker environment aliases for specific project setups

## Environment Dependencies
- Requires zsh, vim, tmux, git, curl
- Optional but recommended: bat, ranger, fzf, autojump, zoxide
- Kubernetes tools: kubectl, kubens, kubectx
- Container tools: docker, docker-compose, lazydocker