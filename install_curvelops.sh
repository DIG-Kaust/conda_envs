#!/bin/bash
# Installer for Curvelops
# 
# Run: ./install_curvelops.sh
#
# M. Ravasi, 04/02/2021

echo 'Installing Curvelops'

# install gcc-4 and g++4
#sudo add-apt-repository ppa:ubuntu-toolchain-r/test
#sudo apt-get install gcc-4.8
#sudo apt-get install g++-4.8

export CC=/usr/bin/gcc-4.8
export CXX=/usr/bin/g++-4.8

# install FFTW
wget http://www.fftw.org/fftw-2.1.5.tar.gz
tar -xvf fftw-2.1.5.tar.gz
cd fftw-2.1.5
make clean
./configure --with-pic --prefix=${PWD} --with-gcc=/usr/bin/gcc-4.8
make 
make install
cd ..

# install CurveLab (do steps 1 and 2 before running this script!)
# 1. Download it from http://www.curvelet.org/ (needs to register...)
# 2. Change CC AND CXX in makefile.opt
cd CurveLab-2.1.3
make clean
make lib
make test
cd ..

# install Python env
conda env create -f environment_pylops_37.yml
source activate pylops_37
echo 'Created and activated environment:' $(which python)

# option1: install curvelops from github
export FFTW=${PWD}/fftw-2.1.5
export FDCT=${PWD}/CurveLab-2.1.3
python3 -m pip install git+https://github.com/PyLops/curvelops@main

# option2: clone install curvelop (doesnt work)
# git clone https://github.com/PyLops/curvelops.git
# cd curvelops
# rm -rf curvelops.egg-info/ build/ dist/
# rm -rf /home/ravasim/miniconda3/envs/pylops_37/lib/python3.7/site-packages/curvelops*
# python3 setup.py clean
# python3 setup.py build_ext --inplace
# python3 setup.py install # --user 
 
# check curvelops works as expected
echo 'Checking pylops version and running a command...'
python -c 'import numpy as np; import curvelops as cl; x = np.random.normal(0., 1., (100, 50)); FDCT = cl.FDCT2D(dims=(100, 50)); c = FDCT * x.ravel(); print(c)'

echo 'Done!'

