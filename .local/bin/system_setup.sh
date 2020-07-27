#!/bin/bash
set -e

echo Setting locale
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

echo Installing packages
pacman -Syu \
    systemd-networkd iwd \
    systemd-swap \
    sway swaylock alacritty \
    neovim \
    base-devel

echo Installing yay-bin
mkdir -p $HOME/.local/src
pushd $HOME/.local/src
git clone https://aur.archlinux.org/yay-bin.git
pushd yay-bin
makepkg -csi
popd
popd

echo Installing neovim symlinks
yay -S neovim-symlinks

echo Enabling services
systemctl enable systemd-networkd.service
systemctl enable systemd-resolved.service
systemctl enable iwd.service
systemctl enable systemd-swap.service

echo Linking resolv.conf to systemd-resolved
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

echo Configuring systemd-networkd
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

echo Fixing systemd-networkd-wait-online with override
mkdir -p /etc/systemd/system/systemd-networkd-wait-online.service.d
cat > /etc/systemd/system/systemd-networkd-wait-online.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/lib/systemd/systemd-networkd-wait-online --any
EOF

echo Setting SUID on loadkeys
chmod +s /usr/bin/loadkeys

if [ -d /sys/class/power_supply/BAT0 ]; then
    echo Battery detected, installing TLP
    pacman -S tlp
    systemctl enable tlp.service
    echo Remember to check tlp-stat and /etc/tlp.conf
fi

echo Remember to configure /etc/systemd/swap.conf
echo Remember to configure /etc/pacman.d/mirrorlist
echo Remember to configure users and sudoers
echo Remember to install systemd-boot-pacman-hook AUR
