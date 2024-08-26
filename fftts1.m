function varargout = fftts1(varargin)
% FFTTS1 MATLAB code for fftts1.fig
%      FFTTS1, by itself, creates a new FFTTS1 or raises the existing
%      singleton*.
%
%      H = FFTTS1 returns the handle to a new FFTTS1 or the handle to
%      the existing singleton*.
%
%      FFTTS1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FFTTS1.M with the given input arguments.
%
%      FFTTS1('Property','Value',...) creates a new FFTTS1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fftts1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fftts1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fftts1

% Last Modified by GUIDE v2.5 28-Apr-2023 15:39:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fftts1_OpeningFcn, ...
                   'gui_OutputFcn',  @fftts1_OutputFcn, ...
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


% --- Executes just before fftts1 is made visible.
function fftts1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fftts1 (see VARARGIN)

% Choose default command line output for fftts1
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','提示')
a = imread('FFTTS1.png');
imshow(a);
axis off;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fftts1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fftts1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
