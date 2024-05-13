#!/bin/bash
# 
# Installer for Visualization environment
# 
# Run: ./install_visualization.sh 
#
# C. Birnie, 02/11/2022

echo 'Creating Visualization environment'

# create conda env
conda env create -f environment_visualization.yml
source ~/miniconda3/etc/profile.d/conda.sh
conda activate visualization
echo 'Created and activated environment:' $(which python)

# check packages work as expected
echo 'Checking pyvista version and running a command...'
python -c 'import pyvista; mesh = pyvista.read("bunny.stl"); mesh.plot()'

echo 'Done!'
