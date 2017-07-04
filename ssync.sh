#!/bin/sh

RSYNC="rsync"
RS_LINE="-v -rtl --delete"
RS_EXTRA="$@"

$RSYNC $RS_LINE $RS_EXTRA projects/ /mnt/nfs/alpha/projects/
$RSYNC $RS_LINE $RS_EXTRA school/ /mnt/nfs/alpha/school/
$RSYNC $RS_LINE $RS_EXTRA dos/ /mnt/nfs/alpha/dos/
$RSYNC $RS_LINE $RS_EXTRA .dotfiles/ /mnt/nfs/alpha/backup/dotfiles/
#$RSYNC $RS_LINE $RS_EXTRA NetBeansProjects/ /mnt/nfs/alpha/NetBeansProjects/
#$RSYNC $RS_LINE $RS_EXTRA --exclude="8.2.0/var/cache" --exclude="8.2.0/var/log" .tmcbeans_hellu/ /mnt/nfs/alpha/backup/.tmcbeans_hellu/
#$RSYNC $RS_LINE $RS_EXTRA --exclude="8.2.0/var/cache" --exclude="8.2.0/var/log" .tmcbeans_mooc/ /mnt/nfs/alpha/backup/.tmcbeans_mooc/
#$RSYNC $RS_LINE $RS_EXTRA .stepmania-5.0/Save/ /mnt/nfs/alpha/games/Stepmania/Save/
#$RSYNC $RS_LINE $RS_EXTRA .stepmania-5.0/Songs/ /mnt/nfs/alpha/games/Stepmania/Songs/
#$RSYNC $RS_LINE $RS_EXTRA .dolphin-emu/GC/ /mnt/nfs/alpha/games/dolphin-emu/GC/
#$RSYNC $RS_LINE $RS_EXTRA .dolphin-emu/StateSaves/ /mnt/nfs/alpha/games/dolphin-emu/StateSaves/
#$RSYNC $RS_LINE $RS_EXTRA .dolphin-emu/Wii/ /mnt/nfs/alpha/games/dolphin-emu/Wii/
#$RSYNC $RS_LINE $RS_EXTRA .minecraft/saves/ /mnt/nfs/alpha/games/minecraft_saves/
#$RSYNC $RS_LINE $RS_EXTRA roms/ /mnt/nfs/alpha/games/roms/ --exclude 'wii' --exclude 'gcn'
