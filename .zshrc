### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

export EDITOR="nvim"
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

PATH="$PATH:/home/miners/.local/bin"

# emacs
export PATH="$HOME/.config/emacs/bin:$PATH"

# BOB
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
. "/home/miners/.local/share/bob/env/env.sh"
. "/home/miners/.local/share/bob/env/env.sh"

export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

export PATH=$PATH:/home/miners/.spicetify
export PATH=$PATH:$HOME/.spicetify


# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# stuff 
HISTSIZE=5000
HISTFILE=~/.zsh_history
source ~/.zsh-syntax-highlighting.zsh
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# alias 
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias ls='eza -l'
alias lsa='eza -a -l --no-symlinks'
alias ..='cd ..'
alias ff="fastfetch -c examples/13"
alias c='clear'
# use emacs binds - the horrors
bindkey -e

#bindings
bindkey ' ' magic-space
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::golang

# needed
autoload -Uz compinit && compinit
zstyle ':completions:*' matcher-list 'm:{a-z}={A-Za-z}'

zinit cdreplay -q
zinit light zsh-users/zsh-autosuggestions
    
export PATH="/usr/lib/llvm/21/bin:$PATH"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/conf.toml)"

# custom commands
# for kernel/compilers // cachyos-sources is too bleeding edge for some programs
lock() {
    # Usage: lock sys-kernel/cachyos-sources-6.18.9
    local pkg=$1
    echo ">$pkg" | sudo tee -a /etc/portage/package.mask/manual_locks
    echo "Locked: $pkg (Nothing newer will install)"
}

unlock() {
    # Usage: unlock sys-kernel/cachyos-sources
    local pkg=$1
    sudo sed -i "/$pkg/d" /etc/portage/package.mask/manual_locks
    echo "Unlocked: $pkg"
}

sysup() {
    echo "Syncing Gentoo Repositories..."
    sudo emerge --sync

    echo "Starting System Update..."
    sudo emerge -avuND @world "$@"

    echo ""
    echo "---------------------------------------"
    echo "CHECKING KERNEL STATUS (Look for Red/Masked versions):"
    eix cachyos-sources
    echo "----------------------------------------"
    echo "Dont forget to run sudo emerge -av --depclean"
}

