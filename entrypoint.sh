#!/bin/sh

sudo service sshd restart
exec $@
