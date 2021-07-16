%─【function↓】───────────────────────────────┤
function [fout, vout] = rndread(filename)
fid=fopen(filename, 'r'); %開擋
vnum=0;       % 頂點向量座標
report_num=0; 
while feof(fid) == 0                   % 判斷讀圖
    tline = fgetl(fid);                % 去掉換行符號在字串中
    fword = sscanf(tline, '%s ');      % 從字串中讀取格式化資料g
    if strncmpi(fword, 'v',1) == 1;    % 判斷頂點
       vnum = vnum + 1;                % 計數頂點
       report_num = report_num + 1;    
       vv(:,vnum) = sscanf(tline, '%*s %f %f %f'); % 取頂點資料
    end                                         
end
fnum = vnum/3;             
flist = 1:vnum;             
F = reshape(flist, 3,fnum);
fout = F';   % 轉置輸出
vout = vv';   % 轉置輸出"
fclose(fid); 



