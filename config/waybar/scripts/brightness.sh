#!/bin/bash
# Get value from ddcutil
VAL=$(ddcutil --bus 8 getvcp 10 --brief | awk '{print $4}')

# Fallback if ddcutil fails
if [ -z "$VAL" ]; then VAL=0; fi

# Output JSON
echo "{\"percentage\": $VAL}"
