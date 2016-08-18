# Install packages
sudo apt-get install xmonad libghc-xmonad-contrib-dev suckless-tools xmobar

mkdir -p ~/.xmonad/

# Copy plain XMonad config
cp ./xmonad.hs ~/.xmonad
cp ./volume.sh ~/.xmonad

# XMobar
cp ./xmobar.hs ~/.xmobarrc
