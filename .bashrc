export TERM="xterm-256color"
export PATH=$PATH:/home/vimuser/.local/bin

alias \
  ll='ls -la' \
  vpc='nvim +PlugClean +qall' \
  vpi='nvim +PlugInstall +qall' \
  vpu='nvim +PlugUpdate +qall'


# Clean up my home
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_LIB_HOME="$HOME/.local/lib"

# Libs
export PLUG_HOME="${XDG_LIB_HOME:-$HOME/.local/lib}/nvim/plug"

