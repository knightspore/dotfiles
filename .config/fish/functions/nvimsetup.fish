function nvimsetup --wraps='ln -s ~/.vimrc ~/.config/nvim/init.vim' --description 'alias nvimsetup=ln -s ~/.vimrc ~/.config/nvim/init.vim'
  ln -s ~/.vimrc ~/.config/nvim/init.vim $argv; 
end
