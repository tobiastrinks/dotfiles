export ZSH="/Users/tobias/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export NODE_OPTIONS=--max_old_space_size=8192

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#6b6b6b"

# Basic auto/tab complete:
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s "^o" "lfcd\n"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting # must be last
)

source $ZSH/oh-my-zsh.sh

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
kubeoff

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

export GEM_HOME="$HOME/.gem"
gem install teamocil

export PATH="$HOME/scripts:$GEM_HOME/bin:$HOME/.asdf/shims:$PATH"

# list of kubeconfig files to use (separate with :)
export KUBECONFIG="$HOME/.kube/config"
