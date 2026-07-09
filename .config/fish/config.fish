set -gx PATH /home/kelly/bin $PATH
set -gx PATH $PATH /home/kelly/.cargo/bin
set -gx PATH $PATH /opt/google-cloud-cli/bin
if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source
set -gx PATH $PATH /opt/flutter/bin
set -gx PATH $PATH /opt/tabby-1.0.197-linux-x64
set -gx PATH $PATH /opt/thunderbird
set -gx PATH $PATH /home/kelly/go/bin
set -gx PATH $PATH /home/kelly/.local/bin
set -gx PATH $PATH /home/kelly/.dev/flutter/bin/
set -g fish_key_bindings fish_vi_key_bindings
set -gx CHROME_EXECUTABLE /usr/bin/google-chrome-stable
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock
set -gx EDITOR nvim

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pyenv
eval "$(pyenv init -)"

# qt theme
set -gx QT_QPA_PLATFORMTHEME qt5ct
# set -gx QT_STYLE_OVERRIDE kvantum

# MPD
set -gx MPD_HOST "/home/kelly/.mpd/socket"

function setProxy
  set httpProxy http://192.168.10.1:7891
  set socksProxy socks5://192.168.10.1:7891

  set -gx ALL_PROXY $socksProxy
  set -gx SOCKS_PROXY $socksProxy
  set -gx HTTP_PROXY $httpProxy
  set -gx HTTPS_PROXY $httpProxy

  hyprctl keyword env HTTPS_PROXY $httpProxy
  hyprctl keyword env HTTP_PROXY  $httpProxy
  hyprctl keyword env SOCKS_PROXY $socksProxy
end

function unsetProxy
  set -e ALL_PROXY
  set -e SOCKS_PROXY
  set -e HTTP_PROXY
  set -e HTTPS_PROXY
  hyprctl keyword env HTTPS_PROXY ""
  hyprctl keyword env HTTP_PROXY ""
  hyprctl keyword env SOCKS_PROXY ""
end

function showProxy
  echo "ALL_PROXY: $ALL_PROXY"
  echo "SOCKS_PROXY: $SOCKS_PROXY"
  echo "HTTP_PROXY: $HTTP_PROXY"
  echo "HTTPS_PROXY: $HTTPS_PROXY"
end

function ship
  argparse "t/to=" -- $argv
  set -q _flag_to; or set _flag_to "main"

  git fetch
  set prLink $(gh pr create --fill --base $_flag_to | tail -n 1)
  echo $prLink
  wl-copy $prLink
end

zoxide init fish | source

alias waybar-reload="killall -SIGUSR2 waybar"
alias wechat="screen -dmS wechat firejail --appimage --profile=~/.config/firejail/WeChatLinux_x86_64.AppImage.profile ~/apps/WeChatLinux_x86_64.AppImage"
alias remote="hyprctl -i 0 keyword monitor DP-2, disable"
alias k="kubectl"
alias kgp="kubectl get pods"
alias kd="kubectl describe"
alias n="nvim"
alias svc="sudo systemctl"
alias proxy="setProxy"
alias noproxy="unsetProxy"

# GVM (Go Version Manager)
if test -x $HOME/bin/gvm
    gvm env --fish | source
end
