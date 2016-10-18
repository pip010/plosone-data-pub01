
function Markers=loadmrk2(fname)

	MAXCHAR=30;
	nmarkers=0;
	t=0;
	fid=fopen(fname,'rb');
	EOF=0;
	while ~EOF
	    Marker.MR_Name=fread(fid,MAXCHAR,'char');
	    Marker.type=fread(fid,1,'int');
	    Marker.MR_pos=fread(fid,3,'double');
	    Marker.probe_pos=fread(fid,3,'double');
	    EOF=feof(fid);
	    if ~EOF
	        t=t+1;
	        Markers(t)=Marker;
	    end
	end
	nmarkers=t;
end

% all captured points
P = loadmrk2('markers_extras_captured.npt')

% points along symmetry lines of coil windings
p1=P(9).probe_pos'; %left wing, coil surface and ~5cm underneath
p2=P(10).probe_pos';

p5=P(11).probe_pos'; %right wing, coil surface and ~5cm underneath
p6=P(12).probe_pos';

p3=p1+(p5-p1)/2; %halfway p1 and p5, eg coil centre at surface
p4=p2+(p6-p2)/2; %halfway p2 and p6, eg coil centre ~5cm below surface


%construct orthonormal coordinate set xn, yn and zn at center of coil, at
%surface. yn pointing p1>p5, zn upward (away from head)

xnd=(p5-p3)/norm(p5-p3); %unit vector pointing from coil center surface to right wing center (origin is in coil center surface)
zn=(p3-p4)/norm(p3-p4); %z-vector along coil center axis, perpendicular to coil surface, pointing upwards (away from brain)
yn=cross(zn,xnd); % per definition x is the cross product of y and z axis
yn=yn/norm(yn);
xn=cross(yn,zn);


JR=inv( [[[xn;yn;zn],[0 0 0]'];[0 0 0 1]] ); %Jacobian in 4D , no translation

JT = [
1 0 0 p3(1);
0 1 0 p3(2);
0 0 1 p3(3);
0 0 0 1;
]

J = JT * JR


save -mat7-binary coil_capture_jacobi.mat J
