##!/bin/bash

#Remove HARDW address from ifcfg file
sed -i "/^HARDW/d" /etc/sysconfig/network-scripts/ifcfg-enp0s3

#Restart networking
systemctl restart network.service

#Updates
yum update -y
yum upgrade -y

#Install software
yum install -y openssh-server ntp git gcc kernel-devel make wget bzip2 net-tools httpd

#Enable services
systemctl enable ntpd.service
systemctl enable httpd.service


#Add vagrant to sudoers and remove requiretty
sed -i "s/^\(Defaults.*requiretty\)/#\1/" /etc/sudoers
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#Creare SSH directory and place vagrant keys
mkdir /home/vagrant/.ssh
curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub >> /home/vagrant/.ssh/authorized_keys

#Change SSH directory owner and permissions
chmod 600 /homs/vagrant/.ssh/autorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

#Cleanup
rm -rf /tmp/*
yum clean all
history -c

#Shutdown
#shutdown -r now