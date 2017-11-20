% this is the align matrix coming from the neural navigator

A = [
-0.77366	-0.56766	-0.2	34.6;
-0.5158	0.4575	0.6966	159.914;
-0.310	0.6551	-0.6599	-173.068;
0	0	0	1;
];

A_ScaleFactor = det(A)^(1/3);

save -mat7-binary coil_capture_align.mat A
