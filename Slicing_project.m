function varargout = Slicing_project(varargin)
% SLICING_PROJECT MATLAB code for Slicing_project.fig
%      SLICING_PROJECT, by itself, creates a new SLICING_PROJECT or raises the existing
%      singleton*.
%
%      H = SLICING_PROJECT returns the handle to a new SLICING_PROJECT or the handle to
%      the existing singleton*.
%
%      SLICING_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SLICING_PROJECT.M with the given input arguments.
%
%      SLICING_PROJECT('Property','Value',...) creates a new SLICING_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Slicing_project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Slicing_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Slicing_project

% Last Modified by GUIDE v2.5 30-Aug-2016 15:37:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Slicing_project_OpeningFcn, ...
                   'gui_OutputFcn',  @Slicing_project_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Slicing_project is made visible.
function Slicing_project_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Slicing_project (see VARARGIN)

% Choose default command line output for Slicing_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Slicing_project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Slicing_project_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
%¢x    1. Read file                                                       ¢x
%¢|¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}
clc,clear;
clear all;

% --- Executes on selection change in STL_coding.
function STL_coding_Callback(~, ~, ~)

% --- Executes during object creation, after setting all properties.
function STL_coding_CreateFcn(hObject, ~, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function filename_Callback(~, ~, ~)
% --- Executes during object creation, after setting all properties.
function filename_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in Select_File.
function Select_File_Callback(hObject, ~, handles)
[filename pathname] = uigetfile({'*.stl','*,*'},'open file');
if isequal(filename,0)
    msgbox('No select any file','File Open Error')
    return;
end
str = [pathname filename];
handles.name=filename; guidata(hObject, handles);
set(handles.filename,'string',str);

% --- Executes on button press in Close.
function Close_Callback(~, ~, ~)
exit = questdlg('Close the program?','Exit setup','Yes','No','No');
if (exit =='Yes')
    close(gcf)
    clc,clear;
    clear all;
end

% --- Executes on button press in Load_File.
function Load_File_Callback(hObject, ~, handles)
set(handles.text12,'string','Loading STL File');pause(1) 
filename = get(handles.filename,'string');

handles.name=filename; guidata(hObject, handles);
if get(handles.STL_coding,'Value')==2
    [V, F] = stlread(filename);        % read CAD file [Read the CAD data file w/ Binary code]
else
    [F, V] = rndread(filename);        % read CAD file [Read the CAD data file w/ ASCII code]
end
VVV(:,1)=((V(:,1)-max(max(V))/2)*1);
VVV(:,2)=((V(:,2)-max(max(V))/2)*1);
VVV(:,3)=((V(:,3)-max(max(V))/2)*1);

handles.F = F; guidata(hObject, handles);
handles.VVV = VVV; guidata(hObject, handles);

clear V 
set(handles.text12,'string',['CAD file ' handles.name ' data is read']);
% disp(['CAD file ' filename ' data is read'])
pause(1) 
handles.v_number=max(max(F)); guidata(hObject, handles);
%¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
%¢x    2. Scale of Obj.                                                   ¢x
%¢|¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}
function edit2_Callback(~, ~, ~)
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in scale.
function scale_Callback(hObject, ~, handles)
m=str2double(get(handles.edit2,'string'));
handles.VVV=handles.VVV.*m;guidata(hObject, handles);
% max(max(handles.VVV))

% --------------------------------------------------------------------
function File_Callback(~, ~, ~)
% --------------------------------------------------------------------
function Exist_Callback(~, ~, ~)
%¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
%¢x    3. Rotate of Obj.                                                  ¢x
%¢|¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}
function Open_File_Callback(~, ~, ~)
% --------------------------------------------------------------------
function degee_Callback(~, ~, ~)
% --- Executes during object creation, after setting all properties.
function degee_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in Y_Rotate.
function Y_Rotate_Callback(hObject, ~, handles)
d_theta=str2double(get(handles.degee,'string'));
d_theta=d_theta*pi/180;
handles.VVV=Y_axial_rotate(handles.v_number,handles.VVV,d_theta);
guidata(hObject, handles);

