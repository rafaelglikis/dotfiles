.PHONY: install

install:
	bash setup.sh
	sudo apt install git tmux vim zsh stow bat tmuxp ranger w3m-img python3 python3-pip meld -y
	-git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	-vim +PluginInstall +qall
	-sh -c "`curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh`" -n
