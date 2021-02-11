#!/bin/bash
# 
# Installer for PyLops CPU environment
# 
# Run: ./install_pylops.sh pylops_dir
#
# M. Ravasi, 04/02/2021

echo 'Creating PyLops CPU environment'

# install pylops in developer mode
cd $1

if [ -z "$1" ];
then
   echo 'No library installed in dev mode...'
else
   pwd
   ls
fi

echo 'Done!'
