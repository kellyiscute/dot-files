# Firejail profile for qq
# Description: Firejail profile for qq nt

# Add fcitx5 environment
env GTK_IM_MODULE=fcitx
env QT_IM_MODULE=fcitx
env XMODIFIERS=@im=fcitx
env SDL_IM_MODULE=fcitx

tracelog

mkdir ${HOME}/.xwechat
mkdir ${HOME}/xwechat_files

whitelist ${HOME}/Pictures
noblacklist ${HOME}/Pictures
noblacklist ${HOME}/xwechat_files
noblacklist ${HOME}/.xwechat
whitelist ${HOME}/xwechat_files
whitelist ${HOME}/.xwechat
whitelist ${HOME}/Downloads/WeChat

noblacklist ${HOME}/.config/fcitx5
whitelist ${HOME}/.config/fcitx5
noblacklist ${RUNUSER}/hypr
whitelist ${RUNUSER}/hypr
noblacklist ${RUNUSER}/wayland-*
whitelist ${RUNUSER}/wayland-0
whitelist ${RUNUSER}/wayland-1

# D-Bus session bus
noblacklist ${RUNUSER}/bus
whitelist ${RUNUSER}/bus
# Electron needs /dev/shm for memory mapping
noblacklist /dev/shm
whitelist /dev/shm
noblacklist /dev/dri
whitelist /dev/dri

# Pulse/Pipewire audio (usually needed on Wayland)
noblacklist ${RUNUSER}/pulse
noblacklist ${RUNUSER}/pipewire-0
whitelist ${RUNUSER}/pulse
whitelist ${RUNUSER}/pipewire-0

# dev
whitelist /dev/urandom
whitelist /dev/null

include allow-bin-sh.inc
include disable-shell.inc

caps.drop all
ignore apparmor
noprinters

nonewprivs
noroot
notv
nou2f
protocol unix,inet,inet6,netlink
seccomp !chroot

# disable-mnt

ignore private-bin
noblacklist /opt/WeChat
private-tmp
private-etc alsa,alternatives,ca-certificates,crypto-policies,fonts,group,host.conf,hostname,hosts,ld.so.cache,ld.so.preload,localtime,login.defs,machine-id,nsswitch.conf,os-release,passwd,pki,pulse,resolv.conf,ssl,xdg,fcitx5

noblacklist ${HOME}/.config/QQ
noblacklist ${HOME}/.config/tencent-qq

mkdir ${HOME}/.config/QQ
mkdir ${HOME}/.config/tencent-qq

whitelist ${HOME}/.config/QQ
whitelist ${HOME}/.config/tencent-qq


whitelist ${HOME}/.config/pulse

whitelist ${HOME}/.fonts.conf.d
whitelist ${HOME}/.fonts.conf.d

whitelist ${HOME}/.fonts.conf
whitelist ${HOME}/.fonts.conf

whitelist ${HOME}/.local/share/fonts
read-only ${HOME}/.local/share/fonts

whitelist ${HOME}/.fonts
read-only ${HOME}/.fonts

ignore dbus-user none
dbus-user filter
dbus-user.talk org.freedesktop.Notifications
dbus-user.talk org.freedesktop.portal.Desktop
dbus-user.talk org.freedesktop.portal.Fcitx
dbus-user.talk org.freedesktop.portal.IBus
dbus-user.talk org.freedesktop.ScreenSaver
dbus-user.talk org.gnome.Mutter.IdleMonitor
dbus-user.talk org.kde.StatusNotifierWatcher
dbus-user.own org.fcitx.Fcitx5
dbus-user.talk org.fcitx.Fcitx5.*
ignore dbus-user.talk org.freedesktop.portal.Screenshot
ignore dbus-user.talk org.freedesktop.portal.Screencast
ignore dbus-user.talk org.gnome.Shell.Screenshot
ignore dbus-user.talk org.kde.kwin.Screenshot
# dbus-user.talk org.mozilla.*
