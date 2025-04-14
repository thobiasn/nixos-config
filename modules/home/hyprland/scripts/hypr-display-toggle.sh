#!/usr/bin/env bash

INTERNAL="eDP-1"
EXTERNAL_1="HDMI-A-1"
EXTERNAL_2="DP-3"

if hyprctl monitors | grep -q "$EXTERNAL_1" || hyprctl monitors | grep -q "$EXTERNAL_2"; then
    hyprctl keyword monitor "$INTERNAL, disable"
else
    hyprctl keyword monitor "$INTERNAL, preferred, auto, 1"
fi
