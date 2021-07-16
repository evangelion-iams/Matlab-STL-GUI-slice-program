function [v, f] = stlread(filename)
use_color=(nargout>=4);
fid=fopen(filename, 'r'); %Open the file, assumes STL Binary format.
ftitle=fread(fid,80,'uchar=>schar'); % Read file title
numFaces=fread(fid,1,'int32'); % Read number of Faces
T = fread(fid,inf,'uint8=>uint8'); % read the remaining values
fclose(fid);
trilist = 1:48;
ind = reshape(repmat(50*(0:(numFaces-1)),[48,1]),[1,48*numFaces])+repmat(trilist,[1,numFaces]);
Tri = reshape(typecast(T(ind),'single'),[3,4,numFaces]);
v=Tri(:,2:4,:);
v = reshape(v,[3,3*numFaces]);
v = double(v)';
f = reshape(1:3*numFaces,[3,numFaces])';
if use_color
    c0 = typecast(T(49:50),'uint16');
    if (bitget(c0(1),16)==1)
        trilist = 49:50;
        ind = reshape(repmat(50*(0:(numFaces-1)),[2,1]),[1,2*numFaces])+repmat(trilist,[1,numFaces]);
        c0 = reshape(typecast(T(ind),'uint16'),[1,numFaces]);
        r=bitshift(bitand(2^15-1, c0),-10);
        g=bitshift(bitand(2^10-1, c0),-5);
        b=bitand(2^5-1, c0);     
    else
    end
end