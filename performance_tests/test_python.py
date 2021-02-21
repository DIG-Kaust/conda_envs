# Test python conda

import os
import time
import numpy as np
import scipy as sp
from pylops import MatrixMult
#print(np.__config__.show())
#print(sp.__config__.show())

print('OMP_NUM_THREADS', os.getenv('OMP_NUM_THREADS'))
print('MKL_NUM_THREADS', os.getenv('MKL_NUM_THREADS'))

n = 10000
x = np.ones(n)
G = np.random.normal(0., 1., (n, n))
Gop = MatrixMult(G)

# dot product
t0 = time.time()
y = np.dot(G, x)
print('Mat-vec np.dot elapsed time', time.time()-t0)
#y1 = Gop @ x

# matmul
G2 = np.dot(G, G)
print('Mat-mat np.dot elapsed time', time.time()-t0)

G2 = np.matmul(G, G)
print('Mat-mat np.matmul elapsed time', time.time()-t0)
