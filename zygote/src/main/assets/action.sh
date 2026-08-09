#!/system/bin/sh

# NOTE: `service.sh` already replace whole description= line so i don't think re-copy is neccessary ~~i guess~~
MODDIR=/data/adb/modules/hma_oss_zygisk

# launch manager first
am start org.frknkrc44.hma_oss/org.frknkrc44.hma_oss.ui.activity.MainActivity

# reload module status
sh "$MODDIR"/service.sh
echo "Updated module status"
