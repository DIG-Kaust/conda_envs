#!/bin/bash
# 
# Installer for Azure-CLI
# 
# Run: ./install_azurecli.sh 
#
# M. Ravasi, 11/03/2021

echo 'Creating Azure-CLI environment'

# create conda env
conda env create -f environment_azurecli.yml
source activate azurecli
echo 'Created and activated environment:' $(which python)

echo 'Done!'
