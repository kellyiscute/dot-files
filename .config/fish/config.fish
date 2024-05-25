if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source
set -gx PATH $PATH /home/kelly/.cargo/bin
set -gx PATH $PATH /opt/flutter/bin
set -gx PATH $PATH /opt/tabby-1.0.197-linux-x64
set -gx PATH $PATH /opt/thunderbird
set -gx PATH $PATH /home/kelly/go/bin
set -g fish_key_bindings fish_vi_key_bindings
set -gx CHROME_EXECUTABLE /usr/bin/google-chrome-stable
set -gx SSH_AUTH_SOCK ~/.1password/agent.sock
set -gx PATH $PATH /home/kelly/.local/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pyenv
eval "$(pyenv init -)"

# qt theme
set -gx QT_QPA_PLATFORMTHEME qt5ct
# set -gx QT_STYLE_OVERRIDE kvantum
