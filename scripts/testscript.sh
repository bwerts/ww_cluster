#!/bin/bash

dnf install epel-release glibc-langpack-en -y
dnf install ansible -y

/usr/bin/ansible-playbook /root/ww_cluster/ansible/compute_img.yaml
