#!/bin/sh

# Get the output index of the currently focused monitor
OUTPUT_INDEX="$(swaymsg -t get_outputs | jq 'map(.focused)|to_entries|.[]|select(.value)|.key+1')"

# The action to be performed ('move' or 'switch')
ACTION=$1

# The workspace number to move/switch to
NUMBER=$2

# Check the action and perform accordingly
case "$ACTION" in
    move)
        # Move the focused container to the workspace on the current output
        swaymsg move container to workspace "$OUTPUT_INDEX:$NUMBER"
        ;;
    switch)
        # Switch to the workspace on the current output
        swaymsg workspace "$OUTPUT_INDEX:$NUMBER"
        ;;
    *)
        echo "Invalid action: $ACTION"
        echo "Usage: $0 {move|switch} <workspace_number>"
        exit 1
        ;;
esac

