.PHONY: install links

links:
	bash setup.sh

install:
	sudo apt install git tmux vim zsh stow bat tmuxp ranger w3m-img python3 python3-pip meld -y
	vim +PluginInstall +qall
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -n

all: install links
