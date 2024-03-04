#!/bin/sh

# Get the output index of the currently focused monitor
OUTPUT_NAME="$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')"

# The action to be performed ('move' or 'switch')
ACTION=$1

# The workspace number to move/switch to
NUMBER=$2

case "$ACTION" in
    move)
        # Move the focused container to the workspace on the current output
        swaymsg move container to workspace "$OUTPUT_NAME:$NUMBER"
        ;;
    switch)
        # Switch to the workspace on the current output
        swaymsg workspace "$OUTPUT_NAME:$NUMBER"
        ;;
    *)
        echo "Invalid action: $ACTION"
        echo "Usage: $0 {move|switch} <workspace_number>"
        exit 1
        ;;
esac

