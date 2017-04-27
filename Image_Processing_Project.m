function varargout = Image_Processing_Project(varargin)
% IMAGE_PROCESSING_PROJECT MATLAB code for Image_Processing_Project.fig
%      IMAGE_PROCESSING_PROJECT, by itself, creates a new IMAGE_PROCESSING_PROJECT or raises the existing
%      singleton*.
%
%      H = IMAGE_PROCESSING_PROJECT returns the handle to a new IMAGE_PROCESSING_PROJECT or the handle to
%      the existing singleton*.
%
%      IMAGE_PROCESSING_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_PROCESSING_PROJECT.M with the given input arguments.
%
%      IMAGE_PROCESSING_PROJECT('Property','Value',...) creates a new IMAGE_PROCESSING_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Image_Processing_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Image_Processing_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Image_Processing_Project

% Last Modified by GUIDE v2.5 27-Apr-2017 07:16:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Image_Processing_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Image_Processing_Project_OutputFcn, ...
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


% --- Executes just before Image_Processing_Project is made visible.
function Image_Processing_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Image_Processing_Project (see VARARGIN)

% Choose default command line output for Image_Processing_Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Image_Processing_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Image_Processing_Project_OutputFcn(hObject, eventdata, handles) 
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
[filename pathname]= uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif'},'File Selector');
handles.image_1= strcat(pathname, filename);
axes(handles.axes1)
imshow(handles.image_1)
InfoImage = imfinfo(handles.image_1);
set(handles.edit7,'String',num2str(InfoImage.Width));
set(handles.edit8,'String',num2str(InfoImage.Height));
set(handles.edit9,'String',num2str(InfoImage.BitDepth));
set(handles.Im_name,'string',filename);
image_2 = imread(handles.image_1);
if size(image_2,3)==1
    handles.gray_image=image_2;
else
    handles.gray_image=rgb2gray(image_2);
end
handles.grey_1=handles.gray_image;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text3.
function text3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename



function Im_name_Callback(hObject, eventdata, handles)
% hObject    handle to Im_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Im_name as text
%        str2double(get(hObject,'String')) returns contents of Im_name as a double


% --- Executes during object creation, after setting all properties.
function Im_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Im_name (see GCBO)
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
cam=webcam;
handles.image_1 = snapshot(cam);
closePreview(cam);
axes(handles.axes1)
imshow(handles.image_1);
handles.gray_image=rgb2gray(handles.image_1);
guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_2 = imread(handles.image_1);
if size(image_2,3)==1
    handles.gray_image=image_2;
else
    handles.gray_image=rgb2gray(image_2);
