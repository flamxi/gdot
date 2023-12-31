#!/bin/zsh
# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000 
	setopt inc_append_history # To save every command before it is executed 
	setopt share_history # setopt inc_append_history
  	ZSH_PATH=~/repos/flamxi/dotfiles/zsh

  autoload bashcompinit
  bashcompinit
script="${(%):-%N}"
script_dir=`dirname "$script"`

# Aliases
#	alias v="vim -p"
	mkdir -p /tmp/log
	
	# This is currently causing problems (fails when you run it anywhere that isn't a git project's root directory)
	# alias vs="v `git status --porcelain | sed -ne 's/^ M //p'`"

# Settings
	export VISUAL=vim

source ${ZSH_PATH}/plugins/fixls.zsh

#Functions
	# Loop a command and show the output in vim
	loop() {
		echo ":cq to quit\n" > /tmp/log/output 
		fc -ln -1 > /tmp/log/program
		while true; do
			cat /tmp/log/program >> /tmp/log/output ;
			$(cat /tmp/log/program) |& tee -a /tmp/log/output ;
			echo '\n' >> /tmp/log/output
			vim + /tmp/log/output || break;
			rm -rf /tmp/log/output
		done;
	}

	# Custom cd
	c() {
		cd $1;
		ls;
	}
	alias cd="c"

# For vim mappings: 
	stty -ixon

source $ZSH_PATH/plugins/oh-my-zsh/lib/history.zsh
source $ZSH_PATH/plugins/oh-my-zsh/lib/key-bindings.zsh
source $ZSH_PATH/plugins/oh-my-zsh/lib/completion.zsh
source $ZSH_PATH/plugins/vi-mode.plugin.zsh
source $ZSH_PATH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PATH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PATH/keybindings.sh

# Fix for arrow-key searching
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
	autoload -U up-line-or-beginning-search
	zle -N up-line-or-beginning-search
	bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
	autoload -U down-line-or-beginning-search
	zle -N down-line-or-beginning-search
	bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source $ZSH_PATH/prompt.sh
