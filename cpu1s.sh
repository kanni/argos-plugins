#!/usr/bin/env bash

usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}'| awk '{printf "%.0f\n", $1}')

echo "$usage%"
echo "---"
echo "System monitor|iconName=utilities-system-monitor-symbolic bash=gnome-system-monitor terminal=false"
echo "Refresh |iconName=view-refresh-symbolic refresh=true"