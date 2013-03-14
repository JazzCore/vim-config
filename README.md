```bash
cd ~
git clone https://github.com/JazzCore/vim-config.git ~/.vim/
ln -s ~/.vim/vimrc ~/.vimrc
```

On Windows ( execute in %HOME% dir ):
```bash
git clone https://github.com/JazzCore/vim-config.git
mklink /D bundle vim-config\bundle
mklink /H ..\_vimrc vim-config\vimrc
```

## Update all bundled modules

```bash
git submodule foreach git pull origin master
```

## Install a new bundle

```bash
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

## To remove a submodule

1. Delete the relevant section from the .gitmodules file.
2. Delete the relevant section from .git/config.
3. Run git rm --cached path_to_submodule (no trailing slash).
4. Commit and delete the now untracked submodule files.

