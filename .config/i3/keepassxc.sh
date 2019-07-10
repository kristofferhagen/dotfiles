#!/usr/bin/env sh

if [ ! `pgrep keepassxc` ]; then
    echo start
    /usr/bin/keepassxc &
    sleep 1
fi

i3-msg '[class="keepassxc"] scratchpad show'
