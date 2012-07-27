#!/bin/sh
default_bundles=(
  ack.vim
  browser-refresh.vim
  gist-vim
  jade.vim
  json.vim
  html-autoclose.vim
  lustyjuggler
  markdown-preview.vim
  nerdcommenter
  nerdtree
  processing.vim
  rvm.vim
  snipmate.vim
  statusline
  supertab
  syntastic
  tabular
  taglist.vim
  vim-coffee-script
  vim-cucumber
  vim-fugitive
  vim-haml
  vim-javascript
  vim-markdown
  vim-rails
  vim-ruby
  vim-stylus
  vim-unimpaired
  vim-surround
  yankring
)

full_path=`pwd`

echo "Creating directories..."
mkdir -p $full_path/home/.vim/bundle
mkdir -p $full_path/home/.vim/snippets
mkdir -p $full_path/home/.vim/tmp/swap
mkdir -p $full_path/home/.vim/tmp/yankring
mkdir -p $full_path/home/.vim/spell

echo "Setting up default vimrc.local..."
cp $full_path/templates/.vimrc.local.example $full_path/home/.vimrc.local

echo "Initializing submodules..."
git submodule init
git submodule update
git submodule foreach git checkout master
git submodule foreach git clean -f

echo "Symlinking default bundles..."
for i in "${default_bundles[@]}"; do
  ln -sv $full_path/home/.vim/bundle_storage/$i $full_path/home/.vim/bundle/$i
done


echo "Symlinking default snippets..."
for f in `ls $full_path/home/.vim/snippets_storage/`; do
  ln -sv $full_path/home/.vim/snippets_storage/$f $full_path/home/.vim/snippets/$f
done

# Make an additional symlink of css for scss
ln -sv $full_path/home/.vim/snippets_storage/css.snippets $full_path/home/.vim/snippets/scss.snippets

# echo "Symlinking to home directory"
# for f in `ls $full_path/home/`; do
  # ln -sv $full_path/home/$f $HOME/$f
# done

