#!/system/bin/sh

MODDIR=/data/adb/modules/hma_oss_zygisk
LOG_FILE=$(ls -1 /data/misc/hide_my_applist_*/log/runtime.log 2>/dev/null | head -n 1)


# if there's /, \ or & symbol, replace it with \/ (escape /), \\ (escape \) or \& (escape &)
# in future, if HMA-OSS changed description that has / \ or & symbol, it will not break ig :p
ORIG_DESC=$(grep "^description=" "$MODDIR/module.prop.bak" | cut -d= -f2-)
ORIG_DESC_FIX=$(printf '%s\n' "$ORIG_DESC" | sed 's/[&/\]/\\&/g')


MODE=$(grep "HMA service initialized in mode" "$LOG_FILE" | tail -1 | awk '{print $NF}')

case "$MODE" in
    1) STATUS="[✅ System service loaded]" ;;
    2) STATUS="[⚠️ Sick mode - Disabled hooks]" ;;
    3) STATUS="[⏳ Loading]" ;;
    -*) STATUS="[❌ Not loaded - Unknown error]" ;;
    *)  STATUS="[❓ Unknown]" ;;
esac

sed -i "s/^description=.*/description=$STATUS $ORIG_DESC_FIX/" "$MODDIR/module.prop"
