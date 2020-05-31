#!/bin/bash

ip="192.168.243.4"
username="root"
password="xiho1019988975"
keypath="/root/.ssh/id_rsa.pub"

# FTP:proftpd
# white list
PRO_WHITE_IP="192.168.243.4"
# virtual user
PRO_VIRTUAL_USER="user1"
PRO_VIRTUAL_PASS="xiho1019988975"
PRO_DIR="/srv/ftp"
PRO_UID="1024"
PRO_GID="1024"
PRO_VIR_DIR="/home/${PRO_VIRTUAL_USER}"
PRO_LIMIT="700"
PRO_FTPASSWD_DIR="/usr/local/etc/proftpd"
PRO_PASSWD_DIR="${PRO_FTPASSWD_DIR}/passwd"
PRO_GROUP_DIR="${PRO_FTPASSWD_DIR}/group"
PRO_GROUP_NAME="virtualusers"



# NFS
# client ip
NFS_CLIENT_IP="192.168.243.4"


# samba
# samba user
SAMBA_USERNAME="smbuser"
SAMBA_PASSWORD="xiho1019988975"
SAMBA_GROUP="smbgroup"
# directories
SAMBA_GUEST_DIR="/home/samba/guest"
SAMBA_DEMO_DIR="/home/samba/demo"
SAMBA_GUEST_LIMIT="2775"
SAMBA_DEMO_LIMIT="2770"

# interfaces
HOST_ONLY_INTER="enp0s3"
NAT_INTER="enp0s8"
INTERNAL_INTER="enp0s9"
INTERNAL_IP="192.168.243.3"
INTERNAL_NETMASK="255.255.255.0"

# DHCP
# subnet address
SUBNET_SUB="192.168.57.0"
SUBNET_BOTTOM="192.168.57.150"
SUBNET_TOP="192.168.57.200"
#SUBNET_BROADCAST="192.168.254.255"

# DNS
# use INTERNAL_IP
