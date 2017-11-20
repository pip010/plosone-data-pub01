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