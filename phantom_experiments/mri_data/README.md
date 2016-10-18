The imaging data comming from MRI.


In the folder PHILIPS_3T_Achieva_RAW_FILES
you can find the original raw par-rec files as coming from the Philips 3T MRI scanner.
Those were converted using mricron app to nifti, in particular the dcm2niigui converter.
Using ShowNiftiHeader to extract the nii voxel2world matrix in the respective .txt files for each scan
The nifti files were finally converted using Slicer to nrrd as the only supported imaging format in scirun.
  
