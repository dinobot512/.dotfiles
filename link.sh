#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$HOME/.config"

# files in $HOME
ln -sfn "$DOTFILES/dino/.bashrc" "$HOME/.bashrc"
echo "linked all files in $HOME"

# files in $HOME/.config
for dir in "$DOTFILES/dino/.config/"*; do
  ln -sfn "$dir" "$HOME/.config/$(basename "$dir")"
done
echo "linked all files in $HOME/.config"

