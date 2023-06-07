pkgs=("fish" "bat" "go" "flameshot" "fzf" "gimp" "git" "gnome-clocks" "i3-gaps" "i3blocks" "i3lock" "i3status" "ktorrent" "picom" "polybar" "starship" "vlc" "ncmpcpp" "mpv" "yt-dlp" "zathura" "zathura-cb" "zathura-djvu" "zathura-pdf-mupdf" "zathura-ps" "neovim" "python-pywal" "firefox" "alacritty" "tmux" "zsh" "nvm-git" "clang" "lxappearance-gtk3")
for str in ${pkgs[@]}; do
    sudo pacman -S "$str"
done
echo "remember to install nvm and all the lsps and qute-browser"