% --- Executes on button press in Z_Rotate.
function Z_Rotate_Callback(hObject, ~, handles)
d_theta=str2double(get(handles.degee,'string'));
d_theta=d_theta*pi/180;
handles.VVV=Z_axial_rotate(handles.v_number,handles.VVV,d_theta);
guidata(hObject, handles);
%¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
%¢x    4. Graphic                                                         ¢x
%¢|¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}
function viewadj_Callback(~, ~, ~)
% --- Executes during object creation, after setting all properties.
function viewadj_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in Draw.
function Draw_Callback(hObject, ~, handles)
handles.VVV(:,1)=handles.VVV(:,1)-min(min(handles.VVV(:,1)));
handles.VVV(:,2)=handles.VVV(:,2)-min(min(handles.VVV(:,2)));
handles.VVV(:,3)=handles.VVV(:,3)-min(min(handles.VVV(:,3)));
guidata(hObject, handles);

view_plane=str2double(get(handles.viewadj,'string'));
x=floor(view_plane/100);
y=floor(mod(view_plane,100)/10);
z=(mod(view_plane,10));
cla reset;
p = (patch('faces', handles.F, 'vertices' ,handles.VVV));
daspect([1 1 1])                      % Fixed aspect ratio of image*
%¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w
      set(p, 'facec', 'b');

      set(p, 'facealpha',.4);             

    view([x y z])
    xlabel('\it\fontname {Times New Roman}\bf\fontsize{14}X\rm\fontname {Times New Roman}\bf\fontsize{14} (pixels)')
    ylabel('\it\fontname {Times New Roman}\bf\fontsize{14}Y\rm\fontname {Times New Roman}\bf\fontsize{14} (pixels)')
    zlabel('\it\fontname {Times New Roman}\bf\fontsize{14}Z\rm\fontname {Times New Roman}\bf\fontsize{14} (max layer)')
    set(gca,'fontsize',14,'fontName','Times New Roman','fontweight','bold')
    title(['Imported CAD data from ' handles.name])
    axes(handles.axes1); %set the current axes to axes1
%¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w
    handles.max_X=max(max(handles.VVV(:,1)));
    guidata(hObject, handles);
    handles.max_Y=max(max(handles.VVV(:,2)));
    guidata(hObject, handles);

%¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
%¢x    5. Center Obj. for slicing                                         ¢x
%¢|¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}  
% --- Executes on selection change in Default_center.
function Default_center_Callback(~, ~, ~)

% --- Executes during object creation, after setting all properties.
function Default_center_CreateFcn(hObject, ~, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%¢z¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢{
%¢x    6. Slicing                                                         ¢x
%¢|¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢w¢}
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(~, ~, ~)

function popupmenu1_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function n_Callback(~, ~, ~)
% --- Executes during object creation, after setting all properties.
function n_CreateFcn(~, ~, ~)

% --- Executes on selection change in area_moder.
function area_moder_Callback(hObject, ~, handles)
handles.melody_matching2=get(handles.area_moder,'Value');

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes during object creation, after setting all properties.
function area_moder_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function height_Callback(~, ~, ~)
% --- Executes during object creation, after setting all properties.
function height_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function width_Callback(~, ~, ~)
% --- Executes during object creation, after setting all properties.
function width_CreateFcn(hObject, ~, ~)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in slicing.
function slicing_Callback(~, ~, handles)
set(handles.text12,'string','Will now slicing object into 2D');
new_VV=handles.VVV;

% if str2double(handles.melody_matching)==2
if    get(handles.Default_center,'Value')==2
    new_VV(:,1)= new_VV(:,1)+str2double(get(handles.height,'string'))/2-handles.max_X/2; % Set x- of obj. in center.
    new_VV(:,2)= new_VV(:,2)+str2double(get(handles.width,'string'))/2-handles.max_Y/2; % Set y- of obj. in center.
end

Z_Zp=max(handles.VVV(:,3));  % Height of object

n=str2double(get(handles.n,'string'));
Zp_1=uint16(linspace(1,(Z_Zp-1),n));  % z- axial of object slicing

% mode=str2double(handles.melody_matching);
mode=get(handles.popupmenu1,'Value');

area_mode=get(handles.area_moder,'Value');
height=str2double(get(handles.height,'string'));
width=str2double(get(handles.width,'string'));

for kk=1:n
%     slic_save(handles.v_number,new_VV,Zp_1(kk),kk,mode,area_mode,height,width);
    slic_save_v2(handles.v_number,new_VV,Zp_1(kk),kk,mode,area_mode,height,width);
end
pause(1) 
set(handles.text12,'string','Slicing Done');
