#!/bin/sh

while true; do

    CAPACITY=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    [ "$STATUS" = "Discharging" ] && [ "$CAPACITY" -lt 20 ] && \
    dunstify -u critical -r 12 -a power_supply_low "Low Battery" "You are running low on battery ($CAPACITY%).\nPlease plug in the charger." && \
    echo "Low Battery notification sent" && $(paplay .config/dunst/notifications/sounds/clearly.ogg) || \
    echo "Low Battery notification not sent"

    [ "$STATUS" = "Charging" ] && [ "$CAPACITY" -gt 97 ] && \
    dunstify -u normal -r 12 -a power_supply_full "Battery Full" "Charge full ($CAPACITY%).\nPlease unplug from charger." && \
    echo "Full Battery notification sent" && $(paplay .config/dunst/notifications/sounds/clearly.ogg) || \
    echo "Full Battery notification not sent"

    sleep 30
done