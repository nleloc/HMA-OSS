#!/system/bin/sh

# this script contain code from ReZygisk
# original code: https://github.com/PerformanC/ReZygisk/blob/e42886f48eb1c9eabcc94f08a3c3af0cdbffb99e/module/src/customize.sh#L102-L114
# Author: PerformanC
# License: GPLv3

cp "$MODPATH"/hmaoss.sh /data/adb/post-fs-data.d/hmaoss.sh

mkdir -p /data/adb/post-mount.d
cp "/data/adb/post-fs-data.d/hmaoss.sh" "/data/adb/post-mount.d/hmaoss.sh"

cp "$MODPATH/module.prop" "$MODPATH/module.prop.bak"
