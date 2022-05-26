# Make parcellations of random sizes
import nibabel as nib
import numpy as np
from fragmenter import RegionsExtractor
from fragmenter import Fragment
import os
import sys
import argparse

MaxParcels = sys.argv(0)
Nparcs2gen = sys.argv(1)

# loop over Nparcs2gen
for i in range(Nparcs2gen):

    # Generate random number of parcels
    n_parcels = np.random.randint(50, MaxParcels)

    # Generate unique string for savename
    string = ''.join(np.random.choice(list(string.ascii_letters), size=10))

