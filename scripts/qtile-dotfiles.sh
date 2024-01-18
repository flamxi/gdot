if [ ! $mode == "dev" ]; then
    _installSymLink alacritty ~/.config/alacritty $DOTFILES_DIR/alacritty/ ~/.config
    _installSymLink nvim ~/.config/nvim $DOTFILES_DIR/nvim/ ~/.config
    _installSymLink qtile ~/.config/qtile $DOTFILES_DIR/qtile/ ~/.config 
    _installSymLink rofi ~/.config/rofi $DOTFILES_DIR/rofi/ ~/.config
    _installSymLink picom ~/.config/picom $DOTFILES_DIR/picom/ ~/.config
    _installSymLink polybar ~/.config/polybar $DOTFILES_DIR/polybar/ ~/.config
else
    echo $DOTFILES_DIR
    echo "Skipped: DEV MODE!"
fi
