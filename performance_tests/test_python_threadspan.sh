#!/bin/bash
#
# Test numpy routines with increasing number of threads
#
# Run: ./test_python_threadspan.sh
#

lscpu

# singe threaded
./test_python.sh 1

# 2 threads
./test_python.sh 2

# 4 threads
./test_python.sh 4

# 8 threads
./test_python.sh 8
