#!/bin/bash

# use this script to disable Linux Azure VM Agent via a custom script extension remotely
echo "stopping the azure agent..."
/usr/bin/systemctl stop waagent
echo "disabling the azure agent..."
/usr/bin/systemctl disable waagent
echo "done stopping and disabling the azure agent..."
echo "renaming the azure agent..."
mv -i /usr/sbin/waagent /usr/sbin/waagent_disabled
echo "done renaming the azure agent..."
