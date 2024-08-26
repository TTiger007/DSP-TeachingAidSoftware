function varargout = lbq12(varargin)
% LBQ12 MATLAB code for lbq12.fig
%      LBQ12, by itself, creates a new LBQ12 or raises the existing
%      singleton*.
%
%      H = LBQ12 returns the handle to a new LBQ12 or the handle to
%      the existing singleton*.
%
%      LBQ12('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LBQ12.M with the given input arguments.
%
%      LBQ12('Property','Value',...) creates a new LBQ12 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lbq12_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lbq12_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lbq12

% Last Modified by GUIDE v2.5 16-May-2023 18:29:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lbq12_OpeningFcn, ...
                   'gui_OutputFcn',  @lbq12_OutputFcn, ...
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


% --- Executes just before lbq12 is made visible.
function lbq12_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lbq12 (see VARARGIN)

% Choose default command line output for lbq12
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','数字滤波器前置界面（2）')
a = imread('LBQ12.png');
imshow(a);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lbq12 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lbq12_OutputFcn(hObject, eventdata, handles) 
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
set(0,'CurrentFigure',lbq11)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(0,'CurrentFigure',lbqts1)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
set(0,'CurrentFigure',bishe9)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
set(0,'CurrentFigure',zhujiemian1)
