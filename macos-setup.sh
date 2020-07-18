#!/usr/bin/env zsh

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask install iterm2
brew cask install google-chrome
brew cask install dropbox
brew cask install docker

brew cask install 1password
brew cask install 1password-cli

if (! docker stats --no-stream)
then
    # start docker if not running
    open /Applications/Docker.app
fi

brew cask install adoptopenjdk/openjdk/adoptopenjdk8
brew cask install adoptopenjdk/openjdk/adoptopenjdk9
brew cask install adoptopenjdk/openjdk/adoptopenjdk10
brew cask install adoptopenjdk/openjdk/adoptopenjdk11

brew cask install spotify
brew cask install slack

brew cask install webstorm
brew cask install datagrip
brew cask install intellij-idea
brew cask install pycharm

brew cask install postman

brew install watch
brew install tmux
cp .tmux.conf ~/.tmux.conf
bind r source-file ~/.tmux.conf

brew install kube-ps1
brew install kubectx
brew install derailed/k9s/k9s

brew install kubernetes-cli

brew cask install sublime-text
cp "./Default (OSX).sublime-keymap" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Default (OSX).sublime-keymap"

brew install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp .zshrc ~/.zshrc
cp .zsh_aliases ~/.zsh_aliases

mkdir -p ~/scripts
cp -r ./scripts ~/scripts

source ~/.zshrc
source ~/.zsh_aliases

# add your ssh-key to keychain
# ssh-add -K ~/.ssh/id_rsa
cp ssh.config ~/ssh/config
