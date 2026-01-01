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

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

PATH="$PATH:/home/miners/.local/bin"

# BOB
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
. "/home/miners/.local/share/bob/env/env.sh"
. "/home/miners/.local/share/bob/env/env.sh"

export PATH=$PATH:/home/miners/.spicetify
export PATH=$PATH:$HOME/.spicetify

# go
export GOPATH="$HOME/devel/env/go"

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
alias ph="tmux new -s 67"

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
    

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/conf.toml)"
