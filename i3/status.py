from i3pystatus import Status

status = Status()

# Colors
cGreen = "#A0D0A0"

# Host
import socket
cHostname = socket.gethostname()

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%F %T Week %V",)

status.register("uptime",
    format="up {days} days, {hours}:{mins}",)

status.register("mem_bar",
    color="#FFFFFF",
    warn_percentage=90,
    alert_percentage=95,)

status.register("mem",
    format="{avail_mem}GiB free",
    divisor=1073741824,
    color="#FFFFFF",
    warn_percentage=90,
    alert_percentage=95,)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
if cHostname == "nu":
    status.register("temp",
        format="{temp:.0f}°C",
        file="/sys/class/thermal/thermal_zone1/temp",)

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
if cHostname == "nu":
    status.register("battery",
        format="{status}/{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
        alert=False,
        full_color=cGreen,
        charging_color=cGreen,
        status={
            "DIS": "↓",
            "CHR": "↑",
            "FULL": "=",
        },)

# This would look like this:
# Discharging 6h:51m
#status.register("battery",
#    format="{status} {remaining:%E%hh:%Mm}",
#    alert=True,
#    alert_percentage=5,
#    status={
#        "DIS":  "Discharging",
#        "CHR":  "Charging",
#        "FULL": "Bat full",
#    },)

# Displays whether a DHCP client is running
#status.register("runwatch",
#    name="DHCP",
#    path="/var/run/dhclient*.pid",)

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
#if cHostname == "mu":
#    status.register("network",
#        interface="wired0",
#        format_up="{v4cidr}",
#        color_up=cGreen,
#        color_down="#D0A0A0")

# Note: requires both netifaces and basiciw (for essid and quality)
if cHostname == "nu":
    status.register("network",
        interface="wlan0",
        color_up=cGreen,
        format_up="{essid} {quality:02.0f}% {v4cidr}",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    format="{used}/{total}G [{avail}G]",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
#status.register("pulseaudio",
#    format="♪{volume}",)

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
status.register("mpd",
    format="{title}{status}",
    status={
        "pause": "▷",
        "play": "▶",
        "stop": "◾",
    },)

status.run()
