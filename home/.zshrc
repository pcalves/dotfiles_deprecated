# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

export EDITOR='subl -w'
export LANG="pt_PT.utf8"
export LC_ALL=C

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git textmate svn pow debian nginx sublime brew ssh-agent composer gem laravel vagrant knife knife_ssh node npm ruby rvm)

source $ZSH/oh-my-zsh.sh
source $ZSH/functions
source $ZSH/aliases
# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/pc/android-sdk-macosx/tools:/usr/local/mysql/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
#:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin
export PATH="$(brew --prefix php54)/bin:$PATH"
PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"
PATH=$PATH:/Applications/VirtualBox.app/Contents/MacOS/

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Generic Colouriser
source "`brew --prefix`/etc/grc.bashrc"

### rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### nvm
source ~/.nvm/nvm.sh

# pure
# autoload -U promptinit && promptinit
# prompt pure
