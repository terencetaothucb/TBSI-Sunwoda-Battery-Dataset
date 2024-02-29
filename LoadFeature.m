clear
% Get a list of all .mat files in the current directory
files = dir('*.mat'); 

% Initialize FeatureInfo as an empty cell array
FeatureInfo = cell(length(files), 1); 

% Loop over all files
for i = 1:length(files)
    % Store the filename in FeatureInfo
    FeatureInfo{i} = files(i).name; 
    % Load the file into the workspace
    load(files(i).name); 
end
clear i FeatureInfo files