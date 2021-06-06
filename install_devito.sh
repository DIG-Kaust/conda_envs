#!/bin/bash
# 
# Installer for Devito CPU environment
# 
# Run: ./install_devito.sh 
#
# M. Ravasi, 29/03/2021

echo 'Creating Devito CPU environment'

# create conda env
conda env create -f environment_devito.yml
source ~/miniconda3/etc/profile.d/conda.sh
conda activate devito
echo 'Created and activated environment:' $(which python)

# install devito
pip install git+https://github.com/devitocodes/devito.git

# check packages work as expected
echo 'Checking devito version and running a command...'
#python -c 'import numpy as np; import pylops; print(pylops.__version__); pylops.Identity(10) * np.ones(10)'

echo 'Done!'
