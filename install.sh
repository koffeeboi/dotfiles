git clone --quiet https://github.com/hueyjj/vim-airline
echo "Vim airline... ok"

git clone --quiet https://github.com/hueyjj/vim-airline-themes
echo "Vim airline themes... ok"

git clone --quiet https://github.com/hueyjj/nerdtree
echo "Nerdtree... ok"

GIT Clone --quiet https://github.com/hueyjj/supertab
echo "Supertab ...ok"

echo ".vim moved to home directory"

os=$(uname)
case "$os" in
        "Linux")
        {
            echo "Operating system: Linux"
            
            {
            find . -type f -print0 | xargs -0 dos2unix      # Convert dos (windows) files to unix/linux
            } &> /dev/null
            
            echo "Moved .vimrc to home directory"
            mv _vimrc .vimrc
            mv .vimrc ~/
        };;
        *)
        {
            echo "Moved _vimrc to home directory"
            mv _vimrc ~/
        };;
esac

echo "Plugins moved to .vim"
mv vim-airline .vim
mv vim-airline-themes .vim
mv nerdtree .vim
mv supertab .vim

echo ".vim moved to home directory"
mv .vim ~/

