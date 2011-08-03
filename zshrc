source /etc/profile
# Add custom fpath with our functions
export FPATH=${HOME}/.zsh/functions:$FPATH

# Lines configured by zsh-newuser-install
HISTFILE=${HOME}/.histfile
HISTSIZE=2000
SAVEHIST=$HISTSIZE
setopt HIST_VERIFY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt hist_ignore_all_dups
setopt extendedglob
# setopt HIST_REDUCE_BLANKS
# setopt correctall # commands correction
 
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

# gentoo TAB completion
autoload -U compinit promptinit zrecompile
zsh_cache=${HOME}/.zsh/cache
mkdir -p $zsh_cache
compinit
promptinit #; prompt gentoo
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# SSH hosts tab completion
local _myhosts
_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $_myhosts

# key bindings
bindkey "\e[3~"     delete-char         # [Del] deletes char under the cursor
bindkey "^H"    history-beginning-search-backward

# Colorized prompt
MAGENTA="%{"$'\033[01;35m'"%}"
BLUE="%{"$'\033[01;34m'"%}"
BLACK="%{"$'\033[01;30m'"%}"
NORM="%{"$'\033[00m'"%}"
export PS1="${MAGENTA}%n@%m ${BLUE}%~ %#${NORM} "

export EDITOR=/usr/bin/vim

if [[ -f "$HOME/.amazon-keys" ]]; then
  source "$HOME/.amazon-keys";
fi

# local vars and alises
alias apgmy='apg -a 1 -m 10 -M NCL -E O0I1l'
alias apgmys='apg -a 0 -M NCL -E O0I1l'

if [[ -d '/usr/local/Cellar/macvim' ]]; then
  alias vim='/usr/local/Cellar/macvim/*/MacVim.app/Contents/MacOS/Vim'
fi
# colored ls
alias ls='ls --color=auto'

export SYMFONY_ENV="dev"
export POKERRU_ENV="dev"
export SCUMMVM_PORT="128:0"
export RAILS_ENV="development"

export PKG_CONFIG_PATH=/opt/local/lib/pkgconfig

setopt extended_glob
for zshrc_include in ${HOME}/.zsh/includes/S[0-9][0-9]*[^~] ; do
        source $zshrc_include
done

