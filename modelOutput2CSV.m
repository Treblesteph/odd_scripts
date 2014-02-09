function modelOutput2CSV(filename)
%MODELOUTPUT2CSV - Takes a large output file from a model run, and converts
%to csv files.
%   Generates csv files containing parameter names and values, and
%   concentrations of all species against time points.
load(filename);                                     % Load the data file.
paramsFilename = [filename, 'Params.csv']; % Setting filename for parameters csv.
dataFilename = [filename, 'Data.csv'];          % Setting filename for output data.
% Initialising parameter cell array by determining the largest parameter
% value vector size.
pValLengths = zeros(1, length(P_VALUES));
for s = 1 : length(P_VALUES)
    pValLengths(s) = length(P_VALUES{s});
end
maxLen = max(pValLengths);
paramCell = cell(length(P_NAMES)+1, maxLen+1); % Creating parameter cell array.
paramCell{1, 1} = 'P_NAMES';                   % Making header.
for n = 2 : maxLen + 1
    paramCell{1, n} = 'P_VALUES';
end
for x = 2 : length(P_NAMES) + 1                 % Filling parameter cell array.
    paramCell{x, 1} = P_NAMES{x-1};
    for y = 2 : pValLengths(x-1) + 1
        paramCell{x, y} = P_VALUES{x-1}(pValLengths(x-1));
    end
end
cell2CSV(paramCell, paramsFilename)    % Writing parameter cell to csv file.
[nrows, ncols] = size(ALL);                       % Determining how many data.
dataCell = cell(nrows + 1, ncols + 2);       % Creating data cell array.
% Generating header based on each species' index.
dataCell{1, 1} = 'time point';
dataCell{1, 2} = 'time (hours)';
dataCell{1, 3} = 'RNAp';
for n = 1 : N_SIGMAS
dataCell{1, iS(n)+2} = ['sigma', num2str(n)];
dataCell{1, iA(n)+2} = ['anti-sigma', num2str(n)];
dataCell{1, iL(n)+2} = ['ligand', num2str(n)];
dataCell{1, iAL(n)+2} = ['antisig/ligand complex', num2str(n)];
dataCell{1, iSA(n)+2} = ['sigma/antisig complex', num2str(n)];
dataCell{1, iRS(n)+2} = ['RNAp/sigma complex', num2str(n)];
end
% Filling the data cell array.
for x = 1 : nrows
    dataCell{x+1, 1} = TIMES(x);
    dataCell{x+1, 2} = TIMES(x)/3600;
    for y = 1 : ncols
        dataCell{x+1, y+2} = ALL(x, y);
    end
end
cell2CSV(dataCell, dataFilename)             % Writing data cell to csv file.
end