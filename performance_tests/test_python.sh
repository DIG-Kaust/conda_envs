#!/bin/bash
#
# Test numpy routines for fixed number of threads
#
# Run: ./test_python.sh NTHREADS
#
source activate pylops

## Check specs
#lscpu
which python

## Run the application:
export OMP_NUM_THREADS=$1
export MKL_NUM_THREADS=$1

python test_python.py
