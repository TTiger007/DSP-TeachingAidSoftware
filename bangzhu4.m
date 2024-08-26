function varargout = bangzhu4(varargin)
% BANGZHU4 MATLAB code for bangzhu4.fig
%      BANGZHU4, by itself, creates a new BANGZHU4 or raises the existing
%      singleton*.
%
%      H = BANGZHU4 returns the handle to a new BANGZHU4 or the handle to
%      the existing singleton*.
%
%      BANGZHU4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BANGZHU4.M with the given input arguments.
%
%      BANGZHU4('Property','Value',...) creates a new BANGZHU4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bangzhu4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bangzhu4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bangzhu4

% Last Modified by GUIDE v2.5 21-May-2023 16:36:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bangzhu4_OpeningFcn, ...
                   'gui_OutputFcn',  @bangzhu4_OutputFcn, ...
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


% --- Executes just before bangzhu4 is made visible.
function bangzhu4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bangzhu4 (see VARARGIN)

% Choose default command line output for bangzhu4
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','序列的DTFT模块帮助界面')
b = imread('dtft.png');
axes(handles.axes2)
imshow(b);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bangzhu4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bangzhu4_OutputFcn(hObject, eventdata, handles) 
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
