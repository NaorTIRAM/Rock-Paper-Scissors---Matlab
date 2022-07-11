function varargout = Rock_paper_scissors(varargin)
% ROCK_PAPER_SCISSORS MATLAB code for Rock_paper_scissors.fig
%      ROCK_PAPER_SCISSORS, by itself, creates a new ROCK_PAPER_SCISSORS or raises the existing
%      singleton*.
%
%      H = ROCK_PAPER_SCISSORS returns the handle to a new ROCK_PAPER_SCISSORS or the handle to
%      the existing singleton*.
%
%      ROCK_PAPER_SCISSORS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROCK_PAPER_SCISSORS.M with the given input arguments.
%
%      ROCK_PAPER_SCISSORS('Property','Value',...) creates a new ROCK_PAPER_SCISSORS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rock_paper_scissors_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rock_paper_scissors_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rock_paper_scissors

% Last Modified by GUIDE v2.5 13-Jun-2021 12:25:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rock_paper_scissors_OpeningFcn, ...
                   'gui_OutputFcn',  @Rock_paper_scissors_OutputFcn, ...
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


% --- Executes just before Rock_paper_scissors is made visible.
function Rock_paper_scissors_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rock_paper_scissors (see VARARGIN)

[a,map]=imread('rock.png'); 
[r,c,d]=size(a); 
x=ceil(r/100);
y=ceil(c/100); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.pushbutton1,'CData',g);

[a,map]=imread('paper.png');
[r,c,d]=size(a); 
x=ceil(r/100); 
y=ceil(c/100); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.pushbutton2,'CData',g);

[a,map]=imread('scissors.png');
[r,c,d]=size(a); 
x=ceil(r/100); 
y=ceil(c/100); 
g=a(1:x:end,1:y:end,:);
g(g==255)=5.5*255;
set(handles.pushbutton3,'CData',g);

% Choose default command line output for Rock_paper_scissors
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Rock_paper_scissors wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Rock_paper_scissors_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
function random_rps= rps()
% This program will generate random numbers and place them in certain
% meaning representation
r=rand(1,1)*99;

if r>=0 && r<=33
    random_rps = 1;
elseif r>33 && r<=66
    random_rps = 2;
else
    random_rps = 3;
end 

function user_vs_computer = play(user_choice,random_rps)

game= 10*user_choice+random_rps;

switch game 
    case {12,23,31}
        user_vs_computer = 0;
    case{13,21,32}
        user_vs_computer = 1;
    otherwise 
        user_vs_computer = 2;
end

function displayResults(user_choice,handles)

game_opt= {'Rock','Paper','Scissors'};
result_opt= {'loose','win','tie'};


random_rps=rps();
user_vs_computer = play(user_choice,random_rps);




set(handles.txtComputerChoice, 'String',game_opt{random_rps}); 
set(handles.txtgame, 'String',result_opt{user_vs_computer+1}); 


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
user_choice=1;
displayResults(user_choice,handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
user_choice=2;
displayResults(user_choice,handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
user_choice=3;
displayResults(user_choice,handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txtComputerChoice, 'String',''); 
set(handles.txtgame, 'String',''); 

function txtgame_CreateFcn(~,~,~)
%do nothing
function txtComputerChoice_CreateFcn(~,~,~)
%do nothing

