# -*- coding: utf-8 -*-
"""
Created on Tue Mar 26 22:45:08 2019

@author: SPREEHA DUTTA
"""

import numpy as np
a = np.array([[0,0,0.5,0,0,0,0,0.5,0,0],[0,0,0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,0,0,0],[0,0,0,0,0,0,1,0,0,0],[0.5,0,0,0,0,0,0,0,0.5,0],[0,0,0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0,1,0],[0,0,0,0,0,0.5,0.5,0,0,0],[0,0,0,0,0,0,0,1,0,0],[0,0,1,0,0,0,0,0,0,0]])
n=10
d=0.85
d_matrix = np.array([[d]]*a.shape[1])
a_trans = a.T
for i in range(n):
    a1 = np.matmul(a_trans, d_matrix)
d_matrix = a1
print('Page Ranks for matrix of size ' + str(a.shape[0]))
print(d_matrix)