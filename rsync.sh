#!/bin/sh

RSYNC="rsync"
RS_LINE="-v -rtl --delete"
RS_EXTRA="$@"

$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/projects/ projects/
$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/school/ school/
$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/dos/ dos/
$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/backup/dotfiles/ .dotfiles/
#$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/NetBeansProjects/ NetBeansProjects/
#$RSYNC $RS_LINE $RS_EXTRA --exclude="8.2.0/var/cache" --exclude="8.2.0/var/log" /mnt/nfs/alpha/backup/.tmcbeans_hellu/ .tmcbeans_hellu/
#$RSYNC $RS_LINE $RS_EXTRA --exclude="8.2.0/var/cache" --exclude="8.2.0/var/log" /mnt/nfs/alpha/backup/.tmcbeans_mooc/ .tmcbeans_mooc/
#$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/games/Stepmania/Save/ .stepmania-5.0/Save/
#$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/games/Stepmania/Songs/ .stepmania-5.0/Songs/
#$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/games/dolphin-emu/GC/ .dolphin-emu/GC/
#$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/games/dolphin-emu/StateSaves/ .dolphin-emu/StateSaves/
#$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/games/dolphin-emu/Wii/ .dolphin-emu/Wii/
#$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/games/minecraft_saves/ .minecraft/saves/
#$RSYNC $RS_LINE $RS_EXTRA /mnt/nfs/alpha/games/roms/ roms/ --exclude 'wii' --exclude 'gcn'
