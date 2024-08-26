function varargout = lbq11(varargin)
% LBQ11 MATLAB code for lbq11.fig
%      LBQ11, by itself, creates a new LBQ11 or raises the existing
%      singleton*.
%
%      H = LBQ11 returns the handle to a new LBQ11 or the handle to
%      the existing singleton*.
%
%      LBQ11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LBQ11.M with the given input arguments.
%
%      LBQ11('Property','Value',...) creates a new LBQ11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lbq11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lbq11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lbq11

% Last Modified by GUIDE v2.5 19-May-2023 17:55:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lbq11_OpeningFcn, ...
                   'gui_OutputFcn',  @lbq11_OutputFcn, ...
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


% --- Executes just before lbq11 is made visible.
function lbq11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lbq11 (see VARARGIN)

% Choose default command line output for lbq11
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','数字滤波器前置界面（1）')
a = imread('LBQ11.png');
imshow(a);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lbq11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lbq11_OutputFcn(hObject, eventdata, handles) 
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
set(0,'CurrentFigure',lbq12)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
set(0,'CurrentFigure',zhujiemian1)
