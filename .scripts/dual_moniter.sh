#!/bin/bash

dp1=$(xrandr --query | grep 'DP-1-1')
dp2=$(xrandr --query | grep 'DP-2-1-8')

if [[ $dp1 = *connected* ]] && [[ $dp2 = *connected* ]]; then
    xrandr --output DP-2-1-8 --primary --mode 1920x1200 --rotate normal --output DP-1-1 --mode 1920x1080 --rotate normal --left-of DP-2-1-8 
fi
