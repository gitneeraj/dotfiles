#!/bin/sh

CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

[ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -lt 65 ] && \
/usr/bin/notify-send -u critical -a power_supply_low "Low Battery" "You are running low on battery ($CAPACITY%).\nPlease plug in the charger." && \
echo "Low Battery notification sent" && $(paplay .config/dunst/notifications/sounds/clearly.ogg) || \
echo "Low Battery notification not sent"

[ "$STATUS" = "Charging" ] && [ "$CAPACITY" -gt 97 ] && \
/usr/bin/notify-send -u normal -a power_supply_full "Battery Full" "Charge full ($CAPACITY%).\nPlease unplug from charger." && \
echo "Full Battery notification sent" && $(paplay .config/dunst/notifications/sounds/clearly.ogg) || \
echo "Full Battery notification not sent"
