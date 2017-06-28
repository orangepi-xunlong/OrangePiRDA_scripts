#!/bin/bash
#
# Export GPIO56 into /sys/class/gpio

echo "56" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio56/direction
