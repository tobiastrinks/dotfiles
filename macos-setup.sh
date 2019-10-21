/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask install iterm2
brew cask install sublime-text
brew cask install google-chrome
brew cask install dropbox
brew cask install docker

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

brew install tmux
echo -n '
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix
set -g mouse on
' > ~/.tmux.conf
bind r source-file ~/.tmux.conf

brew install node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

touch ~/.bash_profile
touch ~/.bash_aliases

echo -n '
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
' >> ~/.bash_profile

echo -n '
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# suppress MacOS Catalina verbose message to use zsh
export BASH_SILENCE_DEPRECATION_WARNING=1
' >> ~/.bash_profile

echo -n '
alias ll="ls -la"
alias c="clear"
alias work="cd ~/workspace"
alias he="cd ~/workspace/hotel-edison"
alias keeet="cd ~/workspace/keeet"
' >> ~/.bash_aliases

source ~/.bash_profile
