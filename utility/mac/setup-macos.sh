# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# execute vim plug installation
vim -c 'PlugInstall' -c 'qa!'
