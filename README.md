# dotfiles
## Setup

### Bash

    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.bashrc > ~/.bashrc

### Git 

    apt install git
    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.gitconfig >~/.gitconfig
    
### Tmux

    apt install tmux
    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.tmux.conf > ~/.tmux.conf
    
### Vim

    apt install vim
    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.vimrc > ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

### Zsh
    apt install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.zshrc > ~/.zshrc
    
