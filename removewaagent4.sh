#!/bin/sh
hostname > /tmp/host
date >> /tmp/log.txt
#/bin/sleep 180
date >> /tmp/log.txt
echo hostname $HOSTNAME >> /tmp/log.txt
export AZHOST=$(cat /tmp/host)
echo azhost $AZHOST >> /tmp/log.txt
cp /var/log/wa* /tmp/
/sbin/chkconfig waagent off
/sbin/service waagent stop
/usr/sbin/waagent -deprovision -force > /tmp/waagent-dep.log
/etc/init.d/omid stop
/etc/init.d/omsagent* stop
chkconfig omid off
OMS=$(chkconfig |grep oms|awk '{print $1}')
chkconfig $OMS off
hostname $AZHOST
sed -i "s/localhost.localdomain/$AZHOST/" /etc/sysconfig/network
service sshd restart
echo "search win.mrxfx.com" > /etc/resolv.conf
echo "nameserver 10.108.4.18" >> /etc/resolv.conf
echo "nameserver 10.218.24.21" >> /etc/resolv.conf
