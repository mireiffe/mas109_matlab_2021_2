function MAS109_assign5_ex1(idn)
% MAS109 MATLAB assignment 5
% Input: Student ID number (an 8 digits number)
% Output: a message box
%
% Author: Seongeun Kim
%         mireiffe@kaist.ac.kr

rng(idn);
rc1 = randi([1, 96], 2, 1);
rng(idn);
rc2 = randi([160, 256], 2, 1);

submat = sprintf("\\fontsize{15} Submatrix:");
rows = sprintf("\\fontsize{15}          Rows : %d < r < %d", rc1(1), rc2(1));
cols = sprintf("\\fontsize{15}          Columns : %d < c < %d", rc1(2), rc2(2));

try
    CreateStruct.Interpreter = 'tex';
    CreateStruct.WindowStyle = 'non-modal';
    msgbox({submat; rows; cols},'Assignment5, Exercise1', CreateStruct);
catch
    fprintf("%s\n%s\n", rows, cols);
end
end