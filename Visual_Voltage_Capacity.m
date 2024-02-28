clear
% Load the data file
load('B26T55.mat'); % modify this line to select batteries

startCycle = 1; % Starting cycle number
endCycle = 900; % Ending cycle number (change as needed)
% Generate a colormap for the specified number of cycles
colors = jet(endCycle - startCycle + 1);

% Create a new figure for the combined plot
figure;
resolution = 100;
% Loop over the specified range of cycles
for i = startCycle:resolution:endCycle
    fprintf('Processing Cycle %d...\n', i);
    % Initialize a variable for accumulating Q values
    accumulatedQ = 0;

    % Initialize vectors to store all Q and Voltage values for the current cycle
    cycleQ = [];
    cycleVoltage = [];

    % Loop over each channel from Ch1 to Ch9
    for ch = 1:9
        channelName = sprintf('Ch%d', ch); % Create the channel name dynamically

        % Extract Q and Voltage for the current channel
        Q = data.Cycles(i).(channelName).Q;
        Voltage = data.Cycles(i).(channelName).Voltage;

        % Adjust Q values by adding the accumulated Q value
        adjustedQ = Q + accumulatedQ;

        % Append the adjusted Q and corresponding Voltage values for the current cycle
        cycleQ = [cycleQ; adjustedQ];
        cycleVoltage = [cycleVoltage; Voltage];

        % Update the accumulated Q value for the next channel
        accumulatedQ = accumulatedQ + max(Q);
    end
    % Plotting for the current cycle with a specific color
    scatter(cycleQ, cycleVoltage, 15, colors(i-startCycle+1, :), 'filled');
    hold on; % Hold on to plot the next cycle on the same figure  
end
% Finalize the plot
set(gca, 'FontSize', 14, 'FontName', 'Arial'); % Set tick size

xlabel('Capacity (Ah)');
xtickformat('%.1f'); % Set the format for x-axis tick labels
ylabel('Voltage (V)');
ytickformat('%.1f'); % Set the format for y-axis tick labels
title('Voltage V.S. Capacity for Step 1 to 9 in Selected Lifetime');
legend(arrayfun(@(x) sprintf('Cycle %d', x), resolution *(startCycle:endCycle), 'UniformOutput', false),Location="southeast");
hold off; % Release the plot hold

% Save the figure with specified resolution
print(gcf, 'Voltage_vs_Capacity.jpg', '-djpeg', '-r600'); % Save as JPEG format at 600 dpi