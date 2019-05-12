#!/bin/bash

#
# Centos7 Official AMI: ami-02eac2c0129f6376b
#

sudo yum update -y && sudo yum install -y epel-release && sudo yum clean all

sudo yum install -y \
    htop \
    wget \
    pciutils \
    gcc \
    vim \
    make \
    openssl \
    openssl098e \
    openssl-devel \
    patch \
    libcurl \
    libcurl-devel \
    expat-devel \
    bzip2 \
    bzip2-devel

# git
export GIT_VER="2.20.1"

wget https://www.kernel.org/pub/software/scm/git/git-$GIT_VER.tar.gz \
    && tar xf git-$GIT_VER.tar.gz && cd git-$GIT_VER \
    && make -j"$(nproc --all)" prefix=/usr/local all \
    && sudo make prefix=/usr/local -j"$(nproc --all)" install \
    && cd .. && rm -f git-$GIT_VER.tar.gz && rm -rf git-$GIT_VER

# Makes git use https by default
git config --global url."https://".insteadOf git://

# Python3 - miniconda

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
sudo bash Miniconda3-latest-Linux-x86_64.sh -b -p /usr/local/conda/miniconda3
rm -f Miniconda3-latest-Linux-x86_64.sh

export PATH="$PATH:/usr/local/conda/miniconda3/bin"
echo 'export PATH=$PATH:/usr/local/conda/miniconda3/bin' >> ~/.bashrc
conda update -n base conda -y

# This will be used by PyCall.jl julia package.
echo 'export PYTHON=/usr/local/conda/miniconda3/bin/python3' >> ~/.bashrc

# R
sudo yum -y install \
    lapack-devel blas-devel libicu-devel \
    unixodbc-devel boost boost-devel libxml2 libxml2-devel \
    R

sudo yum clean all

# Julia
cd
wget https://julialang-s3.julialang.org/bin/linux/x64/1.1/julia-1.1.0-linux-x86_64.tar.gz
tar xf julia-1.1.0-linux-x86_64.tar.gz
rm -f julia-1.1.0-linux-x86_64.tar.gz
mkdir $HOME/.local
mkdir $HOME/.local/bin
ln -s  $HOME/julia-1.1.0/bin/julia $HOME/.local/bin/julia
julia -e 'using Pkg; Pkg.update()'
