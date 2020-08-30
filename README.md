# Dotfiles and system configuration

## Installation

```sh
git clone --bare <url> $HOME/.dotfiles
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dots checkout
dots config --local status.showUntrackedFiles no
```
