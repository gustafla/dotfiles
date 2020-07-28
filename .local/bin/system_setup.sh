#!/bin/bash
set -e

function msg {
    echo "$(tput bold)$(tput setaf 2)$@$(tput sgr 0)"
}

case $SUDO_USER in
    root|"")
        msg This script should be run with sudo as a regular user
        exit 1
        ;;
    *)
esac

msg Setting locale
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

msg Installing packages
pacman -Syu \
    iwd systemd-swap fwupd pulseaudio pulseaudio-alsa pulsemixer \
    sway swaylock swayidle alacritty bemenu bemenu-wlroots dex xdg-utils pass \
    grim slurp wl-clipboard \
    base-devel clang rust rust-racer exa fd ripgrep tokei neovim \
    python-pynvim python-jedi python-black \
    wget jq git

if ! command -v yay &> /dev/null; then
    msg Installing yay-bin
    sudo -H -u $SUDO_USER bash -c '\
        mkdir -p $HOME/.local/src && \
        cd $HOME/.local/src && \
        git clone https://aur.archlinux.org/yay-bin.git && \
        cd yay-bin && makepkg -csi'
fi

msg Installing AUR packages
sudo -u $SUDO_USER yay -S neovim-symlinks rust-src

msg Installing topgrade
sudo -H -u $SUDO_USER bash -c 'REL=\
$(curl https://api.github.com/repos/r-darwish/topgrade/releases/latest | \
jq -r .tag_name) && P="topgrade-$REL-$(uname -m)-unknown-linux-gnu.tar.gz" && \
cd $HOME/.local/bin && wget \
https://github.com/r-darwish/topgrade/releases/download/$REL/$P && \
tar -xzf $P && rm $P'

msg Enabling services
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
systemctl enable iwd.service
systemctl enable systemd-swap.service

msg Linking resolv.conf to systemd-resolved
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

msg Configuring systemd-networkd
mkdir -p /etc/systemd/network
cat > /etc/systemd/network/ethernet.network <<EOF
[Match]
Name=en*
Virtualization=false

[Network]
DHCP=Yes

[DHCP]
RouteMetric=10
EOF
cat > /etc/systemd/network/wlan.network <<EOF
[Match]
Name=wl*
Virtualization=false

[Network]
DHCP=yes

[DHCP]
RouteMetric=20
EOF

msg Fixing systemd-networkd-wait-online with override
mkdir -p /etc/systemd/system/systemd-networkd-wait-online.service.d
cat > /etc/systemd/system/systemd-networkd-wait-online.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/lib/systemd/systemd-networkd-wait-online --any
EOF

msg Setting SUID on loadkeys
chmod +s /usr/bin/loadkeys

msg Setting up getty@tty1 autologin for $SUDO_USER
mkdir -p /etc/systemd/system/getty@tty1.service.d
cat > /etc/systemd/system/getty@tty1.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $SUDO_USER --noclear %I \$TERM
EOF

if [[ -d /sys/class/power_supply/BAT0 ]]; then
    msg Battery detected, installing TLP
    pacman -S tlp
    systemctl enable tlp.service
fi

msg Remember to configure /etc/systemd/swap.conf
msg Remember to configure /etc/pacman.d/mirrorlist
msg Remember to configure /etc/makepkg.conf
msg Remember to install systemd-boot-pacman-hook AUR if using systemd-boot
if [[ -d /sys/class/power_supply/BAT0 ]]; then
    msg Remember to check tlp-stat and /etc/tlp.conf
fi
