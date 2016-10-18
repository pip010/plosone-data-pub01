load roi_for_bas
P.Vertices=ROI.node';
P.Faces=ROI.face';
P.FaceVertexCData=ROI.field';
figure;
P.FaceColor='b'
ph=patch(P);
hold on;
i_del=0;
%now loop over all Faces
for i=1:size(P.Faces,1)
    tri=fill3(P.Vertices(P.Faces(i,:),1), P.Vertices(P.Faces(i,:),2), P.Vertices(P.Faces(i,:),3),'r');
    disp(sprintf('Triangle %i',i));
    s=input('Include triangle (y/n)','s');
    if s=='n'
        i_del=i_del+1;
        dellist(i_del)=i;
    end 
    delete(tri);
end
    