#!/bin/bash
# 
# Installer for PyLops GPU environment with Cupy+Cusignal and CUDA 11.0
# 
# Run: ./install_pylops_cupy_cusignal_3090.sh pylops_dir
# 
# M. Ravasi, 26/08/2021

echo 'Creating PyLops GPU environment'

# load module cuda 11.0
module load cuda/11.1.0/gcc-7.5.0-4dnx5cr
echo 'Loaded cuda:' $(which nvcc) $(which nvcc)
echo $CUDA_HOME

# create conda env
export CONDA_ALWAYS_YES="true"
conda env create -f environment_pylops_cupy_cusignal_3090.yml
source ~/miniconda3/etc/profile.d/conda.sh
conda activate pylops_cupy_cusignal_3090
echo 'Created and activated environment:' $(which python)

# install cusignal
conda install -c rapidsai -c nvidia -c numba -c conda-forge \
    cusignal=21.08 cudatoolkit=11.0 -y
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

