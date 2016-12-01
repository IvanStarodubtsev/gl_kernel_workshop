#!/bin/bash -ex

[ -z $1 ] && exit

SSH_USER=$1

sshpass -p "pass" ssh -o "StrictHostKeyChecking=no" -p 8022 ${SSH_USER}@localhost

