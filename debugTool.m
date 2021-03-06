function [ ] = debugTool( port )
clc

% %check if data was passed, plot & exit. otherwise use serial
% button = questdlg('Use UART?');
%
% %RUN HERE WHEN NO SERIAL DATA AVAILABLE
% if(button=='No ')
%     %open new set
%     [filename, pathname] =uigetfile('.csv');
%     dataSet = csvread(strcat(pathname, filename));
%     wid = size(dataSet,2);
%     len = (size(dataSet,1));
%     t = 0:(length(dataSet)-1);
%     t = rot90(t,3);
%     figure;
%     hold on;
%     for i = 1:wid
%         plot(t,dataSet(1:len,i));
%         legend 'item i';
%     end
%
% %RUN HERE FOR UART STREAM
% else
% if (button=='Yes')
%User Defined Properties
serialPort = port;            % define COM port #
plotTitle = 'Serial Data Log';  % plot title
xLabel = 'Elapsed Time (s)';    % x-axis label
yLabel = 'Acceleration';        % y-axis label
term = 'CR/LF';                 % line terminator
min = -2000;                   % set y-min
max = 2000;                    % set y-max
scrollWidth = 18;               % display period in plot, plot entire data log if <= 0
delay = .01;                    % make sure sample faster than resolution


%Define Function Variables
time = 0;
data = 0;
data2 = 0;
data3 = 0;
data4 = 0;
data5 = 0;
count = 0;

%Set up Plot
plotGraph = plot(time,data,'-r' );
hold on;
plotGraph2 = plot(time,data2,'-b');
plotGraph3 = plot(time, data3,'-g' );
plotGraph4 = plot(time,data4,'-y');
title(plotTitle,'FontSize',25);
xlabel(xLabel,'FontSize',15);
ylabel(yLabel,'FontSize',15);
axis([0 10 min max]);

%Open Serial COM Port
s = serial(serialPort, 'BaudRate', 115200)
s.Terminator = term;
disp('Close Plot to End Session');
fopen(s);
tic



while ishandle(plotGraph)       %Loop when Plot is Active
    
    dat = fscanf(s, '%d,%f,%d,%d');
    
    if(~isempty(dat)&&length(dat)>=3)               %Make sure Data Type is Correct
        count = count + 1;
        time(count) = toc;          %Extract Elapsed Time in seconds
        data(count) = 5*dat(1);       %Extract 1st Data Element
        data2(count) = 3*dat(2);      %Extract 2st Data Element
        data3(count) = dat(3);      %Extract 3st Data Element
        data4(count) = dat(4);      %Extract 2st Data Element

        
        %Set Axis according to Scroll Width
        if(scrollWidth > 0)
            
            set(plotGraph,'XData',time(time > time(count)-scrollWidth),'YData',data(time > time(count)-scrollWidth));
            set(plotGraph2,'XData',time(time > time(count)-scrollWidth),'YData',data2(time > time(count)-scrollWidth));
            set(plotGraph3,'XData',time(time > time(count)-scrollWidth),'YData',data3(time > time(count)-scrollWidth));
            set(plotGraph4,'XData',time(time > time(count)-scrollWidth),'YData',data4(time > time(count)-scrollWidth));
            axis([time(count)-scrollWidth time(count) min max]);
            
        else
            set(plotGraph,'XData',time,'YData',data);
            set(plotGraph2,'XData',time,'YData',data2);
            set(plotGraph3,'XData',time,'YData',data3);
            set(plotGraph4,'XData',time,'YData',data4);
            axis([0 time(count) min max]);
        end
        
        %Allow MATLAB to Update Plot
        pause(delay);
    end
end
%end
%Close Serial COM Port and Delete useless Variables
fclose(s);

clear count dat delay max min plotGraph plotGraph1 plotGraph2 plotGrid...
    plotTitle s scrollWidth serialPort xLabel yLabel;

disp('Session Terminated');

prompt = 'Export Data? [Y/N]: ';
str = input(prompt,'s');
if str == 'Y' || strcmp(str, ' Y') || str == 'y' || strcmp(str, ' y')
    %export data
    data=rot90(data,3);
    data2=rot90(data2,3);
    data3=rot90(data3,3);
    data4=rot90(data4,3);
    dataCat = [data,data2,data3,data4];
    dlmwrite ('accelData.csv', dataCat, ',');
    
    type accelData.csv;
else
end
%end
instrreset;
clear str prompt;
end