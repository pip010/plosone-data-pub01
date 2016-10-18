% this is the align matrix coming from the neural navigator

A = [
-0.772	-0.56	-0.197	34.35;
-0.507	0.452	0.698	163.01;
-0.309	0.656	-0.650	-203.07;
0	0	0	1;
]

A_ScaleFactor = det(A)^(1/3)

save -mat7-binary coil_capture_align.mat A
