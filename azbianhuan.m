function varargout = azbianhuan(varargin)
% AZBIANHUAN MATLAB code for azbianhuan.fig
%      AZBIANHUAN, by itself, creates a new AZBIANHUAN or raises the existing
%      singleton*.
%
%      H = AZBIANHUAN returns the handle to a new AZBIANHUAN or the handle to
%      the existing singleton*.
%
%      AZBIANHUAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AZBIANHUAN.M with the given input arguments.
%
%      AZBIANHUAN('Property','Value',...) creates a new AZBIANHUAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before azbianhuan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to azbianhuan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help azbianhuan

% Last Modified by GUIDE v2.5 19-May-2023 21:24:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @azbianhuan_OpeningFcn, ...
                   'gui_OutputFcn',  @azbianhuan_OutputFcn, ...
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


% --- Executes just before azbianhuan is made visible.
function azbianhuan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to azbianhuan (see VARARGIN)

% Choose default command line output for azbianhuan
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','序列的Z变换模块')
axes(handles.axes1)
axis off;
b = imread('zniz.png');
axes(handles.axes2)
imshow(b);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes azbianhuan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = azbianhuan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
x = get(handles.popupmenu1,'value');
switch x
    case 1
        cla(handles.axes1)
    case 2
        a = imread('z1.png');
        axes(handles.axes1)
        imshow(a);
        axis off;
    case 3
        a = imread('zun.png');
        axes(handles.axes1)
        imshow(a);
        axis off;
    case 4
        a = imread('zzuobian.png');
        axes(handles.axes1)
        imshow(a);
        axis off;
    case 5
        a = imread('zyoubian.png');
        axes(handles.axes1)
        imshow(a);
        axis off;
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(0,'CurrentFigure',bangzhu5);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
run("zhujiemian1.m")

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('sy123.pptx')%在引号内修改课件名称


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
B = [0,1]
A = [1,-5,6]
axes(handles.axes3)
zplane(B,A)
%figure
%zplane(B,A)
