#!/bin/bash

while true; do
    active=$(hyprctl activeworkspace -j | jq '.id')
    
    output=""
    for id in 1 2 3 4 5; do
        if [ "$id" = "$active" ]; then
            part="[$id]"
        else
            part="$id"
        fi
        
        if [ -z "$output" ]; then
            output="$part"
        else
            output="$output / $part"
        fi
    done
    
    echo "{\"text\": \"$output\"}"
    sleep 1
done
