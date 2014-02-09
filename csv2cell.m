function csvCell = csv2cell(filename, delimiter, sup)
%CSV2CELL - Creates a cell array from the csv 'filename'.
%   Initially creates a cell array containing strings, then parses the
%   strings into the original format (as much as possible).
%   Sup(remum) should be a number greater than the number of rows
%   in the csv, used for initialising the cell array (not necessarily the
%   supremum of cell array, which probably doesn't exist).
fid = fopen(filename, 'r');     % Opening the csv.
csvCell = cell(sup, 1);            % Preallocating cell array.
lineIndex = 1;                        % Index of cell to place next line.
nextLine = fgetl(fid);             % Read the first line from the file.
while nextLine ~= -1                   % Loop until end of file.
    csvCell{lineIndex} = nextLine; % Add line from csv to cell array.
    lineIndex = lineIndex + 1;       % Increment the index for next line.
    nextLine = fgetl(fid);              % Read next line from csv file.
end
fclose(fid);                                        % Close the file.
csvCell = csvCell(1 : lineIndex - 1);    % Remove blanks at the end.
% Still need to use delimiter to separate out lines into individual
% elements.
for lineStr = 1 : lineIndex - 1                  % Loop over all lines.
    % Read the string in each line.
    lineData = textscan(csvCell{lineStr}, '%s', 'Delimiter', delimiter);
    lineData = lineData{1};                      % Convert from cell array.
    % Add a blank element to the end of row if the line ends with a
    % delimiter.
    if strcmp(csvCell{lineStr}(end), delimiter)
        lineData{end + 1} = ' ';
    end
    % Overwrite cell array with strings separated into elements.
    csvCell(lineStr, 1 : numel(lineData)) = lineData;
end
% Finally, looping through all elements in the cell array, and converting
% numbers to the 'double' data type.
for eltIndex = 1 : numel(csvCell)           % Looping through all elements.
    % Checking all members of string are numbers, and if so, changing
    % type to 'double'.
    if ~isnan(str2double(csvCell{eltIndex}))
        x = str2double(csvCell{eltIndex});
        csvCell{eltIndex} = x;
    end
end
end

