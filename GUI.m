
function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 15-Apr-2016 04:34:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function pictureHolder_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pictureHolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pictureHolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pictureHolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global picture;
imshow(picture);
set (gcf, 'WindowButtonMotionFcn', @mouseMove);
set (gcf,'WindowButtonDownFcn',@mouseClick);

% Hint: place code in OpeningFcn to populate pictureHolder

% --- Executes on selection change in axis.
function axis_Callback(hObject, eventdata, handles)
% hObject    handle to axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns axis contents as cell array
%        contents{get(hObject,'Value')} returns selected item from axis
global direction;
contents = cellstr(get(hObject,'String'));
direct=contents{get(hObject,'Value')};
switch(direct)
    case 'X-axis'
        direction='x';
    case 'Y-axis'
        direction='y';
    case 'Z-axis'
        direction='z';
end

% --- Executes during object creation, after setting all properties.
function axis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in primitives.
function primitives_Callback(hObject, eventdata, handles)
% hObject    handle to primitives (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns primitives contents as cell array
%        contents{get(hObject,'Value')} returns selected item from primitives
str=get(hObject,'String');
val=get(hObject,'Value');
global dataType;
% Parallel Lines
% Origin
% Reference Length
% Measuring Lines
% Texture Polygons
% Texture Path

switch str{val}
    case 'Parallel Lines'
       dataType=1;
       updatePicture();
       updateInfo();
    case 'Origin'
       dataType=2;
       updatePicture();
       updateInfo();
    case 'Reference Plane Point'
       dataType=3;
       updatePicture();
       updateInfo();
    case 'Reference Height Point'
        dataType=4;
        updatePicture();
        updateInfo();
       
end
% --- Executes during object creation, after setting all properties.
function primitives_CreateFcn(hObject, eventdata, handles)
% hObject    handle to primitives (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on primitives and none of its controls.
function primitives_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to primitives (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Load_Button.
function Load_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Load_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FilterSpec='.jpg';
[FileName,PathName,FilterIndex] = uigetfile(FilterSpec);
file=fullfile(PathName,FileName);
global picture;
picture=imread(file);
updatePicture();

function mouseMove (object, eventdata)
C = get (gca, 'CurrentPoint');
textX=findobj('Tag','pixelX');
textY=findobj('Tag','pixelY');
set(textX,'String',num2str(int64(C(1,1))));
set(textY,'String',num2str(int64(C(1,2))));

function mouseClick (object,eventdata)
C=get (gca,'CurrentPoint');
addDataPoint(int64(C(1,1)),int64(C(1,2)));


% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dataType;
switch dataType
    case 1
        calculate_vlines();
    case 3
        calculate_H();
end



function Info_Callback(hObject, eventdata, handles)
% hObject    handle to info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of info as text
%        str2double(get(hObject,'String')) returns contents of info as a double


% --- Executes during object creation, after setting all properties.
function info_CreateFcn(hObject, eventdata, handles)
% hObject    handle to info (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Load_Button_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Load_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
