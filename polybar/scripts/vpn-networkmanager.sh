#!/bin/sh

state=$(nmcli -t -f TYPE,state connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 2)
timestamp=$(nmcli -t -f TYPE,TIMESTAMP connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 2)
vpn="$(nmcli -t -f NAME,TYPE connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 1)"

[ "$state" = "activating" ] && echo "Connecting to $vpn..."

if [ -n "$vpn" ]; then
	timestamp_diff_sec=$(($(date +%s)-$timestamp))
	[ "$(($timestamp_diff_sec/3600))" -lt "10" ] && elapsed_hr="0"$(($timestamp_diff_sec/3600)) || elapsed_hr=$(($timestamp_diff_sec/3600))
	[ "$(($timestamp_diff_sec/60))" -lt "10" ] && elapsed_min="0"$(($timestamp_diff_sec/60)) || elapsed_min=$(($timestamp_diff_sec/60))
	[ "$(($timestamp_diff_sec%60))" -lt "10" ] && elapsed_sec="0"$(($timestamp_diff_sec%60)) || elapsed_sec=$(($timestamp_diff_sec%60))
	echo "$vpn($elapsed_hr:$elapsed_min:$elapsed_sec)"
else
	echo ""
fi