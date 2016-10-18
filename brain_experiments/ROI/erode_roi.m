fname='/mnt/home/bas/temp/brain_ROI_M1.nii';
fname1='/mnt/home/bas/temp/brain_ROI_M1_e1.nii';
fname2='/mnt/home/bas/temp/brain_ROI_M1_e2.nii';

V=spm_vol(fname);
Data=spm_read_vols(V);

Data_e1=spm_erode(Data); %erode once with default kernel
Data_e2=spm_erode(Data_e1); %erode twice with default kernel

V.fname=fname1;
spm_write_vol(V,Data_e1);

V.fname=fname2;
spm_write_vol(V,Data_e2);

