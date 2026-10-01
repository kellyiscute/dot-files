#!/bin/sh
set -eu
app_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
entries_dir="$HOME/.local/share/applications"
mkdir -p "$entries_dir"
if [ -f "$entries_dir/wechat.desktop" ]; then
    cp -p "$entries_dir/wechat.desktop" "$entries_dir/wechat.desktop.bak"
fi
cp "$app_dir/wechat.desktop" "$entries_dir/wechat.desktop"
if command -v update-desktop-database >/dev/null 2>&1; then
    update-desktop-database "$entries_dir"
fi
