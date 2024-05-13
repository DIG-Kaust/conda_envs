#!/bin/bash
# 
# Installer for PyLops GPU environment with PyTorch+Cupy and CUDA 11.5
# 
# Run: ./install_pylops_gpu_3090.sh pylops-gpu_dir
# 
# M. Ravasi, 04/03/2021

echo 'Creating PyLops GPU environment with PyTorch+Cupy and CUDA 11.5'

# load module cuda 11.5
module load cuda/11.5.0/gcc-7.5.0-syen6pj
echo 'Loaded cuda:' $(which nvcc) $(which nvcc)
echo $CUDA_HOME

# create conda env
conda env create -f environment_pylops_gpu_3090.yml
source ~/miniconda3/etc/profile.d/conda.sh
conda activate pylops_gpu_3090
conda env list
echo 'Created and activated environment:' $(which python)

# install pylops-gpu in developer mode
if [ -z "$1" ];
then
   echo 'No library installed in dev mode... Installing pylops from conda'
   pip install pylops-gpu
else
   cd $1
   pip install -e .
fi

# check cupy works as expected
echo 'Checking cupy version and running a command...'
python -c 'import cupy as cp; print(cp.__version__); import torch; print(torch.__version__);  print(torch.cuda.get_device_name(torch.cuda.current_device())); print(torch.ones(10).to("cuda:0"))'

echo 'Done!'

