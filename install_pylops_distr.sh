#!/bin/bash
# 
# Installer for PyLops Distributed CPU environment
# 
# Run: ./install_pylops_distr.sh pylops_distributed_dir
#
# M. Ravasi, 04/02/2021

echo 'Creating PyLops Distributed CPU environment'

# create conda env
conda env create -f environment_pylops_distr.yml
source ~/miniconda3/etc/profile.d/conda.sh
conda activate pylops_distributed
echo 'Created and activated environment:' $(which python)

# install pylops-distributed in developer mode
if [ -z "$1" ];
then
   echo 'No library installed in dev mode... Installing pylops from conda'
   pip install pylops-distributed
else
   cd $1
   pip install -e .
fi

# temporary workaround to make dask work with zarr:
conda upgrade fsspec -c conda-forge

# check pylops_distributed works as expected
echo 'Checking pylops-distributed version and running a command...'
python -c 'import numpy as np; import pylops_distributed; print(pylops_distributed.__version__); pylops_distributed.Identity(10) * np.ones(10)'

echo 'Done!'
