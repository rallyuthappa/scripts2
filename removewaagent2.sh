#!/bin/bash

# use this script to deprovion a VM via a custom script extension remotely
echo "deprovisioning the azure agent..."
echo '* * * * * /tmp/deprovision.sh >/tmp/deprovision.log 2>&1' >/tmp/cronjob.tmp
echo 'sleep 120; sudo /usr/bin/systemctl stop waagent;sudo /usr/bin/systemctl disable waagent; mv -i /usr/sbin/waagent /usr/sbin/waagent_disabled; sudo crontab -r; sudo shutdown -h now' >/tmp/deprovision.sh
chmod a+x /tmp/deprovision.sh
crontab /tmp/cronjob.tmp
echo "deprovisioning over."
