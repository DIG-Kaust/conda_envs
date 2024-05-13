#!/bin/bash
# 
# Installer for Diffusers GPU environment and CUDA 11.8
# 
# Run: ./install_diffusers_3090.sh
# 
# M. Ravasi, 04/12/2023

echo 'Creating Diffusers GPU environment'

# create conda env
conda env create -f environment_diffusers_3090.yml
source ~/miniconda3_v23/etc/profile.d/conda.sh
#conda activate diffusers_3090
#conda env list
#echo 'Created and activated environment:' $(which python)

# check torch and diffusers work as expected
echo 'Checking torch version and running a command...'
python -c 'import torch; print(torch.__version__);  print(torch.cuda.get_device_name(torch.cuda.current_device())); print(torch.ones(10).to("cuda"))'
echo 'Checking diffusers version and running a command...'
python -c 'import diffusers; print(diffusers.__version__)'

echo 'Done!'
