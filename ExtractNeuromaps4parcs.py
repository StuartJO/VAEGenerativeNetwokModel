# read in .gii file and extract data to array
#
import nibabel as nib
import numpy as np
import os
import sys
import argparse


# loop over all .gii files in directory
for file in glob.glob("*.hemi-L.func.gii"):
    # read in .gii file
    img = nib.load(file)
    # extract data from .gii file
    data = img.get_data()
    # store data from each .gii file in array
    data_array = np.append(data_array, data)

# loop over parcellation files
for file in glob.glob("*.L.aparc.a2009s.annot"):
    # read in .gii file
    parc = nib.load(file)
    # extract data from .gii file
    parc_data = parc.get_data()
    # store data from each .gii file in array
    data_array = np.append(data_array, data)

    # loop over all columns in data_array
    for i in range(data_array.shape[1]):
        # loop over all parcels
        for parcel in range(1, len(parc_data)):
            # find indices of parcel
            parcel_indices = np.where(parc_data == parcel)
            # find average of parcel
            parcel_average = np.mean(data_array[parcel_indices])
            # save parcel average to np array
            parcel_averages[parcel] = parcel_average

    # save parcel averages to .csv file
    np.savetxt('parcel_averages.csv', parcel_averages, delimiter=',')
