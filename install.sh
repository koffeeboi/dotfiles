git clone --quiet https://github.com/hueyjj/vim-airline
echo "Vim airline... ok"

git clone --quiet https://github.com/hueyjj/vim-airline-themes
echo "Vim airline themes... ok"

git clone --quiet https://github.com/hueyjj/nerdtree
echo "Nerdtree... ok"

git clone --quiet https://github.com/hueyjj/supertab
echo "Supertab ...ok"
echo ""

os=$(uname)
case "$os" in
        "Linux")
        {
            echo "Operating system: Linux"
            
            {
            find . -type f -print0 | xargs -0 dos2unix      # Convert dos (windows) files to unix/linux
            } &> /dev/null
            
            cp _vimrc .vimrc
            mv .vimrc ~/
            echo "Moved .vimrc to home directory"

        };;
        *)
        {
            echo "Moved _vimrc to home directory"
            cp _vimrc ~/
        };;
esac
echo ""

mkdir ~/.vim
mkdir ~/.vim/colors
mkdir ~/.vim/fonts
echo ""

echo "Plugins moved to ~/.vim"
cp -r vim-airline ~/.vim
cp -r vim-airline-themes ~/.vim
cp -r nerdtree ~/.vim
cp -r supertab ~/.vim

cp -r .vim/colors/* ~/.vim/colors
cp -r .vim/fonts/* ~/.vim/fonts

