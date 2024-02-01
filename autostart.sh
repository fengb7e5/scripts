#!/bin/bash

dir=$(dirname $0)
export LANG=zh_CN.UTF-8

#export http_proxy="http://127.0.0.1:7890"
#export https_proxy="https://127.0.0.1:7890"

# statusBar
/bin/bash $dir/dwm-status.sh &

feh -bg-fill ~/Pictures/* 

# picom (window composer)
if [ -z "$(pgrep picom)" ]; then
    # picom --config $dir/configs/picom.conf -b --experimental-backends
    picom  -b
fi
#polkit (require lxsession or lxsession-gtk3)
if [ -z "$(pgrep lxpolkit)" ]; then
    lxpolkit &
fi

# autolock (screen locker)
if [ -z "$(pgrep xautolock)" ]; then
    xautolock -time 30 -locker betterlockscreen -detectsleep &
fi

if [ -z "$(pgrep nm-applet)" ]; then
    nm-applet &
fi

if [ -z "$(pgrep udiskie)" ]; then
    udiskie -sn &
fi

# mate-power-manager &
# volumeicon &
if [ -z "$(pgrep fcitx5)" ]; then
	fcitx5 -d
fi
