#!/bin/bash
set -e

# The base Ubuntu image does not run systemd, so the installer's systemctl
# commands cannot leave XUI running. Start MariaDB explicitly, perform the
# one-time installation when needed, then keep XUI itself in the foreground.
service mariadb start

if [ -f /home/xui/status ]; then
    echo "XUI already installed."
else
    echo "Starting fresh installation..."
    python3 /install.python3.py
fi

echo "Starting XUI services..."

# XUI's host installer tries to change ownership inside sysfs. Docker mounts
# sysfs read-only, and its network information is already readable by XUI.
sed -i \
    's|^  sudo chown -R xui:xui /sys/class/net$|  # sysfs is read-only in Docker.|' \
    /home/xui/service

# /home/xui is persistent, but PHP-FPM PID files and Unix sockets are not.
# Stale files can make start-stop-daemon mistake an unrelated reused PID for
# an already-running pool after the container is recreated.
rm -f /home/xui/bin/php/sockets/*.pid /home/xui/bin/php/sockets/*.sock

exec /home/xui/service start
