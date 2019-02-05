#!/usr/bin/env sh

if [ "$(playerctl status 2> /dev/null)" != "Playing" ]; then
    exit 1
fi
echo `playerctl metadata xesam:artist` - `playerctl metadata xesam:album` - `playerctl metadata xesam:title`
