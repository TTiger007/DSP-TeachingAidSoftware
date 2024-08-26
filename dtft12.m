function varargout = dtft12(varargin)
% DTFT12 MATLAB code for dtft12.fig
%      DTFT12, by itself, creates a new DTFT12 or raises the existing
%      singleton*.
%
%      H = DTFT12 returns the handle to a new DTFT12 or the handle to
%      the existing singleton*.
%
%      DTFT12('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DTFT12.M with the given input arguments.
%
%      DTFT12('Property','Value',...) creates a new DTFT12 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dtft12_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dtft12_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dtft12

% Last Modified by GUIDE v2.5 16-May-2023 18:01:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dtft12_OpeningFcn, ...
                   'gui_OutputFcn',  @dtft12_OutputFcn, ...
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


% --- Executes just before dtft12 is made visible.
function dtft12_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dtft12 (see VARARGIN)

% Choose default command line output for dtft12
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','DTFT前置界面（2）')
a = imread('DTFT2.png');
imshow(a);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dtft12 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dtft12_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
set(0,'CurrentFigure',dtft1)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(0,'CurrentFigure',dtftts2)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
set(0,'CurrentFigure',bishe4)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
set(0,'CurrentFigure',zhujiemian1)
