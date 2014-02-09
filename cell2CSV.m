function cell2CSV(myCell, filename)
%CELL2CSV Writes myCell to a .csv file in the current directory.
%   Takes a cell array myCell which contains only logicals, characters, or
%   numbers, and writes them to the csv file myCell.csv
[nrows, ~] = size(myCell); % Determining number of rows.
fid = fopen(filename, 'w'); % Opening the file,
for row = 1 : nrows % Looping through the rows of cell array.
    % Make a format string, based on current row.
    formatStrings = row2format(myCell(row, : ));
    % Write the row into the csv.
    fprintf(fid, [formatStrings, '\n'], myCell{row, : });
end
fclose(fid); % Close the file
end
% Functions
function formStrings = row2format(rowCell)
    % Initialise the format string with blanks - each has a '%', the format
    % code, and a comma.
    formStrings = blanks(3 * length(rowCell) - 1);
    marker = 1;
    % Loop over all members of the row.
    for x = 1 : length(rowCell)
        % Setting a comma to delineate each entry.
        if (x==1)
            y = x + 1;
            delim = '%';
        else
            y = marker + 2;
            delim = ',%';
        end
        % Determining data type, and creating the relevant format string.
        if isnumeric(rowCell{x})
            formStrings(marker : y) = [delim, 'd'];
        elseif ischar(rowCell{x})
            formStrings(marker : y) = [delim, 's'];
        else
            error('myCell in the wrong format')
        end
        marker = y + 1;
    end
end
