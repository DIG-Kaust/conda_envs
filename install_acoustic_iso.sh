#!/bin/bash
# 
# Installer for Isotropic propagators Stanford
# 
# Run: ./install_acoustic_iso.sh
#
# M. Ravasi, 04/02/2021

echo 'Creating Isotropic propagators Stanford'

# Installing GPU-wave-equation library
git clone https://github.com/gbarnier/acoustic_isotropic_operators.git 
cd acoustic_isotropic_operators

# Creating necessary environment
conda create -n EGS
conda activate EGS
conda install -c anaconda cmake
conda install -c conda-forge flex
conda install -c anaconda boost
conda install -c statiskit libboost-dev
conda install -c conda-forge tbb tbb-devel
#conda install -c conda-forge pybind11
conda install dask
conda install -c conda-forge dask-jobqueue
conda install -c anaconda scipy
conda install -c conda-forge matplotlib
conda install -c anaconda jupyter
conda install h5py
conda install -c conda-forge scikit-build
conda install -c conda-forge setuptools_scm
conda install -c anaconda pytest
conda install numba
conda install gcc_linux-64 gxx_linux-64 gfortran_linux-64

git submodule update --init --recursive -- acoustic_iso_lib/external/ioLibs
git submodule update --init --recursive -- acoustic_iso_lib/external/pySolver

mkdir build
cd build

module load cuda/10.2.89/gcc-7.5.0-jr6kobf
cmake -DCMAKE_INSTALL_PREFIX=../local -DCMAKE_CUDA_COMPILER=/sw/workstations/apps/linux-ubuntu18.04-ivybridge/cuda/10.2.89/gcc-7.5.0/jr6kobfyx2tfk3rpz7cjhrzp7flj2cqn/bin/nvcc -DBUILD_SHARED_LIBS=True -DCMAKE_CXX_COMPILER=`ls ${CONDA_PREFIX}/bin/*g++` -DCMAKE_C_COMPILER=`ls ${CONDA_PREFIX}/bin/*gcc` -DCMAKE_Fortran_COMPILER=`ls ${CONDA_PREFIX}/bin/*gfortran` ../acoustic_iso_lib/

make -j4
make install

cd ..

# Setting module file
sed -i  's|path-to-EGSlib|'$PWD'|g' module/EGSlib
sed -i  's|MAJOR.MINOR|'`python3 -V | colrm 1 7 | colrm 4`'|g' module/EGSlib

# Changing activation and deactivation env_vars
touch $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
echo '#!/bin/sh' >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
echo "module use ${PWD}/module" >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh
echo "module load EGSlib"  >> $CONDA_PREFIX/etc/conda/activate.d/env_vars.sh

conda deactivate
conda activate EGS

touch $CONDA_PREFIX/etc/conda/deactivate.d/env_vars.sh
echo '#!/bin/sh' >> $CONDA_PREFIX/etc/conda/deactivate.d/env_vars.sh
echo "module unload EGSlib"  >> $CONDA_PREFIX/etc/conda/deactivate.d/env_vars.sh

cp build/external/ioLibs/external/genericIO/external/buffers/external/json/libjsonCpp.so local/lib/

echo 'Done!'
