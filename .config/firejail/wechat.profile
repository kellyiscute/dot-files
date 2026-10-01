# Restrictive profile for ~/apps/WeChat/wechat.appimage (Firejail 0.9.80).
# Launch: ~/apps/WeChat/launch.sh
# Wayland only. No audio, camera, GPU, portals or notifications; tray is allowed.
# Internet remains available for messaging, including LAN/localhost access.
# If X11 abstract sockets are reachable, x11 none refuses to start rather
# than exposing the desktop. Do not remove that protection to fix startup.

include disable-common.inc
include disable-programs.inc
# Read-only kernel limit required by Chromium file watching.
# Exceptions must precede the include that blacklists these paths.
noblacklist /proc/sys/fs
noblacklist /proc/sys/fs/inotify
include disable-proc.inc
read-only /proc/sys/fs

# Only these home directories persist and are visible to WeChat.
mkdir ${HOME}/.xwechat
mkdir ${HOME}/xwechat_files
mkdir ${HOME}/Downloads/WeChat
whitelist ${HOME}/.xwechat
whitelist ${HOME}/xwechat_files
whitelist ${HOME}/Downloads/WeChat
# Optional downloaded build; expose only this file, read-only.
whitelist ${HOME}/Downloads/WeChatLinux_x86_64.AppImage
read-only ${HOME}/Downloads/WeChatLinux_x86_64.AppImage
noexec ${HOME}

# The user installation is read-only; its AppImage mounts privately in /tmp.
whitelist ${HOME}/apps/WeChat
read-only ${HOME}/apps/WeChat

# Keep compatibility with the old installation under /opt.
whitelist /opt/WeChat
read-only /opt/WeChat
blacklist /srv
blacklist /mnt
blacklist /media
blacklist /run/media

# Only the Wayland display socket and filtered D-Bus are exposed.
# Do not include whitelist-runuser-common.inc: it exposes audio sockets.
whitelist ${RUNUSER}/wayland-0
whitelist ${RUNUSER}/wayland-1
whitelist ${RUNUSER}/bus
noexec ${RUNUSER}
x11 none
# Native Wayland also permits clipboard copying and pasting.
# Firejail cannot make clipboard access write-only on this socket.
env QT_QPA_PLATFORM=wayland
env GDK_BACKEND=wayland
env QT_QUICK_BACKEND=software
env LIBGL_ALWAYS_SOFTWARE=1
rmenv HYPRLAND_INSTANCE_SIGNATURE
rmenv SSH_AUTH_SOCK
rmenv GPG_AGENT_INFO
rmenv LD_PRELOAD
rmenv LD_LIBRARY_PATH

# Chinese input and tray only; no portal, notification or keyring access.
# Never allow WeChat to own the input method's service name.
dbus-user filter
dbus-user.talk org.fcitx.Fcitx5
dbus-user.talk org.kde.StatusNotifierWatcher
# Qt owns a PID-based service for its single tray item.
include wechat-tray.inc
dbus-system none
env GTK_IM_MODULE=fcitx
env QT_IM_MODULE=fcitx
env XMODIFIERS=@im=fcitx
env SDL_IM_MODULE=fcitx

caps.drop all
nonewprivs
noroot
# Chromium uses chroot for its internal sandbox; capabilities stay dropped.
seccomp !chroot
# Retain namespaces used by Chromium's internal sandbox.
restrict-namespaces cgroup,time,uts
protocol unix,inet,inet6
ipc-namespace

private-dev
private-tmp
private-cache
private-cwd
private-etc alternatives,ca-certificates,crypto-policies,fonts,group,host.conf,hosts,ld.so.cache,localtime,machine-id,nsswitch.conf,os-release,passwd,pki,resolv.conf,ssl
machine-id
no3d
nodvd
nosound
notv
nou2f
novideo
noprinters
# Do not use disable-exec.inc: AppImage programs execute from /tmp.
# WeChat may execute bundled helpers there, but user files cannot execute.
noexec /var
