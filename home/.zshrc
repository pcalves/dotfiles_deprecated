# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
ZSH_THEME="honukai"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# This will highlight the patterns you specify in a color of your choice.
# This example here will highlight any time you type rm -rf in red.
# This is helpful, as rm -rf is a potentially very dangerous command, and the reminder of that is very nice.
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

export EDITOR='nvim'
export LC_ALL=pt_PT.UTF-8
export LANG=pt_PT.UTF-8

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(laravel z catimg osx git svn pow debian nginx sublime brew brew-cask ssh-agent composer gem vagrant knife knife_ssh node npm ruby rvm titanium alloy pure zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $ZSH/functions
source $ZSH/aliases

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/pc/android-sdk-macosx/tools:/usr/local/mysql/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
#:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin
export PATH="$(brew --prefix php54)/bin:$PATH"
#PATH="$(brew --prefix josegonzalez/php/php54)/bin:$PATH"
PATH=$PATH:/Applications/VirtualBox.app/Contents/MacOS
PATH=$PATH:~/.composer/vendor/bin
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
. `brew --prefix`/etc/profile.d/z.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Generic Colouriser
source "`brew --prefix`/etc/grc.bashrc"

PERL_MB_OPT="--install_base \"/Users/pc/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/pc/perl5"; export PERL_MM_OPT;

# ECLIPSE PATH
export ECLIM_PATH=/opt/homebrew-cask/Caskroom/eclipse-php/4.5.1/Eclipse.app/Contents/Eclipse/plugins/org.eclim_2.5.0/bin
# ANDROID SDK PATH
export ANDROID_HOME=/usr/local/opt/android-sdk

# Some options for our Zsh history.
# These will set our history to allow a ton more entires, ignore duplicate commands,
# and ignore some of the commands we don’t need a history of.
# This is useful because if you want to search for that command you
# ran a few weeks ago, you can do that a lot easier.
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help";

# thefuck (https://github.com/nvbn/thefuck) alias
eval "$(thefuck --alias)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# AZK HOST
export AZK_BALANCER_HOST=dev.cterm.io

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# call nvm use automatically whenever you enter a directory that contains
# an .nvmrc file with a string telling nvm which node to use
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
