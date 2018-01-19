from i3pystatus import Status

status = Status()

# Colors
cGreen = "#E0FFE0"

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
status.register("temp",
    format="{temp:.0f}°C",
    file="/sys/class/thermal/thermal_zone0/temp",)

# The battery monitor has many formatting options, see README for details
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

# Note: requires both netifaces and basiciw (for essid and quality)
status.register("network",
    interface="wlp3s0",
    color_up=cGreen,
    color_down="#FFFFFF",
    format_up="{essid} {quality:02.0f}% {v4cidr}",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
status.register("disk",
    path="/",
    format="{used}/{total}G [{avail}G]",)

status.run()
