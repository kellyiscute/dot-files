# Restricted WeChat

Launch the installed build under Firejail with a single-instance lock:

```sh
"$HOME/apps/WeChat/launch.sh"
```

The desktop launcher uses `~/apps/WeChat/launch.sh`. The installation includes the AppImage, icon, desktop entry and installer. A host-side flock lock prevents duplicate launches through this launcher; it does not detect instances started through other commands. The old `/opt/WeChat` installation is untouched. The downloaded build was tested: it created a mapped native Wayland window, then the test stopped it. Login, messaging and Chinese input have not been exercised.

Only `.xwechat`, `xwechat_files`, and `Downloads/WeChat` are exposed as persistent home directories. The downloaded AppImage is also visible read-only. Put files you deliberately want to send in `Downloads/WeChat`; all files in the three exposed directories remain accessible to WeChat. Its installation under `~/apps/WeChat` is read-only inside the sandbox. The old `/opt/WeChat` installation is also exposed read-only for compatibility.

The profile drops all Linux capabilities, prevents privilege elevation, applies seccomp, isolates IPC and temporary files, hides other home data and mounted media, spoofs the machine ID, and disables GPU, audio, camera, printing and X11 access. Desktop portals, notifications and compositor control sockets are not allowed. The permitted session D-Bus services are Fcitx5 for Chinese input and org.kde.StatusNotifierWatcher for tray integration. Native Wayland clipboard copying and pasting are allowed through the existing display socket. Firejail cannot restrict that socket to clipboard writes alone; clipboard reads depend on the compositor. Chromium retains the namespace operations and chroot syscall needed for its own sandbox. Bundled AppImage helpers can execute in its private temporary directory.

Network access remains enabled: WeChat can reach the internet, LAN and localhost, and transmit anything it can read. This is filesystem/device confinement, not an outbound network allowlist. Firejail warns that abstract D-Bus sockets might bypass socket filtering when the host network namespace is shared. A separate network namespace is required to eliminate that route while preserving UNIX sockets for Wayland. `x11 none` refuses startup if an abstract X11 socket is accessible.

Firejail's upstream manual documents these socket limitations: https://github.com/netblue30/firejail/blob/master/src/man/firejail.1.in

Original profile: `wechat.profile.bak`. Changes apply to new launches; already running processes do not acquire these restrictions.

Tray registration also requires ownership of Qt's PID-based service name. `wechat-tray.inc` permits only `org.kde.StatusNotifierItem-1-1` through `org.kde.StatusNotifierItem-64-1`; the installed build uses sandbox PID 30. This avoids a broad `org.kde.*` ownership grant. If a future build uses a PID outside this range or a second tray item, its registration will be denied. Restart WeChat to apply changed D-Bus permissions.
