#!/bin/bash
# 
# Installer for PyLops CPU environment with Python3.6
# 
# Run: ./install_pylops_36.sh pylops_dir
#
# M. Ravasi, 04/02/2021

echo 'Creating PyLops CPU environment (Python 3.6)'

# create conda env
conda env create -f environment_pylops_36.yml
source activate pylops_36
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

# check pylops works as expected
echo 'Checking pylops version and running a command...'
python -c 'import numpy as np; import pylops; print(pylops.__version__); pylops.Identity(10) * np.ones(10)'

echo 'Done!'
