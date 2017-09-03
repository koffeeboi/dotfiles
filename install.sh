git clone --quiet https://github.com/hueyjj/vim-airline
echo "Vim airline... ok"
mv vim-airline .vim

git clone --quiet https://github.com/hueyjj/vim-airline-themes
echo "Vim airline themes... ok"
mv vim-airline-themes .vim

git clone --quiet https://github.com/hueyjj/nerdtree
echo "Nerdtree... ok"
mv nerdtree .vim

git clone --quiet https://github.com/hueyjj/supertab
echo "Supertab ...ok"
mv supertab .vim

echo ".vim moved to home directory"
mv .vim ~/

os=$(uname)
case "$os" in
        "Linux")
        {
            echo "Operating system: Linux"
            mv _vimrc .vimrc
            mv .vimrc ~/
        };;
        *)
        {
            echo "Don't know OS: rename vimrc respectively for OS \
                  .vimrc, _vimrc, etc. Then, place in home directory."
        };;
esac
