# XDG standard
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"

# Basic settings
set -x LANG en_GB.UTF-8
set -x FZF_DEFAULT_COMMAND "rg --files --no-ignore-vcs"

# Home directory cleanup
set -x BUNDLE_USER_HOME "$XDG_CACHE_HOME/bundle"
set -x SOLARGRAPH_CACHE "$XDG_CACHE_HOME/solargraph"

# Allways use neovim
set -x EDITOR "nvim"

# Loading aliases
source "$XDG_CONFIG_HOME/fish/alias.fish"

# Setting up rbenv and nodenv
export RBENV_ROOT="$XDG_DATA_HOME/rbenv"
status --is-interactive; and source (rbenv init -|psub)

export NODENV_ROOT="$XDG_DATA_HOME/nodenv"
status --is-interactive; and source (nodenv init -|psub)

# Loading autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Doom Emacs
set PATH $XDG_CONFIG_HOME/emacs/bin $PATH
