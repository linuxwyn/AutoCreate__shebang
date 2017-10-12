#!/bin/bash

if [ -n "$2" ]
then
      case $1 in
        py) filename=$2".py"
            program=python;;
        pl) filename=$2".pl"
            program=perl;;
        sh) filename=$2".sh"
            program=bash;;
        *) echo 'Usage: psp [py|pl|sh] [filename]'
            exit ;;
      esac
else
      echo 'Usage: psp [py|pl|sh] [filename]'
      exit
fi

if [ -f $filename ]
then
      echo "$filename already exists"
      exit
else
      touch $filename
      echo "#\!`which $program`" | sed -n 's/\\//p' > $filename
      chmod +x $filename
      vim $filename
fi
      
