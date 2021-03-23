#!/bin/bash
# 
# Installer for PyLops GPU environment with Cupy+Cusignal and CUDA 10.2
# 
# Run: ./install_pylops_cupy_cusignal.sh pylops_dir
# 
# M. Ravasi, 07/02/2021

echo 'Creating PyLops GPU environment'

# load module cuda 10.2
module load cuda/10.2.89/gcc-7.5.0-jr6kobf
echo 'Loaded cuda:' $(which nvcc) $(which nvcc)
echo $CUDA_HOME

# create conda env
export CONDA_ALWAYS_YES="true"
conda env create -f environment_pylops_cupy_cusignal.yml
source activate pylops_cupy_cusignal
echo 'Created and activated environment:' $(which python)

# install cusignal
conda install -c rapidsai -c nvidia -c numba -c conda-forge \
    cusignal=0.17 cudatoolkit=10.2 -y
unset CONDA_ALWAYS_YES 

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

echo 'Done!'

