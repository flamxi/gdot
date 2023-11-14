#!/bin/bash

# Check if Zsh is installed
if [ -z "$(command -v zsh)" ]; then
    echo "Zsh is not installed. Installing Zsh..."
    
    # Install Zsh (you may need to adjust the installation command based on your package manager)
    # For example, for Debian-based systems, you can use: sudo apt-get install zsh
    # For Red Hat-based systems, you can use: sudo yum install zsh
    # For macOS, you can use: brew install zsh
    # Adjust the command below based on your system's package manager.
    sudo apt-get install -y zsh
    
    # Check if installation was successful
    if [ $? -eq 0 ]; then
        echo "Zsh installed successfully."
    else
        echo "Error: Failed to install Zsh. Please install it manually."
        exit 1
    fi
fi

# Set Zsh as the default shell
echo "Setting Zsh as the default shell..."
chsh -s $(which zsh)

# Check if changing the default shell was successful
if [ $? -eq 0 ]; then
    echo "Zsh is now the default shell. Please restart your terminal."
else
    echo "Error: Failed to set Zsh as the default shell. Please set it manually."
fi

zshrc_path="$HOME/.zshrc"
relative_script_path="zsh/zshrc.zsh"

# Check if ~/.zshrc exists
if [ ! -f "$zshrc_path" ]; then
    # If it doesn't exist, create it
    touch "$zshrc_path"
fi

# Check if the source line already exists in ~/.zshrc
if ! grep -q "source $(pwd)/$relative_script_path" "$zshrc_path"; then
    # If it doesn't exist, add it at the beginning of the file
    echo "source $(pwd)/$relative_script_path" | cat - "$zshrc_path" > temp && mv temp "$zshrc_path"
fi

echo "Setup complete. ~/.zshrc has been configured to source $relative_script_path."

