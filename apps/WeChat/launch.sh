#!/bin/sh
set -eu
umask 077
app_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
runtime_dir=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
if [ ! -d "$runtime_dir" ] || [ ! -w "$runtime_dir" ]; then
    printf '%s\n' 'WeChat: a writable session runtime directory is required.' >&2
    exit 1
fi
# flock remains outside the sandbox; WeChat cannot access its lock file.
# A second guarded launch exits successfully without starting another instance.
exec flock --nonblock --conflict-exit-code 0 -- "$runtime_dir/wechat-firejail.lock" \
    firejail --profile="$HOME/.config/firejail/wechat.profile" \
    --appimage "$app_dir/wechat.appimage" "$@"
