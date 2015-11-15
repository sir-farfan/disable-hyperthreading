#!/bin/bash
# Author: Ismael Farfan
# Source: https://github.com/sir-farfan/disable-hyperthreading
# Licence: GPL v2

if [ "$1" = "1" ]; then
  for c in /sys/devices/system/node/node0/cpu?; do
    if [ -e "$c/topology/thread_siblings_list" ]; then
      sibling=`awk -F "," '{print $2}' < $c/topology/thread_siblings_list`
      # echo sibling of $c $sibling
      echo 0 > /sys/devices/system/node/node0/cpu${sibling}/online
    fi
  done
else
  for c in /sys/devices/system/node/node0/cpu*/online; do
    echo 1 > $c
  done
fi

