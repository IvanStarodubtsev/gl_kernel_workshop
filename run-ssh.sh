#!/bin/bash -evx

[ -z $1 ] && exit

SSH_USER=$1

sshpass -p "pass" ssh -p 8022 ${SSH_USER}@localhost
