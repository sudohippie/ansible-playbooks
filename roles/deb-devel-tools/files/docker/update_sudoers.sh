#!/bin/sh

SUDOERS="/etc/sudoers"

echo "\n" >> $SUDOERS
echo "# enable running docker with out sudo" >> $SUDOERS
echo "rsidhanti localhost = (root) NOPASSWD: /usr/bin/docker" >> $SUDOERS
