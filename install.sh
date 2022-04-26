set -eux

# git clone enviroment
rm -rf enviroment
git clone https://github.com/shellbacksq/enviroments.git

# oh-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

#vim
cp -f enviroments/.vimrc ~
https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
./nvim-linux64/bin/nvim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

wget https://npm.taobao.org/mirrors/node/v14.15.1/node-v14.15.1-linux-x64.tar.gz
tar -zxvf node-v14.15.1-linux-x64.tar.gz
ln -s ./node-v14.15.1-linux-x64/bin/npm /usr/local/bin/npm
ln -s ./node-v14.15.1-linux-x64/bin/node /usr/local/bin/node
