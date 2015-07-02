#!/bin/bash
set -x

sed -i -e 's/SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux
setenforce 0
