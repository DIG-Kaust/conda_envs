#!/bin/bash
# 
# Installer for Scientific CPU environment
# 
# Run: ./install_scientific.sh 
#
# C. Birnie, 01/03/2021

echo 'Creating Scientific CPU environment'

# create conda env
conda env create -f environment_scientific.yml
source activate scientific
echo 'Created and activated environment:' $(which python)

# check packages work as expected
echo 'Checking pylops version and running a command...'
python -c 'import numpy as np; import pylops; print(pylops.__version__); pylops.Identity(10) * np.ones(10)'

echo 'Done!'
