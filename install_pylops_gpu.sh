#!/bin/bash
# 
# Installer for PyLops GPU environment with Pytorch+Cupy_cupy_cupy and CUDA 10.2
# 
# Run: ./install_pylops_gpu.sh pylops-gpu_dir
# 
# M. Ravasi, 03/02/2021

echo 'Creating PyLops GPU environment with Pytorch and CUDA 10.2'

# load module cuda 10.2
module load cuda/10.2.89/gcc-7.5.0-jr6kobf
echo 'Loaded cuda:' $(which nvcc) $(which nvcc)
echo $CUDA_HOME

# create conda env
conda env create -f environment_pylops_gpu.yml --yes
source activate pylops_gpu
echo 'Created and activated environment:' $(which python)

# install pylops-gpu in developer mode
if [ -z "$1" ];
then
   echo 'No library installed in dev mode...'
else
   cd $1
   pip install -e .
fi

# check cupy works as expected
echo 'Checking cupy version and running a command...'
python -c 'import cupy as cp; print(cp.__version__); import torch; print(torch.__version__);  print(torch.cuda.get_device_name(torch.cuda.current_device())); print(torch.ones(10).to("cuda"))'

echo 'Done!'