end
guidata(hObject,handles);
axes(handles.axes2);
imshow(handles.gray_image);
guidata(hObject,handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

guidata(hObject,handles);



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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.a=get(handles.slider2,'Value');
%returns position of slider
handles.Grey_quant=(handles.gray_image)/(str2double(handles.grayValues));
axes(handles.axes4);
imshow(handles.Grey_quant)
guidata(hObject,handles);
axes(handles.axes3);
[pixelCount grayLevels]=imhist(handles.Grey_quant);
%subplot(1, 2, 2);
bar(pixelCount);
title('');
set(gca,'YScale','log')
xlim([0 grayLevels(end)+20]); % Scale x axis manually.
yRange = ylim;
Im_mean = mean2(handles.Grey_quant);
Im_std = std2(handles.Grey_quant);
set(handles.edit2,'string',Im_mean);
set(handles.edit3,'string',Im_std);
maxGrayLevel = max(handles.Grey_quant(:));
set(handles.edit10,'String',num2str(maxGrayLevel));
guidata(hObject,handles);

%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image_2=imread(handles.image_1);
image_Reseize=imresize(image_2,str2double(handles.reseize),handles.reseize_Method);
axes(handles.axes5);
imshow(image_Reseize)


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
handles.reseize=get(hObject,'String');
guidata(hObject,handles);

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
handles.reseize_method=get(hObject,'String');
guidata(hObject,handles);

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


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
set(handles.edit6,'string',handles.reseize_method);

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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = get(hObject,'Value')
switch contents
    case 1
        do_none=1;
    case 2
        handles.reseize_Method='nearest';
    case 3 
        handles.reseize_Method='bilinear';
    case 4
        handles.reseize_Method='bicubic';
    otherwise
end        
guidata(hObject,handles);

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


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
set(handles.edit7,'string',size(handles.image_1));
guidata(hObject,handles);


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


% --- Executes when uipanel5 is resized.
function uipanel5_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
bit_value = get(hObject,'Value')
switch bit_value
    case 1
        handles.bits=16;
    case 2 
         handles.bits=8;
    case 3
         handles.bits=4;
    otherwise
end        
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.grayValues=get(hObject,'String');
%returns position of slider
handles.Grey_quant=(handles.gray_image)/(str2double(handles.grayValues));
axes(handles.axes4);
imshow(handles.Grey_quant)
guidata(hObject,handles);
axes(handles.axes3);
[pixelCount grayLevels]=imhist(handles.Grey_quant);
%subplot(1, 2, 2);
bar(pixelCount);
title('');
set(gca,'YScale','log')
xlim([0 grayLevels(end)+20]); % Scale x axis manually.
yRange = ylim;
Im_mean = mean2(handles.Grey_quant);
Im_std = std2(handles.Grey_quant);
set(handles.edit2,'string',Im_mean);
set(handles.edit3,'string',Im_std);
maxGrayLevel = max(handles.Grey_quant(:));
guidata(hObject,handles);

%returns contents of edit11 as text
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


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
intensity = get(hObject,'Value')
switch intensity
    case 1
        a;
    case 2 
        handles.low=0;
        handles.high=1;
       
    case 3
        handles.low=0;
        handles.high=1;
    otherwise
end        
guidata(hObject,handles);
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



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g=im2double(handles.gray_image);
c=str2double(get(hObject,'String')); 

[M,N]=size(g);
        for x = 1:M
            for y = 1:N
                m=g(x,y);
                z(x,y)=c.*log10(1+m); %#ok<AGROW>
            end
        end
axes(handles.axes7);
imshow(z)
 %returns contents of edit12 as text
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


% --- Executes on button press in Negative.
function Negative_Callback(hObject, eventdata, handles)
% hObject    handle to Negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 handles.gray_image=imadjust(handles.gray_image,[0 1],[1 0]);
 axes(handles.axes7);
 imshow(handles.gray_image)
guidata(hObject,handles);

% --- Executes on button press in log.
function log_Callback(hObject, eventdata, handles)
% hObject    handle to log (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pow.

% hObject    handle to pow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in piece.
function piece_Callback(hObject, eventdata, handles)
% hObject    handle to piece (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
g=im2double(handles.gray_image);
m=mean2(g);
E=str2double(handles.pre_value);
[M,N]=size(g);
        for x = 1:M
            for y = 1:N
                gm=g(x,y);
                z(x,y)=1/(1+(m/gm)^E);
            end
        end
axes(handles.axes7);
handles.gray_image=z;
imshow(handles.gray_image)
guidata(hObject,handles);

% Hint: get(hObject,'Value') returns toggle state of piece


% --- Executes on button press in pre.
function pre_Callback(hObject, eventdata, handles)
% hObject    handle to pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gm=str2double(handles.gamma_pre); 
low=str2double(handles.reg_Low);
 high=str2double(handles.reg_Hi);
grey_Reg=imadjust(handles.gray_image,[low high],[0 1],gm);
 axes(handles.axes7);
 imshow(grey_Reg);
%handles.grey_image=grey_Reg;
 guidata(hObject,handles);



function pow_Callback(hObject, eventdata, handles)
% hObject    handle to pow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.c_pow=get(hObject,'String');
guidata(hObject,handles);

%returns contents of pow as text
%        str2double(get(hObject,'String')) returns contents of pow as a double


% --- Executes during object creation, after setting all properties.
function pow_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.gamma_pow=get(hObject,'String') 
%returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
G=str2double(handles.gamma_pow);%Gamma =0.40
C=str2double(handles.c_pow);
a=handles.gray_image;
c=im2double(a(:,:,1));
[m n]=size(c);
for i=1:1:m
    for j=1:1:n
        b(i,j)=C*(c(i,j)^G);
    end
end
%display image range [0 255]
axes(handles.axes7);
handles.gray_image=b;
imshow(handles.gray_image);
guidata(hObject,handles);



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.reg_Low=get(hObject,'String')
guidata(hObject,handles);

%returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double

handles.reg_Hi=get(hObject,'String')
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.gamma_pre=get(hObject,'String')
%returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pre_value=get(hObject,'String');
%returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hist_En=handles.gray_image;
enhanc= histeq(hist_En);
axes(handles.axes3);
[pixelCount grayLevels]=imhist(enhanc);
%subplot(1, 2, 2);
bar(pixelCount);
title('');
set(gca,'YScale','log')
xlim([0 grayLevels(end)+20]); % Scale x axis manually.
yRange = ylim;
Im_mean = mean2(enhanc);
Im_std = std2(enhanc);
set(handles.edit2,'string',Im_mean);
set(handles.edit3,'string',Im_std);
axes(handles.axes7);
imshow(enhanc);


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.low_average= get(hObject,'String');
guidata(hObject,handles);
%returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.high_average= get(hObject,'String');
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.low2_average= get(hObject,'String');
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.radius_disk= get(hObject,'String');
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
low=str2double(handles.low_average);
high=str2double(handles.high_average);
%smooth_image=handles.gray_image;
W=fspecial('average',[low  high]);
handles.gray_image=imfilter(handles.gray_image,W);
axes(handles.axes8);
imshow(handles.gray_image)
guidata(hObject,handles);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
disk_r=str2double(handles.radius_disk);
smooth_image1=handles.gray_image;
W1=fspecial('disk',disk_r);
Filtered1=imfilter(smooth_image1,W1);
axes(handles.axes8);
handles.gray_image=Filtered1;
imshow(handles.gray_image)
guidata(hObject,handles);


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dev=str2double(handles.gaus_dev);
low2=str2double(handles.low2_average);
high2=str2double(handles.high2_average);
smooth_image2=handles.gray_image;
W2=fspecial('gaussian',[low2  high2],dev);
Filtered2=imfilter(smooth_image2,W2);
axes(handles.axes8);
handles.gray_image=Filtered2;
imshow(handles.gray_image)
guidata(hObject,handles);



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.high2_average= get(hObject,'String');
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.gaus_dev= get(hObject,'String');
guidata(hObject,handles);
% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pixel_motion=str2double(handles.pixel_m);
alpha_filter=str2double(handles.alpha);
smooth_image3=handles.gray_image;
W3=fspecial('motion',pixel_motion,alpha_filter);
Filtered3=imfilter(smooth_image3,W3);
axes(handles.axes8);
handles.gray_image=Filtered3;
imshow(handles.gray_image)
guidata(hObject,handles);


function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.alpha=get(hObject,'String');
guidata(hObject,handles);
%returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pixel_m=get(hObject,'String');
guidata(hObject,handles);

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double


% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
alpha_filter4=str2double(handles.alpha4);
smooth_image4=handles.gray_image;
W4=fspecial('unsharp',alpha_filter4);
Filtered4=imfilter(smooth_image4,W4)+handles.gray_image;
axes(handles.axes8);
handles.gray_image=Filtered4;
imshow(Filtered4)
guidata(hObject,handles);



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.alpha4=get(hObject,'String');
guidata(hObject,handles);

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double


% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double
handles.high5_average= get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double
handles.low5_average= get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double
handles.gaus_dev5= get(hObject,'String');
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dev5=str2double(handles.gaus_dev5);
low5=str2double(handles.low5_average);
high5=str2double(handles.high5_average);
smooth_image5=handles.gray_image;
W5=fspecial('gaussian',[low5  high5],dev5);
Filtered5=imfilter(smooth_image5,W5)+smooth_image5;
axes(handles.axes8);
handles.gray_image=Filtered5;
imshow(handles.gray_image)
guidata(hObject,handles);


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = get(hObject,'Value')
switch contents
    case 1
        do_none=1;
    case 2
        set(handles.uipanel28, 'Visible','on');
        set(handles.uipanel19, 'Visible','off');
        set(handles.uipanel25, 'Visible','off');
        set(handles.uipanel39, 'Visible','off');
    case 3 
        set(handles.uipanel28, 'Visible','off');
        set(handles.uipanel19, 'Visible','on');
        set(handles.uipanel25, 'Visible','off');
        set(handles.uipanel39, 'Visible','off');
    case 4
        set(handles.uipanel28, 'Visible','off');
        set(handles.uipanel19, 'Visible','off');
        set(handles.uipanel25, 'Visible','on');
        set(handles.uipanel39, 'Visible','off');
    case 5
        set(handles.uipanel28, 'Visible','off');
        set(handles.uipanel19, 'Visible','off');
        set(handles.uipanel25, 'Visible','off');
        set(handles.uipanel39, 'Visible','on');        
    otherwise
end        
guidata(hObject,handles);
%Image_Processing_Project_2(handles);



% --- Executes during object creation, after setting all properties.
function pushbutton30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function im = IdealLowPass(im0,fc) 
% fc is the circular cutoff frequency which is normalized to [0 1], that is, 
% the highest radian frequency \pi of digital signals is mapped to 1.

[ir,ic,iz] = size(im0); 
hr = (ir-1)/2; 
hc = (ic-1)/2; 
[x, y] = meshgrid(-hc:hc, -hr:hr);

mg = sqrt((x/hc).^2 + (y/hr).^2); 
lp = double(mg <= fc);

IM = fftshift(fft2(double(im0))); 
IP = zeros(size(IM)); 
for z = 1:iz 
    IP(:,:,z) = IM(:,:,z) .* lp; 
end 
im = abs(ifft2(ifftshift(IP)));

% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

FT=fft2(handles.gray_image);
FT_real=abs(FT);
Fs=fftshift(FT_real);
FsL=log(Fs);
%axes(handles.axes8);
%imshow(FsL,[]);
fourier=IdealLowPass(handles.gray_image,handles.Low_Ideal);
handles.gray_image=fourier;
axes(handles.axes8);
imshow(handles.gray_image,[])
guidata(hObject,handles);



function edit50_Callback(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Low_Ideal=str2double(get(hObject,'String')); 
% Hints: get(hObject,'String') returns contents of edit50 as text
%        str2double(get(hObject,'String')) returns contents of edit50 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit50_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function res = blpf(im,thresh,n)

% inputs
% im is the fourier transform of the image
% thresh is the cutoff circle radius (1,2,3...)
% n is the order of the filter (1,2,3...)

%outputs
% res is the filtered image

[r,c]=size(im);
d0=thresh;

d=zeros(r,c);
h=zeros(r,c);

for i=1:r
    for j=1:c
     d(i,j)=  sqrt( (i-(r/2))^2 + (j-(c/2))^2);
    end
end

for i=1:r
    for j=1:c
      h(i,j)=  1 / (1+ (d(i,j)/d0)^(2*n) ) ;
    end
end


for i=1:r
    for j=1:c
    res(i,j)=(h(i,j))*im(i,j);

    end
end





% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% simple implementation of frequency domain filters
%read input image
dim=handles.gray_image;
cim=double(dim);
[r,c]=size(cim);

r1=2*r;
c1=2*c;

pim=zeros((r1),(c1));
kim=zeros((r1),(c1));

%padding
for i=1:r
    for j=1:c
   pim(i,j)=cim(i,j);
    end
end

%center the transform
for i=1:r
    for j=1:c
   kim(i,j)=pim(i,j)*((-1)^(i+j));
    end
end


%2D fft
fim=fft2(kim);

n=handles.butterorder_low; %order for butterworth filter
thresh=handles.butterradius_low; % cutoff radius in frequency domain for filters

% % function call for low pass filters
% him=glp(fim,thresh); % gaussian low pass filter
 him=blpf(fim,thresh,n); % butterworth low pass filter

% % function calls for high pass filters
% him=ghp(fim,thresh); % gaussian low pass filter
%him=bhp(fim,thresh,n);  %butterworth high pass filter

% % function call for high boost filtering
% him=hbg(fim,thresh);  % using gaussian high pass filter
%  him=hbb(fim,thresh,n);  % using butterworth high pass filter


%inverse 2D fft
 ifim=ifft2(him);
 
for i=1:r1
    for j=1:c1
   ifim(i,j)=ifim(i,j)*((-1)^(i+j));
    end
end


% removing the padding
for i=1:r
    for j=1:c
   rim(i,j)=ifim(i,j);
    end
end

% retaining the ral parts of the matrix
rim=real(rim);
rim=uint8(rim);
handles.gray_image=rim;
axes(handles.axes8);
imshow(handles.gray_image);
guidata(hObject,handles);



function edit51_Callback(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 handles.butterorder_low=str2double(get(hObject,'String'))
% Hints: get(hObject,'String') returns contents of edit51 as text
%        str2double(get(hObject,'String')) returns contents of edit51 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit52_Callback(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.butterradius_low=str2double(get(hObject,'String'))
% Hints: get(hObject,'String') returns contents of edit52 as text
%        str2double(get(hObject,'String')) returns contents of edit52 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function res = glp(im,thresh)

% inputs
% im is the fourier transform of the image
% thresh is the cutoff circle radius

%outputs
% res is the filtered image

[r,c]=size(im);
d0=thresh;

d=zeros(r,c);
h=zeros(r,c);

for i=1:r
    for j=1:c
     d(i,j)=  sqrt( (i-(r/2))^2 + (j-(c/2))^2);
    end
end

for i=1:r
    for j=1:c
      h(i,j)=exp ( -( (d(i,j)^2)/(2*(d0^2)) ) );
    end
end


for i=1:r
    for j=1:c
    res(i,j)=(h(i,j))*im(i,j);

    end
end
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


     

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dim=handles.gray_image;
cim=double(dim);
[r,c]=size(cim);

r1=2*r;
c1=2*c;

pim=zeros((r1),(c1));
kim=zeros((r1),(c1));

%padding
for i=1:r
    for j=1:c
   pim(i,j)=cim(i,j);
    end
end

%center the transform
for i=1:r
    for j=1:c
   kim(i,j)=pim(i,j)*((-1)^(i+j));
    end
end


%2D fft
fim=fft2(kim);

thresh=handles.gaussradius_low; % cutoff radius in frequency domain for filters

% % function call for low pass filters
him=glp(fim,thresh); % gaussian low pass filter
% him=blpf(fim,thresh,n); % butterworth low pass filter

% % function calls for high pass filters
%him=ghp(fim,thresh); % gaussian low pass filter
%him=bhp(fim,thresh,n);  %butterworth high pass filter

% % function call for high boost filtering
% him=hbg(fim,thresh);  % using gaussian high pass filter
%  him=hbb(fim,thresh,n);  % using butterworth high pass filter


%inverse 2D fft
 ifim=ifft2(him);
 
for i=1:r1
    for j=1:c1
   ifim(i,j)=ifim(i,j)*((-1)^(i+j));
    end
end


% removing the padding
for i=1:r
    for j=1:c
   rim(i,j)=ifim(i,j);
    end
end

% retaining the ral parts of the matrix
rim=real(rim);
rim=uint8(rim);
handles.gray_image=rim;
axes(handles.axes8);
imshow(handles.gray_image)
guidata(hObject,handles);



function edit53_Callback(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit53 as text
%        str2double(get(hObject,'String')) returns contents of edit53 as a double
handles.gaussradius_low= str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function edit53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function im = IdealHiPass(im0,fc) 
% fc is the circular cutoff frequency which is normalized to [0 1], that is, 
% the highest radian frequency \pi of digital signals is mapped to 1.

[ir,ic,iz] = size(im0); 
hr = (ir-1)/2; 
hc = (ic-1)/2; 
[x, y] = meshgrid(-hc:hc, -hr:hr);

mg = sqrt((x/hc).^2 + (y/hr).^2); 
lp = double(mg >= fc);

IM = fftshift(fft2(double(im0))); 
IP = zeros(size(IM)); 
for z = 1:iz 
    IP(:,:,z) = IM(:,:,z) .* lp; 
end 
im = abs(ifft2(ifftshift(IP)));

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fourier=IdealHiPass(handles.gray_image,handles.Low_Ideal);
handles.gray_image=fourier;
axes(handles.axes8);
imshow(handles.gray_image,[])
guidata(hObject,handles);



function edit54_Callback(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Low_Ideal=str2double(get(hObject,'String'))
% Hints: get(hObject,'String') returns contents of edit54 as text
%        str2double(get(hObject,'String')) returns contents of edit54 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit55_Callback(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.gaussradius_Hi=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit55 as text
%        str2double(get(hObject,'String')) returns contents of edit55 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function res = ghp(im,thresh)

% inputs
% im is the fourier transform of the image
% thresh is the cutoff circle radius

%outputs
% res is the filtered image

[r,c]=size(im);
d0=thresh;

d=zeros(r,c);
h=zeros(r,c);

for i=1:r
    for j=1:c
     d(i,j)=  sqrt( (i-(r/2))^2 + (j-(c/2))^2);
    end
end

for i=1:r
    for j=1:c
      h(i,j)=1- exp ( -( (d(i,j)^2)/(2*(d0^2)) ) );
    end
end


for i=1:r
    for j=1:c
    res(i,j)=(h(i,j))*im(i,j);

    end
end
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dim=handles.gray_image;
cim=double(dim);
[r,c]=size(cim);

r1=2*r;
c1=2*c;

pim=zeros((r1),(c1));
kim=zeros((r1),(c1));

%padding
for i=1:r
    for j=1:c
   pim(i,j)=cim(i,j);
    end
end

%center the transform
for i=1:r
    for j=1:c
   kim(i,j)=pim(i,j)*((-1)^(i+j));
    end
end


%2D fft
fim=fft2(kim);

thresh=handles.gaussradius_Hi; % cutoff radius in frequency domain for filters

% % function call for low pass filters
% him=glp(fim,thresh); % gaussian low pass filter
% him=blpf(fim,thresh,n); % butterworth low pass filter

% % function calls for high pass filters
him=ghp(fim,thresh); % gaussian low pass filter
%him=bhp(fim,thresh,n);  %butterworth high pass filter

% % function call for high boost filtering
% him=hbg(fim,thresh);  % using gaussian high pass filter
%  him=hbb(fim,thresh,n);  % using butterworth high pass filter


%inverse 2D fft
 ifim=ifft2(him);
 
for i=1:r1
    for j=1:c1
   ifim(i,j)=ifim(i,j)*((-1)^(i+j));
    end
end


% removing the padding
for i=1:r
    for j=1:c
   rim(i,j)=ifim(i,j);
    end
end

% retaining the ral parts of the matrix
rim=real(rim);
rim=uint8(rim);
handles.gray_image=rim;
axes(handles.axes8);
imshow(handles.gray_image)
guidata(hObject,handles);



function edit56_Callback(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.butter_order=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit56 as text
%        str2double(get(hObject,'String')) returns contents of edit56 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit57_Callback(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 handles.butter_radius=str2double(get(hObject,'String'));
guidata(hObject,handles);

% Hints: get(hObject,'String') returns contents of edit57 as text
%        str2double(get(hObject,'String')) returns contents of edit57 as a double


% --- Executes during object creation, after setting all properties.
function edit57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function res = bhp(im,thresh,n)

% inputs
% im is the fourier transform of the image
% thresh is the cutoff circle radius

%outputs
% res is the filtered image

[r,c]=size(im);
d0=thresh;

d=zeros(r,c);
h=zeros(r,c);

for i=1:r
    for j=1:c
     d(i,j)=  sqrt( (i-(r/2))^2 + (j-(c/2))^2);
    end
end

for i=1:r
    for j=1:c
      h(i,j)=  1 / (1+ (d0/d(i,j))^(2*n) ) ;
    end
end


for i=1:r
    for j=1:c
    res(i,j)=(h(i,j))*im(i,j);

    end
end




% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dim=handles.gray_image;
cim=double(dim);
[r,c]=size(cim);

r1=2*r;
c1=2*c;

pim=zeros((r1),(c1));
kim=zeros((r1),(c1));

%padding
for i=1:r
    for j=1:c
   pim(i,j)=cim(i,j);
    end
end

%center the transform
for i=1:r
    for j=1:c
   kim(i,j)=pim(i,j)*((-1)^(i+j));
    end
end


%2D fft
fim=fft2(kim);

thresh=handles.butter_radius; % cutoff radius in frequency domain for filters
n=handles.butter_order;
% % function call for low pass filters
% him=glp(fim,thresh); % gaussian low pass filter
% him=blpf(fim,thresh,n); % butterworth low pass filter

% % function calls for high pass filters
%him=ghp(fim,thresh); % gaussian low pass filter
him=bhp(fim,thresh,n);  %butterworth high pass filter

% % function call for high boost filtering
% him=hbg(fim,thresh);  % using gaussian high pass filter
%  him=hbb(fim,thresh,n);  % using butterworth high pass filter


%inverse 2D fft
 ifim=ifft2(him);
 
for i=1:r1
    for j=1:c1
   ifim(i,j)=ifim(i,j)*((-1)^(i+j));
    end
end


% removing the padding
for i=1:r
    for j=1:c
   rim(i,j)=ifim(i,j);
    end
end

% retaining the ral parts of the matrix
rim=real(rim);
rim=uint8(rim);
handles.gray_image=rim;
axes(handles.axes8);
imshow(handles.gray_image)
guidata(hObject,handles);


% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Kaverage = filter2(fspecial('average',handles.average_size),handles.gray_image)/255;
axes(handles.axes8);
handles.gray_image=Kaverage;
imshow(handles.gray_image)



function edit58_Callback(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.average_size=str2double(get(hObject,'String'))
% Hints: get(hObject,'String') returns contents of edit58 as text
%        str2double(get(hObject,'String')) returns contents of edit58 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit58_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit59_Callback(hObject, eventdata, handles)
% hObject    handle to edit59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.med_size=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit59 as text
%        str2double(get(hObject,'String')) returns contents of edit59 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit59_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Median_noise = medfilt2(handles.gray_image, [handles.med_size handles.med_size]);
handles.gray_image=Median_noise;
axes(handles.axes8);
imshow(handles.gray_image)



function edit60_Callback(hObject, eventdata, handles)
% hObject    handle to edit60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.wein_size=str2double(get(hObject,'String'));
% Hints: get(hObject,'String') returns contents of edit60 as text
%        str2double(get(hObject,'String')) returns contents of edit60 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit60_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton39.
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Adaptive = wiener2(handles.gray_image,[handles.wein_size handles.wein_size]);
handles.gray_image=Adaptive;
axes(handles.axes8);
imshow(handles.gray_image)


% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Start of PCA code, 
%Data = imread('butterfly.jpg');    
Data_gray = handles.gray_image;     
Data_grayD = im2double(Data_gray);     
        
Data_mean = mean(Data_grayD);      
[a b] = size(Data_gray); 
Data_meanNew = repmat(Data_mean,a,1); 
DataAdjust = Data_grayD - Data_meanNew; 
cov_data = cov(DataAdjust);   
[V, D] = eig(cov_data); 
V_trans = transpose(V); 
DataAdjust_trans = transpose(DataAdjust);  
FinalData = V_trans * DataAdjust_trans;   
% End of PCA code 
% Start of Inverse PCA code, 
OriginalData_trans = inv(V_trans) * FinalData;                         
OriginalData = transpose(OriginalData_trans) + Data_meanNew;               
% End of Inverse PCA code 
  
% Image compression 
PCs=handles.pca_dim;                    
PCs = b - PCs;                                                         
Reduced_V = V;                                                         
for i = 1:PCs,                                                         
Reduced_V(:,1) =[]; 
end 
Y=Reduced_V'* DataAdjust_trans;                                        
Compressed_Data=Reduced_V*Y;                                           
handles.Compressed_Data = Compressed_Data' + Data_meanNew;                     
axes(handles.axes8);
imshow(handles.Compressed_Data) 
guidata(hObject,handles);
% End of image compression



function edit61_Callback(hObject, eventdata, handles)
% hObject    handle to edit61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pca_dim=str2double(get(hObject,'String'))
% Hints: get(hObject,'String') returns contents of edit61 as text
%        str2double(get(hObject,'String')) returns contents of edit61 as a double
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit61_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imwrite(handles.Compressed_Data,'output.jpg');



function edit62_Callback(hObject, eventdata, handles)
% hObject    handle to edit62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit62 as text
%        str2double(get(hObject,'String')) returns contents of edit62 as a double
InfoImage = imfinfo(handles.gray_image);
set(handles.edit62,'String',num2str(InfoImage.size));

% --- Executes during object creation, after setting all properties.
function edit62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
newimage=imsubtract(handles.grey_1,handles.gray_image);
axes(handles.axes7);
handles.gray_image=newimage;
imshow(newimage)
guidata(hObject,handles);
