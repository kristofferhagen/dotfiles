set -x EDITOR nvim
set -x TERMINAL alacritty
set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src

alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
