= Notes on brain experiments


== DATA

* head_model.fld : file is EMPTY, since head model not publically shared
* /ROI/xxx : misc files used to specify our ROI (M1 moto area of human cortex)
* /error_metrics/all_export_result_metric.mat : results from FEM simulations

== SCIRun net files

* InspectAndImportMesh.srn : imports a 3D tetrahedral mesh from matlab mat file to scirun field format
* inspect_mesh_headmodel.srn : visually inspect mesh quality
* XXX/gen_coil.srn : generate a particular coil type 
* XXX/set_coil.srn : set the coil for particular postion and orientation
* solve_coil_field.srn : solves the magnetic vector potential (biot-savart method) for a coil
* solve_fem.srn : solves FEM on a human head (electric field)
* vis_magvec.srn : visual inspect the results (magnetic, electrci fields)
* post_fem.srn : exports the results for our ROI


