function varargout = bishe9(varargin)
% BISHE9 MATLAB code for bishe9.fig
%      BISHE9, by itself, creates a new BISHE9 or raises the existing
%      singleton*.
%
%      H = BISHE9 returns the handle to a new BISHE9 or the handle to
%      the existing singleton*.
%
%      BISHE9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BISHE9.M with the given input arguments.
%
%      BISHE9('Property','Value',...) creates a new BISHE9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bishe9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bishe9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bishe9

% Last Modified by GUIDE v2.5 11-May-2023 17:37:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bishe9_OpeningFcn, ...
                   'gui_OutputFcn',  @bishe9_OutputFcn, ...
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


% --- Executes just before bishe9 is made visible.
function bishe9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bishe9 (see VARARGIN)

% Choose default command line output for bishe9
handles.output = hObject;
movegui(gcf,"center")
set(gcf,'name','数字滤波器模块')
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bishe9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bishe9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lx2 = get(handles.popupmenu5,'value')
win = get(handles.popupmenu6,'value')
ap2 = str2num(get(handles.edit6,'String'))
as2 = str2num(get(handles.edit7,'String'))
wp2 = str2num(get(handles.edit8,'String'))*pi
ws2 = str2num(get(handles.edit9,'String'))*pi
b = abs(wp2(1)-ws2(1))
%N0 = ceil(6.2*pi/b)
N0 = 31
N = N0+mod(N0+1,2)
wc = (wp2+ws2)/2/pi
try
if (lx2==1)
    if(win==1)
        h = fir1(N-1,wc,'low',boxcar(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
         %figure
         %stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
         %figure
         %plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==2)
        h = fir1(N-1,wc,'low',bartlett(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==3)
        h = fir1(N-1,wc,'low',hanning(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==4)
        h = fir1(N-1,wc,'low',hamming(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==5)
        h = fir1(N-1,wc,'low',blackman(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    end
elseif(lx2==2)
    if(win==1)
        h = fir1(N-1,wc,'high',boxcar(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==2)
        h = fir1(N-1,wc,'high',bartlett(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==3)
        h = fir1(N-1,wc,'high',hanning(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
        %figure
        %stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %figure
        %plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)/dB|')
    elseif(win==4)
        h = fir1(N-1,wc,'high',hamming(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w=0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==5)
        h = fir1(N-1,wc,'high',blackman(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
       
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    end
elseif(lx2==3)
    if(win==1)
        h = fir1(N-1,wc,boxcar(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==2)
        h = fir1(N-1,wc,bartlett(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==3)
        h = fir1(N-1,wc,hanning(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==4)
        h = fir1(N-1,wc,hamming(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w=0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==5)
        h = fir1(N-1,wc,blackman(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
       
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    end
elseif(lx2==4)
    if(win==1)
        h = fir1(N-1,wc,'stop',boxcar(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==2)
        h = fir1(N-1,wc,'stop',bartlett(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==3)
        h = fir1(N-1,wc,'stop',hanning(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==4)
        h = fir1(N-1,wc,'stop',hamming(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w=0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    elseif(win==5)
        h = fir1(N-1,wc,'stop',blackman(N))
        axes(handles.axes3)
        stem(0:length(h)-1,h);xlabel('n');ylabel('h(n)');
        %w= 0:0.1:pi
        [H,w] = freqz(h)
        H1 = 20*log10(abs(H))
       
        axes(handles.axes4)
        plot(w/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
    end

end
catch
    run("lbqbc.m")
end

        


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes3)
cla(handles.axes4)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
run("zhujiemian1.m")


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
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
ff = get(handles.popupmenu1,'value')
lx1 = get(handles.popupmenu2,'value')
yx = get(handles.popupmenu4,'value')

ap1 = str2num(get(handles.edit2,'String'))
as1 = str2num(get(handles.edit3,'String'))
wp1 = str2num(get(handles.edit4,'String'))*pi
ws1 = str2num(get(handles.edit5,'String'))*pi
fs1 = 1
try
if (ff == 1)
    if(lx1 == 1)
        if(yx == 1)
            [N,Wc ] = buttord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= butter(N,Wc,'low','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'red');;xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'red');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
             %figure
             %plot(W/pi,H);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
             %figure
             %plot(w1z/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
        elseif(yx==2)
            [N,Wc ] = cheb1ord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= cheby1(N,ap1,Wc,'low','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'green');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'green');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==3)
            [N,Wc ] = cheb2ord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= cheby2(N,as1,Wc,'low','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'blue');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'blue');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==4)
            [N,Wc ] = ellipord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= ellip(N,ap1,as1,Wc,'low','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;

            
        end
    elseif(lx1==2)
        if(yx == 1)
            [N,Wc ] = buttord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= butter(N,Wc,'high','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'red');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'red');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==2)
            [N,Wc ] = cheb1ord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= cheby1(N,ap1,Wc,'high','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'green');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'green');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==3)
            [N,Wc ] = cheb2ord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= cheby2(N,as1,Wc,'high','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'blue');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'blue');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==4)
            [N,Wc ] = ellipord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= ellip(N,ap1,as1,Wc,'high','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;


            
        end
    elseif(lx1==3)
        if(yx == 1)
            [N,Wc ] = buttord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= butter(N,Wc,'s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'red');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'red');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==2)
            [N,Wc ] = cheb1ord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= cheby1(N,ap1,Wc,'s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'green');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'green');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==3)
            [N,Wc ] = cheb2ord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= cheby2(N,as1,Wc,'s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'blue');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'blue');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==4)
            [N,Wc ] = ellipord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= ellip(N,ap1,as1,Wc,'s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;


            
        end
    elseif(lx1 == 4)
        if(yx == 1)
            [N,Wc ] = buttord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= butter(N,Wc,'stop','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'red');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'red');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==2)
            [N,Wc ] = cheb1ord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= cheby1(N,ap1,Wc,'stop','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'green');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'green');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==3)
            [N,Wc ] = cheb2ord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= cheby2(N,as1,Wc,'stop','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'blue');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'blue');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==4)
            [N,Wc ] = ellipord(wp1*fs1,ws1*fs1,ap1,as1,'s')
            [B,A ]= ellip(N,ap1,as1,Wc,'stop','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = impinvar(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;


            
        end

        
    end
elseif(ff==2)
    if(lx1 == 1)
        if(yx == 1)
            [N,Wc ] = buttord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= butter(N,Wc,'low','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#DAA520');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#DAA520');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
             %figure
             %plot(W/pi,H);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
             %plot(w1z/pi,H1);xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB')
        elseif(yx==2)
            [N,Wc ] = cheb1ord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= cheby1(N,ap1,Wc,'low','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#A020F0');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#A020F0');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==3)
            [N,Wc ] = cheb2ord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= cheby2(N,as1,Wc,'low','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#FF1493');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#FF1493');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==4)
            [N,Wc ] = ellipord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= ellip(N,ap1,as1,Wc,'low','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,'Color','#32CD32');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,'Color','#32CD32');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;

            
        end
    elseif(lx1==2)
        if(yx == 1)
            [N,Wc ] = buttord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= butter(N,Wc,'high','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#DAA520');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#DAA520');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==2)
            [N,Wc ] = cheb1ord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= cheby1(N,ap1,Wc,'high','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#A020F0');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#A020F0');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==3)
            [N,Wc ] = cheb2ord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= cheby2(N,as1,Wc,'high','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#FF1493');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#FF1493');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==4)
            [N,Wc ] = ellipord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= ellip(N,ap1,as1,Wc,'high','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,'Color','#32CD32');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,'Color','#32CD32');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;

            
        end
    elseif(lx1==3)
        if(yx == 1)
            [N,Wc ] = buttord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= butter(N,Wc,'s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#DAA520');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#DAA520');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==2)
            [N,Wc ] = cheb1ord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= cheby1(N,ap1,Wc,'s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#A020F0');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#A020F0');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==3)
            [N,Wc ] = cheb2ord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= cheby2(N,as1,Wc,'s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#FF1493');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#FF1493');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==4)
            [N,Wc ] = ellipord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= ellip(N,ap1,as1,Wc,'s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,'Color','#32CD32');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,'Color','#32CD32');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;

            
        end
    elseif(lx1 == 4)
        if(yx == 1)
            [N,Wc ] = buttord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= butter(N,Wc,'stop','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#DAA520');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#DAA520');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==2)
            [N,Wc ] = cheb1ord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= cheby1(N,ap1,Wc,'stop','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#A020F0');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#A020F0');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==3)
            [N,Wc ] = cheb2ord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= cheby2(N,as1,Wc,'stop','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,"Color",'#FF1493');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,"Color",'#FF1493');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
        elseif(yx==4)
            [N,Wc ] = ellipord(tan(wp1/2)*fs1*2,tan(ws1/2)*fs1*2,ap1,as1,'s')
            [B,A ]= ellip(N,ap1,as1,Wc,'stop','s')
            W = 0 :0.01:pi*fs1
            [H W ] = freqs(B,A,W)
            H = 20*log10(abs(H))
            [Bz,Az ] = bilinear(B,A,fs1)
            w = 0:0.1:pi
            [Hz,w1z] = freqz(Bz,Az,w);
            H1 = 20*log10(abs(Hz))
            axes(handles.axes1)
            plot(w1z/pi,H1,'Color','#32CD32');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;
            axes(handles.axes2)
            plot(W/pi,H,'Color','#32CD32');xlabel('\omega/\pi');ylabel('|H(e^j^\omega)|/dB');
            hold on;

            
        end

        
    end


end
catch
    run("lbqbc.m")
end




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1)
cla(handles.axes2)

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N = 31;
w1=winfunction(1,N);
w2=winfunction(2,N);
w3=winfunction(3,N);
w4=winfunction(4,N);
w5=winfunction(5,N);
wvtool(w1,w2,w3,w4,w5)
legend('矩形窗','汉宁窗','汉明窗','布莱克曼窗','三角窗')



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(0,'CurrentFigure',bangzhu9);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('sy123.pptx')%在引号内修改课件名称


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
var = get(handles.slider2,'Value')
set(handles.edit3,'String',num2str(floor(var)))

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
var = get(handles.slider1,'Value')
set(handles.edit2,'String',num2str(floor(var)))

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
var = get(handles.slider5,'Value')
set(handles.edit10,'String',num2str(floor(var)))

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
var = get(handles.slider6,'Value')
set(handles.edit6,'String',num2str(floor(var)))

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
var = get(handles.slider7,'Value')
set(handles.edit7,'String',num2str(floor(var)))

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
