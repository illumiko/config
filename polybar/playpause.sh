#!/bin/sh
pause=""
play=""
title=$(mpc status | grep -Po "(?<=\/).*(?=.mp3)")
if mpc status | grep -q "playing" ; then
  echo $play $title 
else
    echo $pause $title
fi
