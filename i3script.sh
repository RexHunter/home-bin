#!/bin/bash

# shell scipt to prepend i3status with more stuff

i3status | while :
do
        read line
        LG=$(xkblayout-state print %s) 
        echo "${LG^^} | $line" || exit 1
done
