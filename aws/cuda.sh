#!/bin/bash

cd
wget https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.1.105-1.x86_64.rpm
sudo rpm -i cuda-repo-rhel7-10.1.105-1.x86_64.rpm
sudo yum clean all
sudo yum -y install cuda
sudo reboot
