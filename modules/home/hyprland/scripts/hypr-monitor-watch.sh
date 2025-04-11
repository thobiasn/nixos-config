#!/usr/bin/env bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
TOGGLE_SCRIPT="$SCRIPT_DIR/hypr-display-toggle.sh"

handle() {
  case $1 in
    monitoradded*) "$TOGGLE_SCRIPT" ;;
    monitorremoved*) "$TOGGLE_SCRIPT" ;;
  esac
}

SOCKET_PATH="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - UNIX-CONNECT:"$SOCKET_PATH" | while read -r line; do
  handle "$line"
done
