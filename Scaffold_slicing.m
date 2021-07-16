clc,clear;
clear all;
%**************************************************************************
%    1. Read file
%**************************************************************************
filename = 'D:\newslic_project\fire_mount.STL'; % a simple demo part

% filename = 'D:\newslic_project\lens.STL'; % a simple demo part

[F, V] = rndread(filename);        % read ASCII code STL File
verbose = false;
% [V, F, n, c, stltitle] = stlread(filename, verbose);  % read binary code STL File
% clear V 
% clear n
% clear c
% clear stltitle

VVV(:,1)=((V(:,1)-max(max(V))/2)*1);
VVV(:,2)=((V(:,2)-max(max(V))/2)*1);
VVV(:,3)=((V(:,3)-max(max(V))/2)*1);

VVV=((VVV)*1000); % Adjust scale
% VVV=((VVV)*1); % Adjust scale

disp(['CAD file ' filename ' data is read'])
pause(1) 
v_number=max(max(F));
%**************************************************************************
%    2. Rotate of Obj.
%**************************************************************************

% d_phi=pi/2;      %¡i¡´ Z axial rotate¡j 
% d_theta=pi;      %¡i¡´ y axial rotate¡j
% % ¢w¡iZ axial rotate¡j¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w
% [VVV]=Z_axial_rotate(v_number,VVV,d_phi);
% % [FN]=Z_axial_rotate(v_number/3,FN,d_phi);
% % %¢w¡iY axial rotate¡j¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w
% [VVV]=Y_axial_rotate(v_number,VVV,d_theta);
% % [FN]=Y_axial_rotate(v_number/3,FN,d_theta);
% %¢w¡iZ axial rotate¡j¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w
% % [new_VVV]=Z_axial_rotate(v_number,VVV,d_phi);

%¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢t
new_VV(:,1)=VVV(:,1)-min(min(VVV(:,1)));
new_VV(:,2)=VVV(:,2)-min(min(VVV(:,2)));
new_VV(:,3)=VVV(:,3)-min(min(VVV(:,3)));
clear VVV
%¢w¡iGraphic¡j¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢t
figure, p = (patch('faces', F, 'vertices' ,new_VV));
daspect([1 1 1])                      % Fixed aspect ratio of image*
%¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w
      set(p, 'facec', 'b');% ¢w¢w¢w¢w¢w¢w¢w% Set the face color (force it)
%     set(p, 'facec', 'flat');            % Set the face color flat*
%     set(p, 'FaceVertexCData', C);       % Set the color (from file)*
      set(p, 'facealpha',.4)              % Use for transparency
%     set(p, 'EdgeColor','none');         % Set the edge color*
%     %set(p, 'EdgeColor',[1 0 0 ]);      % Use to see triangles, if needed.
%     light                               % Add a default light*
    view(3)                               % Setup sometric view*
    xlabel('X'),ylabel('Y'),zlabel('Z')
    title(['Imported CAD data from ' filename])
%¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w
disp('Will now slicing object into 2D')
max_X=max(max(new_VV(:,1)));
max_Y=max(max(new_VV(:,2)));
% clear FN 

%**************************************************************************
%    3. Slicing
% %**************************************************************************
%¡m¡m¡m¡m¡iSlicing Mode¡j¡n¡n¡n¡n
% ¡i1: Image w/ hole select¡j¡F¡i2¡GFabrication¡j¡F
% ¡i3¡GFabrication w/ contour¡j¡F¡iDefault¡GFabrication w/ hole select¡j
mode=2;  % ¡´

n=10;    % # of layer ¡´

%¡m¡m¡m¡m¡iSize of Figure¡j¡n¡n¡n¡n
area_mode=2;   % 1:Automatic¡F 2:Manual type in below ¡´
height=300;   % x- size of figure ¡´
width=300;   % y- size of figure ¡´
%¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w
new_VV(:,1)=new_VV(:,1)+height/2-max_X/2; % Set x- of obj. in center.
new_VV(:,2)=new_VV(:,2)+width/2-max_Y/2; % Set y- of obj. in center.
Z_Zp=max(new_VV(:,3));  % Height of object

Zp_1=uint16(linspace(1,(Z_Zp-1),n));  % z- axial of object slicing


for kk=1:n
    
%     slic_save(v_number,new_VV,Zp_1(kk),kk,mode,area_mode,height,width);
    slic_save_v2(v_number,new_VV,Zp_1(kk),kk,mode,area_mode,height,width);
end
%¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w

% |END||END||END||END||END||END||END||END||END||END||END||END||END||END|














% 

