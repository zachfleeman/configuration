#!/bin/bash
focused=$(aerospace list-windows --focused)
if echo "$focused" | grep -qi "Ghostty"; then
    aerospace close --quit-if-last-window
else
    aerospace close
fi
