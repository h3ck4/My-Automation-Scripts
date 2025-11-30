#!/bin/bash

# Define your sinks
HEADPHONE="alsa_output.usb-Elite_Silicon_USB_Audio_Device-00.analog-stereo"
SYSTEM="alsa_output.pci-0000_0f_00.6.analog-stereo"

# Get current default sink
CURRENT_SINK=$(pactl info | grep "Default Sink" | awk '{print $3}')

# Decide new sink (toggle)
if [[ "$CURRENT_SINK" == "$HEADPHONE" ]]; then
  NEW_SINK="$SYSTEM"
else
  NEW_SINK="$HEADPHONE"
fi

echo "Switching audio from $CURRENT_SINK to $NEW_SINK"

# Set new default sink
pactl set-default-sink "$NEW_SINK"

# Move all active streams to new sink
for INPUT in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input "$INPUT" "$NEW_SINK"
done


# this file will make your linux mint or any other linux to switch between different audio input with one ( 1 ) key. so when you hit for instance fX or any keyX, you can swap your audio ouput to headphone for instance... its cool you need to change it though.