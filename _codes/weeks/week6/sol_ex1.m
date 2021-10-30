function sol_ex1(idn)
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

rows = sprintf("%d < rows < %d", rc1(1), rc2(1));
cols = sprintf("%d < cols < %d", rc1(2), rc2(2));

img = imread('cameraman.png');
figure(idn);
subplot(1, 2, 1); hold on;
imshow(img);
plot([rc1(2), rc2(2), rc2(2), rc1(2), rc1(2)], [rc1(1), rc1(1), rc2(1), rc2(1), rc1(1)], 'r', 'LineWidth', 1.4);

subplot(1, 2, 2);
imshow(img(rc1(1):rc2(1), rc1(2):rc2(2)));
title(sprintf('Student ID: %d\n%s,  %s', idn, rows, cols));

end