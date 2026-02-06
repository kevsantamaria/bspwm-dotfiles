#!/bin/bash

temp=$(sensors k10temp-pci-00c3 2>/dev/null | awk '/temp1:/{gsub(/[+°C]/,"",$2); printf "%.0f", $2}')

if [ -z "$temp" ]; then
    echo "%{F#666666} N/A%{F-}"
    exit 0
fi

if [ "$temp" -lt 45 ]; then
    color="#7aa2f7"  # Blue
    icon=""
elif [ "$temp" -lt 60 ]; then
    color="#e0af68"  # Yellow  
    icon=""
elif [ "$temp" -lt 75 ]; then
    color="#E57C46"  # Orange
    icon=""
elif [ "$temp" -lt 85 ]; then
    color="#f7768e"  # Soft red
    icon=""
else
    color="#f14a69ff"  # Hard red
    icon=""
fi

echo "%{F$color}$icon ${temp}°C%{F-}"
