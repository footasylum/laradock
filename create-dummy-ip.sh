#!/bin/bash

if [ -z "$ip_address" ]
then
  $ip_address="1.1.1.1/24"
  echo "No IP address supplied.  Creating a dummy interface with a default ip of 1.1.1.1/24"
else
  echo "Creating a dummy interface of $ip_address"
fi


ip link add dummy1 type dummy
ip addr add "$ip_address" dev dummy1
ip link set dummy1 up
