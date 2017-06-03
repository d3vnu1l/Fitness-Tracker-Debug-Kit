function [ ] = debugTool( )
clear
clc

%check if data was passed, plot & exit. otherwise use serial
button = questdlg('Yes to use serial, no to import data')
if(button=='No')
    %open new set
    [filename, pathname] =uigetfile('.csv');
    dataSet = csvread(strcat(pathname, filename));
    wid = size(dataSet,2);
    len = (size(dataSet,1));
    t = 0:(length(dataSet)-1);
    t = rot90(t,3);
    figure;
    hold on;
    for i = 1:wid
        plot(t,dataSet(1:len,i));
        legend 'item i';   
    end
else

%User Defined Properties 
serialPort = 'COM8';            % define COM port #
plotTitle = 'Serial Data Log';  % plot title
xLabel = 'Elapsed Time (s)';    % x-axis label
yLabel = 'Acceleration';        % y-axis label
plotGrid = 'on';                % 'off' to turn off grid
min = -12000;                   % set y-min
max = 12000;                    % set y-max
scrollWidth = 10;               % display period in plot, plot entire data log if <= 0
delay = .001;                   % make sure sample faster than resolution

%Define Function Variables
time = 0;
data = zeros(1,1);
count = 0;

%Set up Plot
plotGraph = plot(time,data(1,:),'-r',...
            'LineWidth',2,...
            'MarkerFaceColor','w',...
            'MarkerSize',2);
hold on

title(plotTitle,'FontSize',25);
xlabel(xLabel,'FontSize',15);
ylabel(yLabel,'FontSize',15);
axis([0 10 min max]);
grid(plotGrid);

%Open Serial COM Port
s = serial(serialPort, 'BaudRate', 115200)
disp('Close Plot to End Session');
fopen(s);
tic



while ishandle(plotGraph)  %Loop when Plot is Active

dat = fscanf(s,'%d'); %Read Data from Serial as dec

if(~isempty(dat)) %Make sure Data Type is Correct        
    count = count + 1;    
    time(count) = toc;    %Extract Elapsed Time in seconds
    data(:,count) = dat(:,1); %Extract 1st Data Element         

    %Set Axis according to Scroll Width
    if(scrollWidth > 0)
    set(plotGraph,'XData',time(time > time(count)-scrollWidth),...
        'YData', data(1,time > time(count)-scrollWidth));

    axis([time(count)-scrollWidth time(count) min max]);
    else
        
    set(plotGraph,'XData',time,'YData',data(1,:));

    axis([0 time(count) min max]);
    end

    %Allow MATLAB to Update Plot
    pause(delay);
end
end

%Close Serial COM Port and Delete useless Variables
fclose(s);

clear count dat delay max min plotGraph plotGraph1 plotGraph2 plotGrid...
    plotTitle s scrollWidth serialPort xLabel yLabel;

disp('Session Terminated');

prompt = 'Export Data? [Y/N]: ';
str = input(prompt,'s');
if str == 'Y' || strcmp(str, ' Y') || str == 'y' || strcmp(str, ' y')
    %export data
    csvwrite('accelData.txt',data);
    type accelData.txt;
else
end
end

clear str prompt;
end