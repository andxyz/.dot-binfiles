#!/bin/bash

ANSIBLE_PATH=/Users/andxyz/score/ansible-playbooks

# USAGE: ansible_ssh environment group [instance]
# EXAMPLE: ansible_ssh api-staging api_pulse_worker 1

(cd $ANSIBLE_PATH;git checkout master)

case $# in

  0) (cd $ANSIBLE_PATH; ls $ANSIBLE_PATH/inventories | sort);;

  1) (cd $ANSIBLE_PATH; $ANSIBLE_PATH/run $1 | grep '\[*\]' | awk '{gsub(/[\[\]]/,"");print}' | sort);;

  2) (cd $ANSIBLE_PATH; $ANSIBLE_PATH/run $1 | sed -n -e "/\[$2\]/,/^$/p" | grep -v "\[$2\]" | awk '{ print ( $1 ) }' | nl)
     IP_ADDRESS=`(cd $ANSIBLE_PATH; $ANSIBLE_PATH/run $1 | sed -n -e "/\[$2\]/,/^$/p" | grep -v "\[$2\]" | awk '{ print ( $1 ) }' | sed -n "1p")`
     ssh -t ubuntu@$IP_ADDRESS screen -U -O -DR roel;;

  3) IP_ADDRESS=`(cd $ANSIBLE_PATH; $ANSIBLE_PATH/run $1 | sed -n -e "/\[$2\]/,/^$/p" | grep -v "\[$2\]" | awk '{ print ( $1 ) }' | sed -n "$3p")`
     ssh -t ubuntu@$IP_ADDRESS screen -U -O -DR roel;;
esac
