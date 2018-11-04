#!/bin/bash

function myHelp () {
# Using a here doc with standard out.
cat <<-END
Usage:
------
   -h | --help
     Display this help
   -a {action}
    actions can be as follow
    cc = Total Core Counter
    pp = Current Process's Priority
    tnp = Total Number of Processes by current user
    ofh = Open File handlers based on current user
    mfh = Maximum number of File Handlers for current user
END
}

while getopts ":a:h:" opt; do
  case $opt in
    a)
      echo "-a was triggered, Parameter: $OPTARG" >&2
      if [ $OPTARG = "cc" ] 
      then
        grep -c ^processor /proc/cpuinfo
      elif [ $OPTARG = "pp" ]
      then
         cat /proc/$BASHPID/stat | awk '{print "priority " $18 " nice " $19}'
      elif [ $OPTARG = "tnp" ] 
      then
         ps aux  | awk '{print $1}' | grep $USER | wc -l
      elif [ $OPTARG = "ofh" ]
      then
         lsof | grep $USER | awk '{print $NF}' | sort | wc -l
      elif [ $OPTARG = "mfh" ]
      then
         ulimit -Hn
      fi
      ;;
    h)
      myHelp
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      myHelp
      exit 1
      ;;
  esac
done
