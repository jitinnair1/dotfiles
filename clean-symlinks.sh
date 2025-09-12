#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_FILE="$SCRIPT_DIR/$(hostname)_symlinks.txt"
DRY_RUN=0

if [[ "$1" == "--no" ]]; then
    DRY_RUN=1
    echo "Performing dry run - no files will be deleted..."
    echo
fi

find_target_symlinks() {
    local found_any=0
    echo "Dotfile symlinks and directories to be removed:"
    echo "=================================================="

    #home directory
    for file in .zshrc .zshrc-Darwin .zshrc-Linux .vimrc .tmux.confIRM .leptonrc .p10k.zsh; do
        if [[ -L "$HOME/$file" ]]; then
            echo "$HOME/$file -> $(readlink "$HOME/$file")"
            found_any=1
        elif [[ -f "$HOME/$file" ]]; then
            echo "$HOME/$file (regular file - will be removed)"
            found_any=1
        fi
    done

    #.vim/plugins.vim
    if [[ -L "$HOME/.vim/plugins.vim" ]]; then
        echo "$HOME/.vim/plugins.vim -> $(readlink "$HOME/.vim/plugins.vim")"
        found_any=1
    elif [[ -f "$HOME/.vim/plugins.vim" ]]; then
        echo "$HOME/.vim/plugins.vim (regular file - will be removed)"
        found_any=1
    fi

    #.config directories
    for config_dir in nvim alacritty ghostty; do
        if [[ -L "$HOME/.config/$config_dir" ]]; then
            echo "$HOME/.config/$config_dir/ -> $(readlink "$HOME/.config/$config_dir")"
            found_any=1
        elif [[ -d "$HOME/.config/$config_dir" ]]; then
            echo "$HOME/.config/$config_dir/ (directory - will be removed)"
            found_any=1
        fi
    done

    #zed
    if [[ -L "$HOME/.config/zed/settings.json" ]]; then
        echo "$HOME/.config/zed/settings.json -> $(readlink "$HOME/.config/zed/settings.json")"
        found_any=1
    elif [[ -f "$HOME/.config/zed/settings.json" ]]; then
        echo "$HOME/.config/zed/settings.json (regular file - will be removed)"
        found_any=1
    fi

    #find broken symlinks
    echo
    echo "Scanning for broken symlinks in ~ and ~/.config..."
    local broken_links=$(find "$HOME" -maxdepth 2 -type l -exec test ! -e {} \; -print 2>/dev/null)
    if [[ -n "$broken_links" ]]; then
        echo "Broken symlinks found:"
        echo "$broken_links" | sed 's/^/   /'
        found_any=1
    else
        echo "No broken symlinks found"
    fi

    if [[ $found_any -eq 0 ]]; then
        echo "No dotfile symlinks or files found to remove"
    fi

    return $found_any
}

create_backup() {
    echo "Creating backup of current symlinks..."

    #backup header
    {
        echo "=========================================="
        echo "Backup created: $(date '+%Y-%m-%d %H:%M:%S')"
        echo "Host: $(hostname)"
        echo "User: $(whoami)"
        echo "=========================================="
        echo
    } >> "$BACKUP_FILE"

    #append current symlinks to backup file
    find_target_symlinks >> "$BACKUP_FILE"

    {
        echo
        echo "------------------------------------------"
        echo
    } >> "$BACKUP_FILE"

    echo "Backup saved to: $BACKUP_FILE"
}

perform_cleanup() {
    echo "Starting cleanup process..."

    #individual dotfiles
    echo "   Removing dotfiles from home directory..."
    rm -f ~/.zshrc ~/.zshrc-Darwin ~/.zshrc-Linux ~/.vimrc ~/.tmux.conf ~/.lepton symlink .leptonrc ~/.p10k.zsh

    #vim plugins file
    echo "   Removing vim plugins file..."
    rm -f ~/.vim/plugins.vim

    #config directories
    echo "   Removing .config directories..."
    rm -rf ~/.config/nvim ~/.config/alacritty ~/.config/ghostty

    #zed
    echo "   Removing zed settings..."
    rm -f ~/.config/zed/settings.json

    #broken symlinks
    echo "   Cleaning up broken symlinks..."
    find "$HOME" -maxdepth 2 -type l -exec test ! -e {} \; -delete 2>/dev/null

    echo "Cleanup completed successfully!"
}

#script execution starts
echo "Dotfiles Cleanup Script"
echo "========================="
echo

#always show what would be affected
find_target_symlinks
found_items=$?

if [[ $found_items -eq 0 ]]; then
    echo "Nothing to clean up!"
    exit 0
fi

if [[ $DRY_RUN -eq 1 ]]; then
  echo
  echo "Dry run completed. Use './cleanup-old-links.sh' to perform actual cleanup."
  exit 1
fi

#confirmation
echo
read -p "Do you want to proceed with the symlink cleanup? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cleanup cancelled"
    exit 1
fi

# Create backup before cleanup
create_backup

# Perform the cleanup
perform_cleanup

echo
echo "Done!"

