function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the training data into a figure using the 
%               "figure" and "plot" commands. Set the axes labels using
%               the "xlabel" and "ylabel" commands. Assume the 
%               population and revenue data have been passed in
%               as the x and y arguments of this function.
%
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

figure; % open a new figure window

hPlot = plot(x, y, 'rx', 'MarkerSize', 10); % Plot the data
hYLabel = ylabel('Profit in $10,000s'); % Set the y
hXLabel = xlabel('Population of City in 10,000s'); % Set the x
hTitle = title('Training Data for Assignment 1');

% Pretty up the text...
set(gca, 'FontName', 'Helvetica');
set([hTitle, hXLabel, hYLabel], 'FontName', 'AvantGarde');
%set([hLegend, gca], 'FontSize', 8);
set([hXLabel, hYLabel], 'FontSize', 10);
set(hTitle, 'FontSize', 12, 'FontWeight', 'bold');

% Add horizontal lines
set(gca, ...
	'Box', 'off', ...
	'TickDir', 'out', ...
	'TickLength', [0.02 0.02], ...
	'XMinorTick', 'on', ...
	'YMinorTick', 'on', ...
	'XGrid', 'on', ...
	'YGrid', 'on', ...
	'XColor', [0.3 0.3 0.3], ...
	'YColor', [0.3 0.3 0.3], ...
	'XTick', 5:5:20, ...
	'YTick', -5:5:20, ...
	'LineWidth', 1);

% ============================================================

end
