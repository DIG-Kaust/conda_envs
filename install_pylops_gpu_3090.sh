#!/bin/bash
# 
# Installer for PyLops GPU environment with Pytorch+Cupy+PyTorch and CUDA 11.0
# 
# Run: ./install_pylops_gpu_3090.sh pylops-gpu_dir
# 
# M. Ravasi, 04/03/2021

echo 'Creating PyLops GPU environment with Pytorch and CUDA 11.0'

# create conda env
conda env create -f environment_pylops_gpu_3090.yml
source ~/miniconda3/etc/profile.d/conda.sh
conda activate pylops_gpu_3090
conda env list
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
python -c 'import cupy as cp; print(cp.__version__); import torch; print(torch.__version__);  print(torch.cuda.get_device_name(torch.cuda.current_device())); print(torch.ones(10).to("cuda:0"))'

echo 'Done!'

