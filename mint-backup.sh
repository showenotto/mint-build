#!/bin/zsh


echo "Copying configuration files..."
cp /etc/tmux.conf /home/showen/kali-build/roles/configurations/tmux/files/
cp /home/showen/.vimrc /home/showen/kali-build/roles/configurations/vim/files/
cp /home/showen/.zshrc /home/showen/kali-build/roles/configurations/zsh/files/
echo 's?0001?1001?o' | su showen -c "dconf dump / > /home/showen/mint-build/roles/configurations/cinnamon-desktop/files/settings.dconf"

echo "Pushing changes to git repository..."
cd /home/showen/mint-build/
git config --global user.email "showenotto@proton.me"
git add .
git commit -m '1.0'
git push



