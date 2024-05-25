#!/bin/bash
# 
# Installer for PyLops GPU environment with Cupy and CUDA 11.8 and MPI4Py
# 
# Run: ./install_pylops_cupy_mpi4py_3090.sh pylops_dir
# 
# M. Ravasi, 26/08/2021

echo 'Creating PyLops GPU+MPI environment'

# create conda env
export CONDA_ALWAYS_YES="true"
conda env create -f environment_pylops_cupy_mpi4py_3090.yml
source $CONDA_PREFIX/etc/profile.d/conda.sh
conda activate pylops_cupy_mpi4py_3090
echo 'Created and activated environment:' $(which python)

# install pylops in developer mode
if [ -z "$1" ];
then
   echo 'No library installed in dev mode... Installing pylops from conda'
   conda install -c conda-forge pylops
else
   cd $1
   pip install -e .
fi

# check cupy works as expected
echo 'Checking cupy version and running a command...'
python -c 'import cupy as cp; print(cp.__version__); cp.ones(10000)*10'
python -c 'import numpy as np; import pylops; print(pylops.__version__); pylops.Identity(10) * np.ones(10)'

echo 'Done!'

