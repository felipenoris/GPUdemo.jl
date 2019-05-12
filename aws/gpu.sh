
sudo yum -y install kernel-devel
wget http://us.download.nvidia.com/tesla/418.40.04/NVIDIA-Linux-x86_64-418.40.04.run
chmod +x ./NVIDIA-Linux-x86_64-418.40.04.run
sudo ./NVIDIA-Linux-x86_64-418.40.04.run
rm -f ./NVIDIA-Linux-x86_64-418.40.04.run
sudo reboot

# run `nvidia-smi` after reboot
# to check that we can talk to the GPU
