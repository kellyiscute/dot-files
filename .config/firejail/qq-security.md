# QQ link and clipboard fixes

`qq.profile.bak` preserves the original profile. `qq.desktop` contains the updated desktop launcher.

Browser links use the host desktop OpenURI portal, rather than starting a browser inside QQ's sandbox. `env DE=flatpak` selects the installed xdg-open script's portal code path on Hyprland. Only OpenURI.OpenURI, introspection and read-only property queries are allowed on the desktop portal. Screenshot, screencast and file-chooser calls remain denied. A sandboxed xdg-open of https://example.com successfully returned a portal request.

The launcher uses `--ozone-platform=x11` so QQ's window and its legacy clipboard code use XWayland together, allowing Hyprland's clipboard synchronization to work. The guarded launch was verified to create a mapped XWayland window. Copying actual QQ messages was not tested. Fully exit and relaunch QQ to apply this change; any existing native Wayland QQ process retains its previous settings.

X11 has weaker desktop isolation than native Wayland: clients on the same X server can potentially observe other X11 clients. This profile already allowed X11, and this workaround uses that existing access. A dedicated X server plus a clipboard bridge is the alternative for native Wayland: https://github.com/w568w/qq-wayland-clipboard . That bridge and Xvfb are not installed here.

The profile still exposes Pictures, audio sockets and the Hyprland runtime directory, as it did before these changes. It has not been hardened to the same level as wechat.profile. QQ's permission to own Fcitx5's service name was removed; talking to Fcitx5 remains allowed.

Fcitx5 under XWayland requires the `fcitx5-gtk` package. It was missing and has now been installed. The profile already sets `GTK_IM_MODULE=fcitx` and permits Fcitx5 D-Bus access. Restart QQ after installing the module.
