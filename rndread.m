%�w�ifunction���j�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�w�t
function [fout, vout] = rndread(filename)
fid=fopen(filename, 'r'); %�}��
vnum=0;       % ���I�V�q�y��
report_num=0; 
while feof(fid) == 0                   % �P�_Ū��
    tline = fgetl(fid);                % �h������Ÿ��b�r�ꤤ
    fword = sscanf(tline, '%s ');      % �q�r�ꤤŪ���榡�Ƹ��g
    if strncmpi(fword, 'v',1) == 1;    % �P�_���I
       vnum = vnum + 1;                % �p�Ƴ��I
       report_num = report_num + 1;    
       vv(:,vnum) = sscanf(tline, '%*s %f %f %f'); % �����I���
    end                                         
end
fnum = vnum/3;             
flist = 1:vnum;             
F = reshape(flist, 3,fnum);
fout = F';   % ��m��X
vout = vv';   % ��m��X"
fclose(fid); 



