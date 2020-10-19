% Simultaneous Plot
clear

data = table2array(readtable('CircuitGSRdata.csv'));
GSR = data(:,2);
GSR(1) = GSR(2);
T = readtable('ShimmerData.csv','Headerlines',1);
% timestamp column
timestamp = table2array(T(:,1));
% get time in seconds
for i = 1:(length(timestamp))
    time(i) = timestamp(i)-timestamp(1);
end

ftime = time(length(time));



ax1 = subplot(2,1,1);
ax2 = subplot(2,1,2);

timeCircuit = linspace(0,ftime,length(GSR));
plot(ax1,timeCircuit, GSR)
axes(ax1)
title(ax1,'My GSR Circuit');
%xlim([0,600]);
%ylim(ax1,[400,800]);
ylabel(ax1,'Analog Read Value');
xlabel(ax1,'time(s)')


% GSR from csv
shGSR = table2array(T(:,10));
% plotting
plot(ax2,time, shGSR);
axes(ax2)
title(ax2,'Shimmer GSR data');
ylabel(ax2,'GSR');
xlabel(ax2,'time (s)');
