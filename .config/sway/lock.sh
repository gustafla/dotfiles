#!/bin/sh
# Lock the session, idempotently, and blank the outputs while locked.

set -eu

uid=$(id -u)

locked() {
    pgrep -x -u "$uid" swaylock >/dev/null 2>&1
}

# Already locked: callers may proceed immediately.
if locked; then
    exit 0
fi

# Blank the outputs after a short idle period while locked.
swayidle \
    timeout 10 'swaymsg "output * power off"' \
    resume     'swaymsg "output * power on"' &
blanker=$!

# swaylock stays in the foreground of this subshell so we observe it exiting.
{
    swaylock || true
    kill "$blanker" 2>/dev/null || true
    swaymsg 'output * power on' >/dev/null 2>&1 || true
    loginctl unlock-session >/dev/null 2>&1 || true
} &

# Bounded wait for the lock surface, so this can never spin forever.
i=0
while ! locked; do
    i=$((i + 1))
    if [ "$i" -gt 100 ]; then   # ~5s
        echo "lock.sh: swaylock failed to start" >&2
        kill "$blanker" 2>/dev/null || true
        exit 1
    fi
    sleep 0.05
done
