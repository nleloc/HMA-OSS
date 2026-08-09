#!/system/bin/sh

# this script contain code from ReZygisk
# original code: https://github.com/PerformanC/ReZygisk/blob/main/module/src/uninstall.sh
# Author: PerformanC
# License: GPLv3

set -e

rm -f /data/adb/post-fs-data.d/hmaoss.sh
rm -f /data/adb/post-mount.d/hmaoss.sh

# INFO: Only removes if dir is empty
rmdir /data/adb/post-fs-data.d 2>/dev/null || true
rmdir /data/adb/post-mount.d 2>/dev/null || true

exit 0
