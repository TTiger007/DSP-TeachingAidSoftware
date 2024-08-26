function varargout = bangzhu3(varargin)
% BANGZHU3 MATLAB code for bangzhu3.fig
%      BANGZHU3, by itself, creates a new BANGZHU3 or raises the existing
%      singleton*.
%
%      H = BANGZHU3 returns the handle to a new BANGZHU3 or the handle to
%      the existing singleton*.
%
%      BANGZHU3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BANGZHU3.M with the given input arguments.
%
%      BANGZHU3('Property','Value',...) creates a new BANGZHU3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bangzhu3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bangzhu3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bangzhu3

% Last Modified by GUIDE v2.5 21-Apr-2023 13:08:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bangzhu3_OpeningFcn, ...
                   'gui_OutputFcn',  @bangzhu3_OutputFcn, ...
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


% --- Executes just before bangzhu3 is made visible.
function bangzhu3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bangzhu3 (see VARARGIN)

% Choose default command line output for bangzhu3
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','循环卷积模块帮助界面')
b = imread('xhjj.png');
axes(handles.axes1)
imshow(b);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bangzhu3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bangzhu3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
