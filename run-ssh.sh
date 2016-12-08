#!/bin/bash

[ -z $1 ] && echo -e "\n\nusage: $0 (user|root)\n\n" && exit

SSH_USER=$1

# let's do this everytime we are trying to connect
ssh-keygen -f "/home/ivan/.ssh/known_hosts" -R [localhost]:8022

sshpass -p "pass" ssh -o "StrictHostKeyChecking=no" -p 8022 ${SSH_USER}@localhost

