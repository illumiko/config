#!/bin/sh
pause=""
play=""
title=$(mpc current)
if mpc status | grep -q "playing" ; then
  echo $play " " $title
else
    echo $pause " " $title
fi
