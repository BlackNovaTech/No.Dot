#!/bin/sh

if [[ -z $@ ]]
then
  seq -f 'Workspace %.0f' 1 4
else
  qdbus org.kde.KWin /KWin org.kde.KWin.setCurrentDesktop "$(echo $@ | sed 's/.* \(.*\)/\1/')" > /dev/null
fi
