# ------------------------------------------------------
# Backup existing dotfiles
# ------------------------------------------------------

datets=$(date '+%Y%m%d%H%M%S')
if [ -d ~/dotfiles ] || [ -f ~/.bashrc ]; then

cat <<"EOF"
____             _                
| __ )  __ _  ___| | ___   _ _ __  
|  _ \ / _` |/ __| |/ / | | | '_ \ 
| |_) | (_| | (__|   <| |_| | |_) |
|____/ \__,_|\___|_|\_\\__,_| .__/ 
                            |_|    

EOF
    if [ -d ~/dotfiles ]; then
        echo "The script has detected an existing dotfiles folder and will try to create a backup into the folder ~/dotfiles-versions/backups/$datets"
    fi
    if [ -f ~/.bashrc ]; then
        echo "The script has detected an existing .bashrc file and will try to create a backup ~/dotfiles-versions/backups/$datets/.bashrc-old"
    fi
    echo ""
    while true; do
        read -p "Do you want to proceed? (Yy/Nn): " yn
        case $yn in
            [Yy]* )
                if [ ! -d ~/dotfiles-versions ]; then
                    mkdir ~/dotfiles-versions
                    echo "~/dotfiles-versions created."
                fi
                if [ ! -d ~/dotfiles-versions/backups ]; then
                    mkdir ~/dotfiles-versions/backups
                    echo "~/dotfiles-versions/backups created"
                fi
                if [ ! -d ~/dotfiles-versions/backups/$datets ]; then
                    mkdir ~/dotfiles-versions/backups/$datets
                    echo "~/dotfiles-versions/backups/$datets created"
                fi
                if [ -d ~/dotfiles ]; then
                    cp -r ~/dotfiles ~/dotfiles-versions/backups/$datets
                    echo "Backup of your current dotfiles in ~/dotfiles-versions/backups/$datets created."
                fi
                if [ -f ~/.bashrc ]; then
                    cp ~/.bashrc ~/dotfiles-versions/backups/$datets/.bashrc-old
                    echo "Existing .bashrc file found in homefolder. .bashrc-old created"
                fi
            break;;
            [Nn]* ) 
            break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
    echo ""
fi
