#!/bin/bash
# 
# Installer for MPI4Py
# 
# Run: ./install_mpi4py.sh
#
# M. Ravasi, 25/02/2021

echo 'Creating MPI4PY CPU environment'

# load module MPI
module load mpich/3.3.2/gcc-7.5.0-kw5yyqo
echo 'Loaded MPI:' $(which mpicc)

# create conda env
conda env create -f environment_mpi4py.yml
source ~/miniconda3/etc/profile.d/conda.sh
conda activate mpi4py
conda env list
echo 'Created and activated environment:' $(which python)

# check pylops works as expected
echo 'Checking pylops version and running a command...'
python -c 'import mpi4py; print(mpi4py.__version__)'

echo 'Done!'
