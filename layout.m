function varargout = layout(varargin)
% LAYOUT MATLAB code for layout.fig
%      LAYOUT, by itself, creates a new LAYOUT or raises the existing
%      singleton*.
%
%      H = LAYOUT returns the handle to a new LAYOUT or the handle to
%      the existing singleton*.
%
%      LAYOUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAYOUT.M with the given input arguments.
%
%      LAYOUT('Property','Value',...) creates a new LAYOUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before layout_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to layout_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help layout

% Last Modified by GUIDE v2.5 02-Jul-2017 18:53:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @layout_OpeningFcn, ...
                   'gui_OutputFcn',  @layout_OutputFcn, ...
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


% --- Executes just before layout is made visible.
function layout_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to layout (see VARARGIN)
%User Defined Properties
handles.serialPort = "";            % define COM port #
plotTitle = 'Serial Data Log';  % plot title
xLabel = 'Elapsed Time (s)';    % x-axis label
yLabel = 'Acceleration';        % y-axis label
handles.term = 'CR/LF';                 % line terminator
handles.min = -2000;                   % set y-min
handles.max = 2000;                    % set y-max
handles.scrollWidth = 18;               % display period in plot, plot entire data log if <= 0
handles.delay = .01;                    % make sure sample faster than resolution



%Define Function Variables
handles.time = 0;
handles.data = 0;
handles.data2 = 0;
handles.data3 = 0;
handles.data4 = 0;
handles.data5 = 0;
handles.count = 0;
handles.enable = true;

%Set up Plot
handles.plotGraph = plot(handles.time,handles.data,'-r' );
hold on;
handles.plotGraph2 = plot(handles.time,handles.data2,'-b');
handles.plotGraph3 = plot(handles.time, handles.data3,'-g' );
handles.plotGraph4 = plot(handles.time,handles.data4,'-y');
title(plotTitle,'FontSize',25);
xlabel(xLabel,'FontSize',15);
ylabel(yLabel,'FontSize',15);
axis([0 10 handles.min handles.max]);


% Choose default command line output for layout
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes layout wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = layout_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectedItem = get(handles.listbox2, 'value');
serinfo = instrhwinfo('serial');
handles.serialPort = serinfo.AvailableSerialPorts(selectedItem);
%Set up Serial COM Port
handles.ser = serial(handles.serialPort, 'BaudRate', 115200)
handles.ser.Terminator = handles.term;
fopen(handles.ser);
guidata(hObject,handles)






% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
instrreset;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
serinfo= instrhwinfo('serial');
set(handles.listbox2,'String',serinfo.AvailableSerialPorts) %set string
guidata(hObject,handles)


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
guidata(hObject,handles)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
if(get(hObject,'Value'))
    grid on;
else
    grid off;
end
guidata(hObject,handles)

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
if(get(hObject,'Value'))
    handles.data.handles.visible = false
else
    handles.data.handles.visible = true
end
guidata(hObject,handles)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fclose(handles.ser)
clear handles.count handles.dat handles.delay handles.max handles.min handles.plotGraph handles.plotGraph1 handles.plotGraph2 handles.plotGrid...
handles.plotTitle handles.s handles.scrollWidth handles.serialPort handles.xLabel handles.yLabel;
handles.data=rot90(handles.data,3);
handles.data2=rot90(handles.data2,3);
handles.data3=rot90(handles.data3,3);
handles.data4=rot90(handles.data4,3);
dataCat = [handles.data,handles.data2,handles.data3,handles.data4];
dlmwrite ('accelData.csv', dataCat, ',');
type accelData.csv;
guidata(hObject,handles)

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton3
if(get(hObject,'Value'))
    tic
    while (get(hObject,'Value'))       %Loop when Plot is Active

        dat = fscanf(handles.ser, '%d,%f,%d,%d');

        if(~isempty(dat)&&length(dat)>=3)               %Make sure Data Type is Correct
            handles.count = handles.count + 1;
            handles.time(handles.count) = toc;          %Extract Elapsed Time in seconds
            handles.data(handles.count) = 5*dat(1);       %Extract 1st Data Element
            handles.data2(handles.count) = 3*dat(2);      %Extract 2st Data Element
            handles.data3(handles.count) = dat(3);      %Extract 3st Data Element
            handles.data4(handles.count) = dat(4);      %Extract 2st Data Element


            %Set Axis according to Scroll Width
            if(handles.scrollWidth > 0)

                set(handles.plotGraph,'XData',handles.time(handles.time > handles.time(handles.count)-handles.scrollWidth),'YData',handles.data(handles.time > handles.time(handles.count)-handles.scrollWidth));
                set(handles.plotGraph2,'XData',handles.time(handles.time > handles.time(handles.count)-handles.scrollWidth),'YData',handles.data2(handles.time > handles.time(handles.count)-handles.scrollWidth));
                set(handles.plotGraph3,'XData',handles.time(handles.time > handles.time(handles.count)-handles.scrollWidth),'YData',handles.data3(handles.time > handles.time(handles.count)-handles.scrollWidth));
                set(handles.plotGraph4,'XData',handles.time(handles.time > handles.time(handles.count)-handles.scrollWidth),'YData',handles.data4(handles.time > handles.time(handles.count)-handles.scrollWidth));
                axis([handles.time(handles.count)-handles.scrollWidth handles.time(handles.count) handles.min handles.max]);

            else
                set(handles.plotGraph,'XData',handles.time,'YData',handles.data);
                set(handles.plotGraph2,'XData',handles.time,'YData',handles.data2);
                set(handles.plotGraph3,'XData',handles.time,'YData',handles.data3);
                set(handles.plotGraph4,'XData',handles.time,'YData',handles.data4);
                axis([0 handles.time(handles.count) handles.min handles.max]);
            end

            %Allow MATLAB to Update Plot
            pause(handles.delay);
            guidata(hObject,handles)
        end
    end
else
    ;
end