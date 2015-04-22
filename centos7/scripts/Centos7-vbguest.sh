##!/bin/bash

#Create mount 
mkdir /media/cdrom
mount /dev/cdrom /media/cdrom

#Install guest additions
sudo ./media/cdrom/VBoxLinuxAdditions.run 