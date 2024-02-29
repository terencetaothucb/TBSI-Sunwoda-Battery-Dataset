clear
load("Features.mat")
FtsNames = {'T', 'U1', 'U2', 'U3', 'U4', 'U5', 'U6', 'U7', 'U8', 'U9',...
    'VC89', 'VD9', 'tVD9', 'ReVC', 'ReVD', 'tReVD',...
    'Vg1', 'Vg2', 'Vg3', 'Vg4', 'Vg5', 'Vg6', 'Vg7', 'Vg8', 'Vg9',...
    'RVg',...
    'Q1', 'Q2', 'Q3', 'Q4', 'Q5', 'Q6', 'Q7', 'Q8', 'Q9',...
    'RL1', 'RL2', 'RL3', 'RL4', 'RL5', 'RL6', 'RL7', 'RL8', 'RL9',...
    'RO1', 'RO2', 'RO3', 'RO4', 'RO5', 'RO6', 'RO7', 'RO8'};

fields = fieldnames(Features);
numBatteries = length(fields);

% Looping through each field of the struct
for i = 1:numBatteries
    field_name = fields{i};
    data_table = array2table(Features.(field_name), 'VariableNames', FtsNames);
    writetable(data_table, 'Features.xlsx', 'Sheet', field_name);
    
    % Print progress
    fprintf('Processing batteries %d of %d: %s\n', i, numBatteries, field_name);
end
