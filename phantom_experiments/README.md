======================================
Notes on coil phantom experiments
TMS figure-8 coil inside 3T MRI scanner
======================================

Three different models were considered:
SimpleCoil(BSM-811) - single loop figure8 TMS coild model
DetailCoil(BSM-819) - multi loop 9 windings 1 layer figure8 TMS coild model 
DetailPlusCoil(BSM-879) - multi loop 9 windings 7 layers figure8 TMS coild model  



=== DATA
/error_metrics/data.mat - you can find the empirical MRI data and the results for all the coil models we consider
/mri_data/* - RAW data as aquired frm MRI scanner

=== SCIRun net files

XXX/gen_coil.fld - generate a particular coil model
set_coil.fld - position the coil based on a mapping matrix from navigation_coregistration
solve_coil_field.srn - solve the coil magnetic field (B) and vector potential (A) using the Biot-Savart method
view_coil.srn - visual inspection of the experiment
