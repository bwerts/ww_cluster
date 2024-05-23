#!/bin/bash

dnf install epel-release glibc-langpack-en -y
dnf install ansible -y

/usr/bin/ansible-playbook /root/ansible-new/compute_img.yaml
