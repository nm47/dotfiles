for dir in */ ; do
    # Remove trailing slash from directory name for cleaner symlink creation
    dir=${dir%/}
    # Check if the target already exists in ~/.config and skip if it does
    if [ ! -L "$HOME/.config/$dir" ] && [ ! -e "$HOME/.config/$dir" ]; then
        ln -s "$(pwd)/$dir" "$HOME/.config/$dir"
        echo "Linked $dir to ~/.config/$dir"
    else
        echo "$dir already exists in ~/.config, skipping..."
    fi
done
