%% Access data
% Load variables from binary MATLAB file into workspace
load timestampsCN.mat entryTimestamps exitTimestamps  

%% Explore data
% A MAT-file is a binary MATLAB file that stores workspace variables.
% Use whos to list all variables in the workspace, including their type and 
% size
whos

%% Process data
% Compute elapsed durations between entryTimestamps and exitTimestamps
durations = exitTimestamps-entryTimestamps;
% Compute the number of durations
numberOfDurations = numel(durations); 
% Compute the average duration
averageDuration = mean(duration);

%% Visualize data
% Plot all durations 
figure, plot(durations)
% Add a horizontal line with the average duration over the current plot
hold on
plot([1,numberOfDurations],[averageDuration, averageDuration])
hold off

