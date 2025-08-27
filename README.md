# Dotfiles Management with Bare Git Repository

A clean, elegant approach to managing your dotfiles using a bare Git repository. No symlinks, no extra tooling—just pure Git magic.

## What is this?

I found this method quite some time ago, but with the fear of the link going broke and to maintain my own version of it, i made this repo. It uses a bare Git repository stored in a "side" folder (like `~/.cfg`) with a special alias to track your configuration files directly in your home directory.

## Advantages

- ✅ No extra tooling required
- ✅ No symlinks to manage
- ✅ Files tracked with version control
- ✅ Different branches for different computers
- ✅ Easy replication on new installations
- ✅ Works with your existing Git workflow

## Quick Start

### Setting up from scratch

```bash
# Initialize bare repository
git init --bare $HOME/.cfg

# Create the config alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Hide untracked files
config config --local status.showUntrackedFiles no

# Add alias to your shell profile
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

### Adding files

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc  
config commit -m "Add bashrc"
config push
```

## Installation on a New System

### Prerequisites

1. Add the alias to your shell profile:
```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

2. Make sure your source repository ignores the `.cfg` folder:
```bash
echo ".cfg" >> .gitignore
```

### Clone and Setup

```bash
# Clone your dotfiles as a bare repository
git clone --bare <your-repo-url> $HOME/.cfg

# Define the alias in current shell
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Checkout the files
config checkout
```

If checkout fails due to existing files, back them up:
```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

Then retry checkout and configure:
```bash
config checkout
config config --local status.showUntrackedFiles no
```

## Daily Usage

Use `config` instead of `git` for all operations:

```bash
# Check status
config status

# Add new files
config add .tmux.conf

# Commit changes
config commit -m "Update tmux config"

# Push to remote
config push

# Pull updates
config pull
```

## Tips

- Use different branches for different machines/environments
- Keep your repository public or private based on the sensitivity of configs
- Consider using `.gitignore` to exclude sensitive files
- The `.cfg` folder stays hidden and won't interfere with other Git repos

## How it Works

The magic is in the Git alias that points to a bare repository in `~/.cfg` while using your home directory as the working tree. This allows Git to track files in your home directory without creating a `.git` folder that would interfere with other repositories.

---

*Based on the technique from a [Hacker News thread](https://news.ycombinator.com/item?id=11071754)*
