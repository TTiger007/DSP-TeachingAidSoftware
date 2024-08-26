function varargout = alisanft(varargin)
% ALISANFT MATLAB code for alisanft.fig
%      ALISANFT, by itself, creates a new ALISANFT or raises the existing
%      singleton*.
%
%      H = ALISANFT returns the handle to a new ALISANFT or the handle to
%      the existing singleton*.
%
%      ALISANFT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALISANFT.M with the given input arguments.
%
%      ALISANFT('Property','Value',...) creates a new ALISANFT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before alisanft_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to alisanft_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help alisanft

% Last Modified by GUIDE v2.5 11-May-2023 16:09:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @alisanft_OpeningFcn, ...
                   'gui_OutputFcn',  @alisanft_OutputFcn, ...
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


% --- Executes just before alisanft is made visible.
function alisanft_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to alisanft (see VARARGIN)

% Choose default command line output for alisanft
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','DFT模块')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes alisanft wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = alisanft_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
x1=[1 1 1 1]
x2=[1 2 3 4]
x3=[1 2 3 4 5]
x4=[1 2 3 4 5 6]
cs = {x1,x2,x3,x4}
handles.cs = cs
guidata(hObject,handles)

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selected_index = get(handles.listbox1,'Value')
str = get(handles.listbox1,'String')
set(handles.edit1,'String',str{selected_index})
xinhao1 = handles.cs{selected_index}
handles.xinhao1 = xinhao1
guidata(hObject,handles)
xn = str2num(get(handles.edit1,'String'));
xs = 0
Lx = length(xn);
axes(handles.axes1);
stem(xs:xs+Lx-1,xn,'filled');axis([xs-1 xs+Lx -max(abs(xn))-1 max(abs(xn))+1] );


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
var = get(handles.slider1,'Value')
set(handles.edit3,'String',num2str(floor(var)))

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xn = str2num(get(handles.edit1,'String'));
N = str2num(get(handles.edit3,'String'));
n = [0:1:N-1];
k = [0:1:N-1];
WN = exp(-j*2*pi/N);
lx = length(xn);

if lx>N
    set(0,'CurrentFigure',dftcuowu);
else
    tic
    x1 = [xn,zeros(1,N-lx)]
    nk = n'*k;
    WNnk = WN.^nk;
    Xk = x1*WNnk;
    toc
    lx = length(x1)
    nx = [0:lx-1];
        %w = linspace(-2.8*pi,2.8*pi,10000);
        w = linspace(0*pi,2*pi,10000);
        X1 = x1*exp(-j*nx'*w);
         %figure
         %plot(w/pi,abs(X1));
         %hold on
         %xlabel('\omega/\pi');ylabel('|X(e^j^\omega)|')
         %xlabel('\omega/\pi','FontName','Times New Rome','FontSize',12);ylabel('|X(e^j^\omega)|','FontName','Times New Rome','FontSize',12);
    %axis([0 2 0 max(abs(X1))+1])
     %figure
     %stem(n,abs(Xk),'.','DisplayName','DFT');xlabel('k');ylabel('|X(k)|');
     %hold on
     %plot(w*N/pi/2,abs(X1),'DisplayName','DTFT')
     %legend
     %stem(n,abs(Xk));xlabel('k');ylabel('|X(k)|');
     %hold on
     %plot(n,abs(X1))
     %axis([-1 N+1 0 max(abs(Xk))+1])
    axes(handles.axes3)
    plot(w/pi,abs(X1))
    axis([0 2 0 max(abs(X1))+1])
    axes(handles.axes2)
    stem(n,abs(Xk),'.')
    hold on
    plot(w*N/pi/2,abs(X1))
    axis([-1 N+1 0 max(abs(Xk))+1])
    hold off
    
end

time = toc
set(handles.edit4,'String',time)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(0,'CurrentFigure',bangzhu6);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
run("zhujiemian1.m");

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('sy123.pptx')%在引号内修改课件名称
