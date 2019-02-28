# dotfiles
## Setup

### Bash
    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.bashrc > ~/.bashrc

### Git 
    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.gitconfig >~/.gitconfig
    
### Tmux
    apt install tmux
    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.tmux.conf > ~/.tmux.conf
    
### Vim
    apt install vim
    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.vimrc > ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall

### Pureline
    apt install fonts-powerline
    git clone https://github.com/chris-marsh/pureline.git  ~/pureline
    curl https://raw.githubusercontent.com/rafaelglikis/dotfiles/master/.pureline.conf > ~/.pureline.conf

