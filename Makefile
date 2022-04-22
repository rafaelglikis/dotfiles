.PHONY: install

install:
	bash setup.sh
	sudo apt install python-is-python3 python3-pip git tmux vim curl zsh stow bat tmuxp ranger w3m-img python3 python3-pip autojump meld thefuck -y
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	-vim +PluginInstall +qall
	-sh -c "`curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh`" -n
	-git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	-git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
