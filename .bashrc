if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
  return
fi

eval "$(starship init bash)"
[[ $- == *i* ]] && source ~/.local/share/blesh/ble.sh --noattach

# Put your fun stuff here.
if [[ ${BLE_VERSION-} ]]; then
  bleopt prompt_ps1_transient=always
  bleopt prompt_ps1_final='$(starship module character)'
  ble-attach
fi

PATH="$PATH:/home/miners/.local/bin"

# BOB
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
. "/home/miners/.local/share/bob/env/env.sh"
. "/home/miners/.local/share/bob/env/env.sh"

export PATH=$PATH:/home/miners/.spicetify
export PATH=$PATH:$HOME/.spicetify

# go 
export GOPATH="$HOME/dev/env/go"
# tiny go 
export PATH=$PATH:/usr/local/tinygo/bin
export PATH="$PATH:$GOPATH/bin"

# doom
export PATH="$HOME/.config/emacs/bin:$PATH"

# yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

# Aliases
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'
alias ls='eza -l'
alias lsa='eza -a -l --no-symlinks'
alias ..='cd ..'

#for esp32
alias tflash='/usr/local/tinygo/bin/tinygo flash -x -target=esp32-coreboard-v2 -port=/dev/ttyUSB0'


