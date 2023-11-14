if [ ! $mode == "dev" ]; then
    _installSymLink alacritty ~/.config/alacritty $DOTFILES_DIR/alacritty/ ~/.config
    _installSymLink nvim ~/.config/nvim $DOTFILES_DIR/nvim/ ~/.config
    _installSymLink qtile ~/.config/qtile $DOTFILES_DIR/qtile/ ~/.config 
else
    echo $DOTFILES_DIR
    echo "Skipped: DEV MODE!"
fi