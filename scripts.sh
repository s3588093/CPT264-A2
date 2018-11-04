#!/bin/bash
#get the argument of the script
ARGUMENT=$1
#argument 'net' should output network information.
if [ $1 = "net" ]
then
  #ip addr show gets IP Information of network interfaces
  ip addr show
  #ip link show gets Mac Address information of network interfaces
  ip link show
#argument 'memory' should output memory information on system
elif [ $1 = "memory" ]
then
  #free = gets memory information, -m = retrieves it in megabytes
  free -m
#argument 'storage' should output storage information of system
elif [ $1 = "storage" ] 
then
  #df = gets storage information, -h = retrieves it in human readable format
  df -h
elif [ $1 = "uptime" ] 
then
  uptime
fi

