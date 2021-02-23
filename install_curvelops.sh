# Installer for Curvelops
# 
# Run: ./install_curvelops.sh
#
# M. Ravasi, 04/02/2021

echo 'Installing Curvelops'

# move to directory where to place libraries
cd /home/ravasim/Documents/OpenSource/curvelets

# install gcc-4 and g++4
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get install gcc-4.8
sudo apt-get install g++-4.8

export CC=/usr/bin/gcc-4.8
export CXX=/usr/bin/g++-4.8

# install FFTW
wget http://www.fftw.org/fftw-2.1.5.tar.gz
tar -xvf fftw-2.1.5.tar.gz
cd fftw-2.1.5
make clean
./configure --with-pic --prefix=/home/ravasim/Documents/OpenSource/curvelets/fftw-2.1.5 --with-gcc=/usr/bin/gcc-4.8
make 
make install
cd ..

# download CurveLab from http://www.curvelet.org/ (needs to register...)
cd CurveLab-2.1.3
# change CC AND CXX in makefile.opt
make clean
make lib
make test

# install Python env
cd ..
conda env create -f environment_pylops_36.yml
conda activate pylops_36

# install curvelops
export FFTW=/home/ravasim/Documents/OpenSource/curvelets/fftw-2.1.5
export FDCT=/home/ravasim/Documents/OpenSource/curvelets/CurveLab-2.1.3

# option1: instal directy from git repo
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
python3 -c 'import numpy as np; import curvelops as cl; np.random.seed(5); x = np.random.normal(0., 1., (100, 50)); FDCT = cl.FDCT2D(dims=(100, 50)); c = FDCT * x.ravel(); print(c)'

echo 'Done!'

