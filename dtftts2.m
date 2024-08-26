function varargout = dtftts2(varargin)
% DTFTTS2 MATLAB code for dtftts2.fig
%      DTFTTS2, by itself, creates a new DTFTTS2 or raises the existing
%      singleton*.
%
%      H = DTFTTS2 returns the handle to a new DTFTTS2 or the handle to
%      the existing singleton*.
%
%      DTFTTS2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DTFTTS2.M with the given input arguments.
%
%      DTFTTS2('Property','Value',...) creates a new DTFTTS2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dtftts2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dtftts2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dtftts2

% Last Modified by GUIDE v2.5 28-Apr-2023 00:04:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dtftts2_OpeningFcn, ...
                   'gui_OutputFcn',  @dtftts2_OutputFcn, ...
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


% --- Executes just before dtftts2 is made visible.
function dtftts2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dtftts2 (see VARARGIN)

% Choose default command line output for dtftts2
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','提示')
a = imread('DTFT12.png');
imshow(a);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dtftts2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dtftts2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
