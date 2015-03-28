function varargout = dipola(varargin)
% DIPOLA MATLAB code for dipola.fig
%      DIPOLA, by itself, creates a new DIPOLA or raises the existing
%      singleton*.
%
%      H = DIPOLA returns the handle to a new DIPOLA or the handle to
%      the existing singleton*.
%
%      DIPOLA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIPOLA.M with the given input arguments.
%
%      DIPOLA('Property','Value',...) creates a new DIPOLA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dipola_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dipola_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dipola

% Last Modified by GUIDE v2.5 02-May-2012 14:43:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dipola_OpeningFcn, ...
                   'gui_OutputFcn',  @dipola_OutputFcn, ...
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


% --- Executes just before dipola is made visible.
function dipola_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dipola (see VARARGIN)

% Choose default command line output for dipola
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dipola wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dipola_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function wave_length_Callback(hObject, eventdata, handles)
% hObject    handle to wave_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wave_length as text
%        str2double(get(hObject,'String')) returns contents of wave_length as a double
wavelength = str2double(get(hObject,'string'));
handles.wavelength=wavelength;
if isnan(wavelength)
  errordlg('You must enter a numeric value','Bad Input','modal')
  uicontrol(hObject)
	return
end
guidata(hObject,handles)
handles.wavelength;

% --- Executes during object creation, after setting all properties.
function wave_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wave_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dipole1_Callback(hObject, eventdata, handles)
% hObject    handle to dipole1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dipole1 as text
%        str2double(get(hObject,'String')) returns contents of dipole1 as a double
dipole1 = str2double(get(hObject,'string'));
handles.dipole1=dipole1;
if isnan(dipole1)
  errordlg('You must enter a numeric value','Bad Input','modal')
  uicontrol(hObject)
	return
end
guidata(hObject,handles)
handles.dipole1;

% --- Executes during object creation, after setting all properties.
function dipole1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dipole1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dipole2_Callback(hObject, eventdata, handles)
% hObject    handle to dipole2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dipole2 as text
%        str2double(get(hObject,'String')) returns contents of dipole2 as a double
dipole2= str2double(get(hObject,'string'));
handles.dipole2=dipole2;
if isnan(dipole2)
  errordlg('You must enter a numeric value','Bad Input','modal')
  uicontrol(hObject)
	return
end
guidata(hObject,handles)
handles.dipole2;

% --- Executes during object creation, after setting all properties.
function dipole2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dipole2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dipole3_Callback(hObject, eventdata, handles)
% hObject    handle to dipole3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dipole3 as text
%        str2double(get(hObject,'String')) returns contents of dipole3 as a double
dipole3 = str2double(get(hObject,'string'));
handles.dipole3=dipole3;
if isnan(dipole3)
  errordlg('You must enter a numeric value','Bad Input','modal')
  uicontrol(hObject)
	return
end
guidata(hObject,handles)
handles.dipole3;

% --- Executes during object creation, after setting all properties.
function dipole3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dipole3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function theta_define_Callback(hObject, eventdata, handles)
% hObject    handle to theta_define (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of theta_define as text
%        str2double(get(hObject,'String')) returns contents of theta_define as a double
theta= str2double(get(hObject,'string'));
handles.theta=theta;
if isnan(theta)
  errordlg('You must enter a numeric value','Bad Input','modal')
  uicontrol(hObject)
	return
end
guidata(hObject,handles)
handles.theta;

% --- Executes during object creation, after setting all properties.
function theta_define_CreateFcn(hObject, eventdata, handles)
% hObject    handle to theta_define (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in show_plots.
function show_plots_Callback(hObject, eventdata, handles)
% hObject    handle to show_plots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%theta=handles.theta;
dipole1=handles.dipole1;
dipole2=handles.dipole2;
dipole3=handles.dipole3;
wavelength=handles.wavelength;
theta=0:pi/50:2*pi;
K=2*pi/wavelength;

E1=(cos(K.*dipole1/2.*cos(theta))-cos(K.*dipole1/2))./sin(theta);
 
E2=(cos(K.*dipole2/2.*cos(theta))-cos(K.*dipole2/2))./sin(theta);
 
E3=(cos(K.*dipole3/2.*cos(theta))-cos(K.*dipole3/2))./sin(theta);

axes(handles.polaring1)
polar(handles.polaring1,theta,abs(E2),'b')
hold on
polar(handles.polaring1,theta,abs(E1),'r')
hold on
polar(handles.polaring1,theta,abs(E3),'black')

axes(handles.plotting1)
plot(handles.plotting1,theta*180/pi,abs(E1),'r')
hold on
plot(handles.plotting1,theta*180/pi,abs(E2),'black')
hold on
plot(handles.plotting1,theta*180/pi,abs(E3),'b')
legend('E1','E2','E3')


% --- Executes on button press in contact_btn.
function contact_btn_Callback(hObject, eventdata, handles)
% hObject    handle to contact_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('george.koutitas@gmail.com,alexiosfourlis@gmail.com','Email');

% --- Executes on button press in about_btn.
function about_btn_Callback(hObject, eventdata, handles)
% hObject    handle to about_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Source code by Dr G.Koutitas,GUI develepment by Alexios Fourlis','About');
