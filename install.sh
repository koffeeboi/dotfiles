git clone --quiet https://github.com/hueyjj/vim-airline
echo "Vim airline...ok"

git clone --quiet https://github.com/hueyjj/vim-airline-themes
echo "Vim airline themes...ok"

git clone --quiet https://github.com/hueyjj/nerdtree
echo "Nerdtree...ok"

git clone --quiet https://github.com/hueyjj/supertab
echo "Supertab...ok"

git clone --quiet https://github.com/hueyjj/supertab
echo "visualmarks...ok"

echo ""

os=$(uname)
case "$os" in
        "Linux")
        {
            echo "Operating system: Linux"
            
            {
            find . -type f -print0 | xargs -0 dos2unix      # Convert dos (windows) files to unix/linux
            } &> /dev/null
            
            dos2unix _vimrc     # dos2unix trick for whole directory didn't work for some reason
            cp _vimrc .vimrc
            mv .vimrc ~/
            echo "Copied .vimrc to home directory"

        };;
        *)
        {
            echo "Copied _vimrc to home directory"
            cp _vimrc ~/
        };;
esac
echo ""

mkdir ~/.vim
mkdir ~/.vim/colors
mkdir ~/.vim/fonts
echo ""

echo "Plugins copied to ~/.vim"
cp -r vim-airline ~/.vim
cp -r vim-airline-themes ~/.vim
cp -r nerdtree ~/.vim
cp -r supertab ~/.vim
cp -r visualmarks ~/.vim

cp -r .vim/colors/* ~/.vim/colors
cp -r .vim/fonts/* ~/.vim/fonts

